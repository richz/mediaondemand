using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace Change_File_Extension
{
    public partial class MainForm : Form
    {
        private bool fileSelected;

        public MainForm()
        {
            InitializeComponent();

            this.fileSelected = true;
        }

        private void btnChangeExt_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(this.txtExt.Text) && !String.IsNullOrEmpty(this.txtFile.Text))
            {
                string fileOrDir = this.txtFile.Text;
                string ext = this.txtExt.Text.StartsWith(".") ? this.txtExt.Text : String.Format(".{0}", this.txtExt.Text);

                if (File.Exists(fileOrDir) || Directory.Exists(fileOrDir))
                {
                    FileAttributes attr = File.GetAttributes(fileOrDir);

                    if (!fileSelected)
                    {
                        bool error = false;

                        string[] files = Directory.GetFiles(fileOrDir, String.Format("*.{0}", this.txtFromExt.Text), SearchOption.AllDirectories);

                        foreach (string file in files)
                        {
                            try
                            {
                                string newPath = Path.ChangeExtension(file, ext);
                                File.Move(file, newPath);
                            }
                            catch (Exception ex)
                            {
                                error = true;
                            }
                        }

                        if (error)
                            MessageBox.Show("An error ocurred, at least one file may be in use", "Error");
                    }
                    else
                    {
                        try
                        {
                            string newPath = Path.ChangeExtension(fileOrDir, ext);
                            File.Move(fileOrDir, newPath);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("An error ocurred, file may be in use", "Error");
                        }
                    }
                }
            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        private void txtFile_TextChanged(object sender, EventArgs e)
        {
            SetButtonEnabledProperty();
        }

        private void txtExt_TextChanged(object sender, EventArgs e)
        {
            SetButtonEnabledProperty();
        }

        private void SetButtonEnabledProperty()
        {
            if (!String.IsNullOrEmpty(this.txtExt.Text) || !String.IsNullOrEmpty(this.txtFile.Text))
            {
                this.btnChangeExt.Enabled = true;
                this.btnClear.Enabled = true;
            }
            else if (String.IsNullOrEmpty(this.txtExt.Text) && String.IsNullOrEmpty(this.txtFile.Text))
            {
                this.btnChangeExt.Enabled = false;
                this.btnClear.Enabled = false;
            }
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            if (fileSelected)
            {
                if (this.openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    this.txtFile.Text = openFileDialog.FileName;
                    this.txtFromExt.Text = Path.GetExtension(this.txtFile.Text);

                }
            }
            else
            {
                if (this.folderBrowserDialog.ShowDialog() == DialogResult.OK)
                {
                    this.txtFile.Text = this.folderBrowserDialog.SelectedPath;
                }
            }
        }

        private void ClearFields()
        {
            this.txtFile.Text = "";
            this.txtExt.Text = "";
            this.txtFromExt.Text = "";
        }

        private void radioButtonFile_CheckedChanged(object sender, EventArgs e)
        {
            this.fileSelected = true;
            this.lblFile.Text = "File: ";
            this.txtFromExt.Enabled = false;
            ClearFields();
        }

        private void radioButtonFolder_CheckedChanged(object sender, EventArgs e)
        {
            this.fileSelected = false;
            this.lblFile.Text = "Folder: ";
            this.txtFromExt.Enabled = true;
            ClearFields();
        }
    }
}
