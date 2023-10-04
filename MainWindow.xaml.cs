using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace MMSpeedrunTool
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static string ManicMinersFolderPath => System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "ManicMiners/Saved/SaveGames");
        public static string SaveGamesFolderPath => System.IO.Path.GetDirectoryName(Environment.ProcessPath) + "\\SaveGames";

        public static readonly List<string> MinerNames = new()
        {
            "Boulder Bolt",
            "Dash Dynamo",
            "Flint Flash",
            "Granite Sprinter",
            "Rapid Rammer",
            "Rockjet Racer",
            "Rocky Rocket",
            "Speedquake Steve",
            "Speedrunner",
            "Swift Shaft",
            "Turbo Tunnelman"
        };

        public MainWindow()
        {
            InitializeComponent();

            UpdateLocatedFiles();
        }

        private void ButtonStart_Click(object sender, RoutedEventArgs e)
        {
            string manicMinersFolderPath = System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "ManicMiners");

            bool folderExists = Directory.Exists(manicMinersFolderPath);

            ((Button)sender).Content = folderExists.ToString();
        }

        private void ButtonInstallSpeedrunnerProfile_Click(object sender, RoutedEventArgs e)
        {
            CreateSettingsBackup();

            try
            {
                if (!Directory.Exists(SaveGamesFolderPath))
                {
                    InstallSpeedrunnerProfileError.Text = "SaveGames folder path does not exist";
                    InstallSpeedrunnerProfileError.Foreground = Brushes.Red;
                }
                else if (!Directory.Exists(ManicMinersFolderPath))
                {
                    InstallSpeedrunnerProfileError.Text = "ManicMiners folder path does not exist in Local";
                    InstallSpeedrunnerProfileError.Foreground = Brushes.Red;
                }
                else
                {
                    CopyDirectory(SaveGamesFolderPath, ManicMinersFolderPath);
                }
            }
            catch (Exception exception)
            {
                InstallSpeedrunnerProfileError.Text = "An error occured: " + exception.Message;
                InstallSpeedrunnerProfileError.Foreground = Brushes.Red;

                return;
            }

            UpdateLocatedFiles();
        }

        private void ButtonInstallSettings_Click(object sender, RoutedEventArgs e)
        {
            CreateSettingsBackup();

            try
            {
                if (!Directory.Exists(SaveGamesFolderPath))
                {
                    InstallSpeedrunnerProfileError.Text = "SaveGames folder path does not exist";
                    InstallSpeedrunnerProfileError.Foreground = Brushes.Red;
                }
                else if (!Directory.Exists(ManicMinersFolderPath))
                {
                    InstallSpeedrunnerProfileError.Text = "ManicMiners folder path does not exist in Local";
                    InstallSpeedrunnerProfileError.Foreground = Brushes.Red;
                }
                else
                {
                    File.Copy(SaveGamesFolderPath + "/ManicMinersSettings.sav", ManicMinersFolderPath + "/ManicMinersSettings.sav", true);
                }
            }
            catch (Exception exception)
            {
                InstallSettingsError.Text = "An error occured: " + exception.Message;
                InstallSettingsError.Foreground = Brushes.Red;

                return;
            }

            UpdateLocatedFiles();
        }

        private void ButtonRevertSettings_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Directory.Exists(ManicMinersFolderPath) && ManicMinersSettingsBackupExists())
                {
                    File.Copy(ManicMinersFolderPath + "/ManicMinersSettingsBACKUP.sav", ManicMinersFolderPath + "/ManicMinersSettings.sav", true);

                    File.Delete(ManicMinersFolderPath + "/ManicMinersSettingsBACKUP.sav");
                }
            }
            catch (Exception exception)
            {
                InstallSpeedrunnerProfileError.Text = "An error occured: " + exception.Message;
                InstallSpeedrunnerProfileError.Foreground = Brushes.Red;

                return;
            }

            UpdateLocatedFiles();

            RevertSettingsError.Text = "Settings have been reverted back to your own settings";
            RevertSettingsError.Foreground = Brushes.Green;
        }

        private void ButtonRemoveSpeedrunnerProfile_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                RemoveMinerFiles();
                RemoveSpeedrunnerProfileFile();
            }
            catch (Exception exception)
            {
                RemoveSpeedrunnerProfileError.Text = "An error occured: " + exception.Message;
                RemoveSpeedrunnerProfileError.Foreground = Brushes.Red;

                return;
            }

            RemoveSpeedrunnerProfileError.Text = "Max miners have been removed. You will have to manually delete the Speedrunner profile if it still exists.";
            InstallSpeedrunnerProfileError.Foreground = Brushes.Green;

            UpdateLocatedFiles();
        }

        private void ButtonExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void UpdateLocatedFiles()
        {
            if (File.Exists(ManicMinersFolderPath + "/Profiles/Speedrunner.sav") && MinersExist())
            {
                btnInstallSpeedrunnerProfile.IsEnabled = false;
                btnRemoveSpeedrunnerProfile.IsEnabled = true;

                InstallSpeedrunnerProfileError.Text = "Speedrunner profile has been installed";
                InstallSpeedrunnerProfileError.Foreground = Brushes.Green;

                RemoveSpeedrunnerProfileError.Text = "";
            }
            else
            {
                btnInstallSpeedrunnerProfile.IsEnabled = true;
                btnRemoveSpeedrunnerProfile.IsEnabled = false;

                if (InstallSpeedrunnerProfileError.Text.Equals("Speedrunner profile has been installed"))
                    InstallSpeedrunnerProfileError.Text = "";
            }

            if (ManicMinersSettingsBackupExists())
            {
                btnInstallSettings.IsEnabled = false;

                InstallSettingsError.Text = "Settings has been installed";
                InstallSettingsError.Foreground = Brushes.Green;
            }
            else
            {
                btnInstallSettings.IsEnabled = true;

                if (InstallSettingsError.Text.Equals("Settings has been installed"))
                    InstallSettingsError.Text = "";
            }

            btnRevertSettings.IsEnabled = ManicMinersSettingsBackupExists();

            RevertSettingsError.Text = "";
        }

        private void CopyDirectory(string source, string destination)
        {
            Directory.CreateDirectory(destination);

            foreach (string file in Directory.GetFiles(source))
            {
                string destFile = System.IO.Path.Combine(destination, System.IO.Path.GetFileName(file));

                File.Copy(file, destFile, true);
            }

            foreach (string dir in Directory.GetDirectories(source))
            {
                string destDir = System.IO.Path.Combine(destination, System.IO.Path.GetFileName(dir));

                CopyDirectory(dir, destDir);
            }
        }

        private bool MinersExist()
        {
            foreach (string minerName in MinerNames)
            {
                if (!File.Exists(ManicMinersFolderPath + "/Miners/" + minerName + ".sav"))
                    return false;
            }

            return true;
        }

        private bool ManicMinersSettingsExists()
        {
            return File.Exists(ManicMinersFolderPath + "/ManicMinersSettings.sav");
        }

        private bool ManicMinersSettingsBackupExists()
        {
            return File.Exists(ManicMinersFolderPath + "/ManicMinersSettingsBACKUP.sav");
        }

        private void RemoveMinerFiles()
        {
            foreach (string minerName in MinerNames)
            {
                File.Delete(ManicMinersFolderPath + "/Miners/" + minerName + ".sav");
            }
        }

        private void RemoveSpeedrunnerProfileFile()
        {
            File.Delete(ManicMinersFolderPath + "/Profiles/Speedrunner.sav");

            File.Delete(ManicMinersFolderPath + "/Backup/Profiles/Speedrunner.sav");
        }

        private void CreateSettingsBackup()
        {
            if (!ManicMinersSettingsBackupExists())
            {
                try
                {
                    if (Directory.Exists(ManicMinersFolderPath) && ManicMinersSettingsExists())
                    {
                        File.Copy(ManicMinersFolderPath + "/ManicMinersSettings.sav", ManicMinersFolderPath + "/ManicMinersSettingsBACKUP.sav");
                    }
                }
                catch (Exception exception)
                {
                    InstallSpeedrunnerProfileError.Text = "An error occured: " + exception.Message;
                    InstallSpeedrunnerProfileError.Foreground = Brushes.Red;

                    return;
                }
            }
        }
    }
}
