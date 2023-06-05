using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace ProjectOnEx.Classes
{
    public static class Validater
    {
        public static bool ValidLenght(TextBox textBox, int valLength)
        {
            if (textBox.Text.Length > 0)
            {
                if (textBox.Text.Length <= valLength)
                {
                    return true;
                }
                else
                {
                    MessageBox.Show($"Длина не должна превышать {valLength} символов");
                    textBox.Background = new SolidColorBrush(Colors.LightCoral);
                    return false;
                }
            }
            else
            {
                MessageBox.Show($"Заполните поле");
                textBox.Background = new SolidColorBrush(Colors.LightCoral);
                return false;
            }
        }

        public static bool ValidLenght(PasswordBox pasBox, int valLength)
        {
            if (pasBox.Password.Length> 0)
            {
                if (pasBox.Password.Length <= valLength)
                {
                    return true;
                }
                else
                {
                    MessageBox.Show($"Длина не должна превышать {valLength} символов");
                    pasBox.Background = new SolidColorBrush(Colors.LightCoral);
                    return false;
                }
            }
            else
            {
                MessageBox.Show($"Заполните поле");
                pasBox.Background = new SolidColorBrush(Colors.LightCoral);
                return false;
            }
        }
    }
}
