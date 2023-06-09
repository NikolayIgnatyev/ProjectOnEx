using ProjectOnEx.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProjectOnEx
{
    /// <summary>
    /// Логика взаимодействия для Auth.xaml
    /// </summary>
    public partial class Auth : Window
    {
        public Auth()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Validater.ValidLenght(tbLogin, 20) &&
                Validater.ValidLenght(tbPass, 24))
            {
                (bool isAuth, string role) reply = WorkerWithDB.Autorization(tbLogin.Text, tbPass.Password);
                if (reply.isAuth)
                {
                    MessageBox.Show(reply.role);
                }
            }
        }

        private void tb_MouseEnter(object sender, MouseEventArgs e)
        {
            (sender as Control).Background = new SolidColorBrush(Colors.White);
        }
    }
}
