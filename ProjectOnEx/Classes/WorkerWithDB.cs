using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace ProjectOnEx.Classes
{
    internal static class WorkerWithDB
    {
        public static string connectString = "Server=DESKTOP-P6NFPNI\\SQLEXPRESS;Database=Exam;Trusted_Connection=True;";
        public static SqlConnection connection = new SqlConnection(connectString);

        public static void ConnectOpen()
        {
            connection.Open();
        }

        public static void ConnectClose()
        {
            connection.Close();
        }

        public static (bool auth, string role) Autorization(string login, string password)
        {
            string role = "";
            ConnectOpen();
            using(SqlCommand cmd = new SqlCommand($"SELECT * FROM Users WHERE login='{login}' AND password='{password}';", connection))
            {
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine(role);
                    role = (string)reader.GetValue(2);
                }
            }
            ConnectClose();
            if (role != "")
            {
                return (true,role);
            }
            else
            {
                return (false,null);
            }
        }
    }
}
