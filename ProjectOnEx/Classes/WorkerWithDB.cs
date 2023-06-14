using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

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
    $"JOIN PerDataUsers ON persData = id_user " +
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

        public static List<Markers> GetMarkers(int mount)
        {
            List<Markers> markers = new List<Markers>();
            if (ConnectOpen())
            {
                using (SqlCommand cmd = new SqlCommand($"НАПИСАТЬ СКРИПТ", connection))
                {
                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        markers.Add(new Markers
                        {
                            Student = (string)reader.GetValue(0) + " " + (string)reader.GetValue(1), // объедтнение имени и фамилии
                            Room = (string)reader.GetValue(2),
                            Mark = (char)reader.GetValue(3),
                            Day = (int)reader.GetValue(4).
                        });
                    }
                }
                ConnectClose();
            }
        }
    }
}
