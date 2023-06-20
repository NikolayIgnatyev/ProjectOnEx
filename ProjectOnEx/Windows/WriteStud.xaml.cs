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
using System.Windows.Shapes;
using ProjectOnEx.Classes;

namespace ProjectOnEx.Windows
{
    /// <summary>
    /// Логика взаимодействия для WriteStud.xaml
    /// </summary>
    public partial class WriteStud : Window
    {
        public WriteStud()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Validater.ValidLenght(tbName, 50) & 
                Validater.ValidLenght(tbFamily, 50))
            {
                if (int.TryParse(tbRoom.Text, out _))
                {
                    if (WorkerWithDB.WriteStud(tbName.Text, tbFamily.Text, tbRoom.Text))
                    {
                        MessageBox.Show("Студент успешно записан!", "Успех",
                            MessageBoxButton.OK, MessageBoxImage.Information);
                        tbName.Text = "";
                        tbFamily.Text = "";
                        tbRoom.Text = "";
                    }
                    else
                    {
                        MessageBox.Show("Ошибка при записи!", "Ошибка",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else
                {
                    MessageBox.Show("Неверная запись комнаты",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                    tbRoom.Text = "";
                }
            }
        }
    }
}
