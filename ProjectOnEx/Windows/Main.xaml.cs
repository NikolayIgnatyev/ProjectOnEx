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
        public int countDays = 0;
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

            dataGrid.AutoGenerateColumns = false;

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            int year = 0;
            int mount = 1;
            try
            {
                year = int.Parse(tbYear.Text);
                mount = cbMount.SelectedIndex + 1;
                CreateTable(year, mount);
            }
            catch
            {
                MessageBox.Show("Неверный формат года!\n" +
    "Необходимый формат: 'ГГГГ'",
    "Ошибка",
    MessageBoxButton.OK,
    MessageBoxImage.Error);
                return;
            }
            List<Markers> markers = WorkerWithDB.GetMarkers(mount, year);
            countDays = DateTime.DaysInMonth(year, mount);
            dataGrid.ItemsSource =  GetItemSource(markers).AsDataView();
        }

        public DataTable GetItemSource(List<Markers> marks)
        {
            DataTable dataTable = new DataTable();

            dataTable.Columns.Add(new DataColumn("Комната"));
            dataTable.Columns.Add(new DataColumn("Студент"));

            for (int i = 1; i < countDays + 1; i++)
            {
                dataTable.Columns.Add(i.ToString());
            }

            for (int j = 0; j < marks.Count; j++)
            {
                dataTable.Rows.Add();
                dataTable.Rows[j]["Комната"] = marks[j].Room;
                dataTable.Rows[j]["Студент"] = marks[j].Student;
                dataTable.Rows[j][marks[j].Day + 1] = marks[j].Mark;
            }

            return dataTable;

        }

        public void CreateTable(int year, int mount)
        {
            dataGrid.Columns.Clear();
            dataGrid.Columns.Add(new DataGridTextColumn
            {
                Header = "Комната",
                Binding = new Binding("Комната")
            });
            dataGrid.Columns.Add(new DataGridTextColumn
            {
                Header = "Студент",
                Binding = new Binding("Студент")
            });
            countDays = DateTime.DaysInMonth(year, mount);

            for (int i = 1; i <= countDays; i++)
            {
                dataGrid.Columns.Add(new DataGridTextColumn
                {
                    Header = i,
                    Binding = new Binding(i.ToString())
                });
            }
        }
    }
}
