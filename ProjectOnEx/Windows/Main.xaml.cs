using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Diagnostics.Contracts;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Xml.Linq;
using Aspose.Cells;
using Microsoft.Win32;
using OfficeOpenXml;
using ProjectOnEx.Classes;
using ProjectOnEx.Windows;

namespace ProjectOnEx
{
    /// <summary>
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Window
    {
        public int countDays = 0;

        #region Constructs
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
                    tblRole.Text = "";
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
        #endregion

        #region Loaded, Init, Closed, methods
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
            dataTable.Columns["Студент"].Unique = true;

            for (int i = 1; i < countDays + 1; i++)
            {
                dataTable.Columns.Add(i.ToString());
            }

            int u = 0;
            for (int j = 0; j < marks.Count; j++)
            {
                try
                {
                    dataTable.Rows.Add();
                    dataTable.Rows[u]["Комната"] = marks[j].Room;
                    dataTable.Rows[u]["Студент"] = marks[j].Student;
                    dataTable.Rows[u][marks[j].Day + 1] = marks[j].Mark;
                    u++;
                }
                catch
                {
                    dataTable.Rows[u][marks[j].Day + 1] = marks[j].Mark;
                }

            }

            return dataTable;

        }

        public void CreateTable(int year, int mount)
        {
            dataGrid.Columns.Clear();
            dataGrid.Columns.Add(new DataGridTextColumn
            {
                Header = "Комната",
                Binding = new Binding("Комната"),
            });
            dataGrid.Columns.Add(new DataGridTextColumn
            {
                Header = "Студент",
                Binding = new Binding("Студент"),
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

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Button_Click(null, null);
        }

        #endregion

        #region Button evets
        private void btnWriteStud_Click(object sender, RoutedEventArgs e)
        {
            new WriteStud().Show();
        }

        private void btnRemoveStud_Click(object sender, RoutedEventArgs e)
        {
            if (dataGrid.SelectedIndex >= 0)
            { 
                string[] nameFamily = ((DataRowView)dataGrid.SelectedItems[0]).Row.ItemArray[1].ToString().Split(' ');
                string name = nameFamily[0];
                string family = nameFamily[1];

                if (WorkerWithDB.RemoveStud(name, family))
                {
                    MessageBox.Show("Запись успешна удаленна", "Успех",
                        MessageBoxButton.OK, MessageBoxImage.Information);
                    Button_Click(null, null); // Для обновления таблицы
                }
                else
                {
                    MessageBox.Show("Ошбика при удалении", "Ошибка",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Не выбран студент", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ExportInExcel(DataGrid grid, string path)
        {
            grid.SelectAllCells();
            grid.ClipboardCopyMode = DataGridClipboardCopyMode.IncludeHeader;
            ApplicationCommands.Copy.Execute(null, grid);
            grid.UnselectAllCells();
            String result = (string)Clipboard.GetData(DataFormats.CommaSeparatedValue);
            try
            {
                File.WriteAllText(@"file.csv", result);

                // Вот найти рабочую библеотеку и правильно использовать тоже дело так что не надо тут
                TxtLoadOptions loadOptions = new TxtLoadOptions(LoadFormat.Csv);
                loadOptions.IsMultiEncoded = true;
                Workbook workbook = new Workbook("file.csv", loadOptions);

                workbook.Save($"{path}", SaveFormat.Xlsx);
                FileInfo file = new FileInfo($"{path}");
                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                using (ExcelPackage exPack = new ExcelPackage(file))
                {
                    ExcelWorksheet ws1 = exPack.Workbook.Worksheets[1];
                    exPack.Workbook.Worksheets.Delete(ws1);
                    exPack.Save();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                MessageBox.Show(ex.ToString());
            }
        }

        private void btnFormReport_Click(object sender, RoutedEventArgs e)
        {
            
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.FileName = $"Посещаемость за {(cbMount.SelectedItem as TextBlock).Text} {tbYear.Text} год";
            saveFileDialog.Filter = "Книга Excel (*.xls)|*.xls";
            saveFileDialog.DefaultExt = ".xls";
            if (saveFileDialog.ShowDialog() == true)
            {
                ExportInExcel(dataGrid, saveFileDialog.FileName);
            }
            
        }
        // цыганские фокусы с магическими цифрами и танцами с бубном, кучей условий и циклов)))
        private void btnSaveEdit_Click(object sender, RoutedEventArgs e)
        {
            string room = "", name = "", family = "";
            DateTime date = new DateTime();
            int year = int.Parse(tbYear.Text);
            int mount = cbMount.SelectedIndex + 1;
            List<TableMarks> markers = new List<TableMarks>();
            for (int i = 0; i < dataGrid.Items.Count; i++)
            {
                room = ""; name = ""; family = "";
                for (int j = 0; j < ((DataRowView)dataGrid.Items[i]).Row.ItemArray.Length; j++)
                {
                    if (j == 0)
                    {
                        room = (((DataRowView)dataGrid.Items[i]).Row.ItemArray[0].ToString());
                        Console.WriteLine("room");
                    }
                    else if (j == 1)
                    {
                        string[] nameFamily = ((DataRowView)dataGrid.Items[i]).Row.ItemArray[1].ToString().Split(' ');
                        name = nameFamily[0];
                        family = nameFamily[1];
                        Console.WriteLine("stud");
                    }
                    else
                    {
                        if (((DataRowView)dataGrid.Items[i]).Row.ItemArray[j - 1].ToString() != "")
                        {
                            Console.WriteLine($"not null {j}");
                            date = new DateTime(year, mount, j - 1);
                            if (Validater.IsChar(((DataRowView)dataGrid.Items[i]).Row.ItemArray[j - 1].ToString()))
                            {
                                Console.WriteLine("is char");
                                markers.Add(new TableMarks
                                {
                                    Name = name,
                                    Family = family,
                                    Room = room,
                                    Date = date,
                                    Mark = Convert.ToChar(((DataRowView)dataGrid.Items[i]).Row.ItemArray[j - 1].ToString())
                                });
                            }
                        }
                    }
                }
            }

            if (WorkerWithDB.WriteMount(markers))
            {
                MessageBox.Show("Изменения сохранены", "Успех",
                    MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                MessageBox.Show("Ошибка при сохранении", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        #endregion
    }
}
