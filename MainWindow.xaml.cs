﻿using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfMasterPol
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Classes.ClsFrame.frmObj = frmMain;
            Classes.ClsFrame.frmObj.Navigate(new Pages.PageLViewMain());
        }

        private void frmMain_ContentRendered(object sender, EventArgs e)
        {

        }
    }
}