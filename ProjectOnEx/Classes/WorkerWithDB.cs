using System;
using System.Collections.Generic;
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
        public static string connectString = "Server=DESKTOP-P6NFPNI\\SQLEXPRESS;Database=Exam;Trusted_Connection=True;";
        public static SqlConnection connection = new SqlConnection(connectString);

        public static bool ConnectOpen()
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

        public static void ConnectClose()
        {
            connection.Close();
        }

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
    }
}
