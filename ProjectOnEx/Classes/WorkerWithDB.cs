using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Xml.Linq;

namespace ProjectOnEx.Classes
{
    internal static class WorkerWithDB
    {
        #region Private
        private static string connectString = "Server=DESKTOP-P6NFPNI\\SQLEXPRESS;Database=Exam;Trusted_Connection=True;";
        private static SqlConnection connection = new SqlConnection(connectString);

        private static bool ConnectOpen()
        {
            try
            {
                connection.Open();
                return true;
            }
            catch
            {
                MessageBox.Show("Не удается установить соединение с базой данных!",
                    "Ошибка",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
                return false;
            }
            
        }

        private static void ConnectClose()
        {
            connection.Close();
        }

        private static int GetIdRoom(string Room)
        {
            int id = 0;
            if (ConnectOpen())
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT IDRoom FROM Rooms WHERE numRoom = '{Room}'", connection))
                {
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        id = (int)reader.GetValue(0);
                    }
                }
                ConnectClose();
            }
            return id;
        }

        private static int GetIdStident(string Name, string Family)
        {
            int id = 0;
            if (ConnectOpen())
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT IDStudent " +
                    $"FROM Students " +
                    $"WHERE name = '{Name}' AND " +
                    $"family = '{Family}'", connection))
                {
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        id = (int)reader.GetValue(0);
                    }
                }
                ConnectClose();
            }
            return id;
        }

        private static bool RemoveAllMarksStudent(int idStudent)
        {
            if (ConnectOpen())
            {
                using (SqlCommand cmd = new SqlCommand($"DELETE FROM Markers WHERE id_Student = {idStudent}", connection))
                {
                    int result = cmd.ExecuteNonQuery();
                    if (result < 0)
                    {
                        return false;
                    }
                }
                ConnectClose();
            }
            return true;
        }

        #endregion
        public static (
            bool auth, 
            string role,
            string name,
            string family) Autorization(string login, string password)
        {
            string role = "", name = "", family = "";
            if (ConnectOpen())
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT role, name, family " +
    $"FROM Users " +
    $"JOIN PerDataUsers ON persData = IDPerDataUser " +
    $"WHERE login='{login}' AND password='{password}';", connection))
                {
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        role = (string)reader.GetValue(0);
                        name = (string)reader.GetValue(1);
                        family = (string)reader.GetValue(2);
                    }
                }
                ConnectClose();
            }

            if (role != "")
            {
                return (true, role, name, family);
            }
            else
            {
                return (false, null, null , null);
            }
        }

        public static List<Markers> GetMarkers(int mount, int year)
        {
            List<Markers> markers = new List<Markers>();
            if (ConnectOpen())
            {
                int endmount = mount + 1;
                int endyear = year;
                if (mount == 12)
                {
                    endmount = 1;
                    endyear += 1;
                } // SQL Б***Ь Е*****Е ПРОБЕЛЫ
                using (SqlCommand cmd = new SqlCommand($"DECLARE " +
                    $"@startdate datetime = '01-{mount}-{year}', " +
                    $"@enddate datetime = '01-{endmount}-{endyear}' " +
                    $"SELECT name, family, numRoom, date, mark " +
                    $"FROM Markers " +
                    $"JOIN Students ON id_Student = IDStudent " +
                    $"JOIN Rooms ON id_Room = IDRoom " +
                    $"WHERE date >= @startdate AND date < @enddate", connection))
                {
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        markers.Add(new Markers
                        {
                            Student = reader.GetString(0) + " " + reader.GetString(1),
                            Room = reader.GetString(2),
                            Day = DateTime.Parse(reader.GetValue(3).ToString()).Day,
                            Mark = Convert.ToChar(reader.GetValue(4))
                        });
                    }
                }
                ConnectClose();
                return markers;
            }
            return null;
        }

        public static bool WriteStud(string Name, string Family, string Room)
        {
            int idRoom = GetIdRoom(Room);

            if (ConnectOpen())
            {
                using (SqlCommand cmd = new SqlCommand($"INSERT INTO " +
                    $"Students (name, family, id_Room) " +
                    $"VALUES ('{Name}', '{Family}', {idRoom})", connection))
                {
                    int result = cmd.ExecuteNonQuery();
                    if (result < 0)
                    {
                        return false;
                    }
                }
                ConnectClose();
            }
            return true;
        }

        public static bool RemoveStud(string Name, string Family)
        {
            int idStudent = GetIdStident(Name, Family);
            if (RemoveAllMarksStudent(idStudent))
            {
                if (ConnectOpen())
                {
                    using (SqlCommand cmd = new SqlCommand($"DELETE FROM Students " +
                        $"WHERE name = '{Name}' AND family = '{Family}'", connection))
                    {
                        int result = cmd.ExecuteNonQuery();
                        if (result < 0)
                        {
                            return false;
                        }
                    }
                    ConnectClose();
                }
            }
            return true;
        }

        public static bool WriteMount(List<TableMarks> marks)
        {
            if (ConnectOpen())
            {
                string query = "";

                foreach (var mark in marks)
                {
                    query += $"INSERT INTO Markers (id_Student, date, mark) " +
                    $"VALUES ((SELECT IDStudent FROM Students WHERE name = '{mark.Name}' AND family = '{mark.Family}'), " +
                    $"'{mark.Date}', " +
                    $"'{mark.Mark}'); \t\n";
                }

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    int result = cmd.ExecuteNonQuery();
                    if (result < 0)
                    {
                        return false;
                    }
                }
                ConnectClose();
            }
            return true;
        }
    }
}
