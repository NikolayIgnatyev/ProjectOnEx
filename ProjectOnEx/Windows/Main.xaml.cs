using System;
using System.Collections.Generic;
using System.Data;
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

namespace ProjectOnEx
{
    /// <summary>
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Window
    {
        public Main(string role, string name, string family)
        {
            InitializeComponent();
            switch (role)
            {
                case "chair":
                    stackStud.Visibility = Visibility.Collapsed;
                    stackReport.Visibility = Visibility.Collapsed;
                    tblRole.Text = "Председатель: ";
                    break;

                case "educator":
                    stackStud.Visibility = Visibility.Collapsed;
                    tblRole.Text = "Воспитатель: ";
                    break;

                case "admin":
                    tblRole.Text = "Тех. адмистратор: ";
                    break;

                case "commandant":
                    tblRole.Text = "Комендант: ";
                    break;

                case "guest":
                    stackBtn.Visibility = Visibility.Collapsed;
                    tblRole.Text = "Гость: ";
                    this.Closing += Window_Closed;
                    dataGrid.IsReadOnly = true;
                    break;
            }
            tblName.Text = name + " ";
            tblFamily.Text = family;
        }

        public Main()
        {

        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            new Auth().Show();
            this.Close();
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            new Auth().Show();
        }

        private void Window_Initialized(object sender, EventArgs e)
        {
            cbMount.SelectedIndex = 0;
            tbYear.Text = DateTime.Now.Year.ToString();


            List<Marker> markers = new List<Marker>();
            markers.Add(new Marker { Student = "Stud123"});
            dataGrid.AutoGenerateColumns = false;
            dataGrid.Columns.Add(new DataGridTextColumn
            {
                Header = "Stud",
                Binding = new Binding("Student")
            });
            dataGrid.ItemsSource = markers;
        }
    }
}
