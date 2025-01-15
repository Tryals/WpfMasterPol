using Microsoft.EntityFrameworkCore;
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
using WpfMasterPol.Classes;

namespace WpfMasterPol.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageLViewMain.xaml
    /// </summary>
    public partial class PageLViewMain : Page
    {
        public PageLViewMain()
        {
            InitializeComponent();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            using (MasterPolContext polContext = new MasterPolContext())
            {
                if (Visibility == Visibility.Visible)
                {
                    polContext.ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                    LViewZayavka.ItemsSource = polContext.ViewPartners.ToList();
                }
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {

        }

        private void TxtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void RbUp_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void RbDown_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void CmbFiltr_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void BtnSaveToExcel_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnSaveToExcelTemplate_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
