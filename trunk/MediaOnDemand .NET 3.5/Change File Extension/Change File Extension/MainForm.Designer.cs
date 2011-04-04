namespace Change_File_Extension
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnChangeExt = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.txtFile = new System.Windows.Forms.TextBox();
            this.txtExt = new System.Windows.Forms.TextBox();
            this.lblFile = new System.Windows.Forms.Label();
            this.lblExt = new System.Windows.Forms.Label();
            this.folderBrowserDialog = new System.Windows.Forms.FolderBrowserDialog();
            this.btnBrowse = new System.Windows.Forms.Button();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.radioButtonFile = new System.Windows.Forms.RadioButton();
            this.radioButtonFolder = new System.Windows.Forms.RadioButton();
            this.lblFromExt = new System.Windows.Forms.Label();
            this.txtFromExt = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnChangeExt
            // 
            this.btnChangeExt.Enabled = false;
            this.btnChangeExt.Location = new System.Drawing.Point(168, 118);
            this.btnChangeExt.Name = "btnChangeExt";
            this.btnChangeExt.Size = new System.Drawing.Size(75, 23);
            this.btnChangeExt.TabIndex = 0;
            this.btnChangeExt.Text = "Change Ext";
            this.btnChangeExt.UseVisualStyleBackColor = true;
            this.btnChangeExt.Click += new System.EventHandler(this.btnChangeExt_Click);
            // 
            // btnClear
            // 
            this.btnClear.Enabled = false;
            this.btnClear.Location = new System.Drawing.Point(249, 118);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(75, 23);
            this.btnClear.TabIndex = 1;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // txtFile
            // 
            this.txtFile.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtFile.Location = new System.Drawing.Point(53, 51);
            this.txtFile.Name = "txtFile";
            this.txtFile.Size = new System.Drawing.Size(233, 20);
            this.txtFile.TabIndex = 2;
            this.txtFile.TextChanged += new System.EventHandler(this.txtFile_TextChanged);
            // 
            // txtExt
            // 
            this.txtExt.Location = new System.Drawing.Point(210, 84);
            this.txtExt.Name = "txtExt";
            this.txtExt.Size = new System.Drawing.Size(106, 20);
            this.txtExt.TabIndex = 3;
            this.txtExt.TextChanged += new System.EventHandler(this.txtExt_TextChanged);
            // 
            // lblFile
            // 
            this.lblFile.AutoSize = true;
            this.lblFile.Location = new System.Drawing.Point(11, 54);
            this.lblFile.Name = "lblFile";
            this.lblFile.Size = new System.Drawing.Size(29, 13);
            this.lblFile.TabIndex = 4;
            this.lblFile.Text = "File: ";
            // 
            // lblExt
            // 
            this.lblExt.AutoSize = true;
            this.lblExt.Location = new System.Drawing.Point(176, 87);
            this.lblExt.Name = "lblExt";
            this.lblExt.Size = new System.Drawing.Size(28, 13);
            this.lblExt.TabIndex = 5;
            this.lblExt.Text = "Ext: ";
            // 
            // btnBrowse
            // 
            this.btnBrowse.Location = new System.Drawing.Point(292, 49);
            this.btnBrowse.Name = "btnBrowse";
            this.btnBrowse.Size = new System.Drawing.Size(33, 23);
            this.btnBrowse.TabIndex = 6;
            this.btnBrowse.Text = "...";
            this.btnBrowse.UseVisualStyleBackColor = true;
            this.btnBrowse.Click += new System.EventHandler(this.btnBrowse_Click);
            // 
            // radioButtonFile
            // 
            this.radioButtonFile.AutoSize = true;
            this.radioButtonFile.Checked = true;
            this.radioButtonFile.Location = new System.Drawing.Point(14, 12);
            this.radioButtonFile.Name = "radioButtonFile";
            this.radioButtonFile.Size = new System.Drawing.Size(41, 17);
            this.radioButtonFile.TabIndex = 7;
            this.radioButtonFile.TabStop = true;
            this.radioButtonFile.Text = "File";
            this.radioButtonFile.UseVisualStyleBackColor = true;
            this.radioButtonFile.CheckedChanged += new System.EventHandler(this.radioButtonFile_CheckedChanged);
            // 
            // radioButtonFolder
            // 
            this.radioButtonFolder.AutoSize = true;
            this.radioButtonFolder.Location = new System.Drawing.Point(61, 12);
            this.radioButtonFolder.Name = "radioButtonFolder";
            this.radioButtonFolder.Size = new System.Drawing.Size(54, 17);
            this.radioButtonFolder.TabIndex = 8;
            this.radioButtonFolder.Text = "Folder";
            this.radioButtonFolder.UseVisualStyleBackColor = true;
            this.radioButtonFolder.CheckedChanged += new System.EventHandler(this.radioButtonFolder_CheckedChanged);
            // 
            // lblFromExt
            // 
            this.lblFromExt.AutoSize = true;
            this.lblFromExt.Location = new System.Drawing.Point(2, 87);
            this.lblFromExt.Name = "lblFromExt";
            this.lblFromExt.Size = new System.Drawing.Size(53, 13);
            this.lblFromExt.TabIndex = 10;
            this.lblFromExt.Text = "Filter Ext: ";
            // 
            // txtFromExt
            // 
            this.txtFromExt.Enabled = false;
            this.txtFromExt.Location = new System.Drawing.Point(64, 84);
            this.txtFromExt.Name = "txtFromExt";
            this.txtFromExt.Size = new System.Drawing.Size(106, 20);
            this.txtFromExt.TabIndex = 9;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(328, 144);
            this.Controls.Add(this.lblFromExt);
            this.Controls.Add(this.txtFromExt);
            this.Controls.Add(this.radioButtonFolder);
            this.Controls.Add(this.radioButtonFile);
            this.Controls.Add(this.btnBrowse);
            this.Controls.Add(this.lblExt);
            this.Controls.Add(this.lblFile);
            this.Controls.Add(this.txtExt);
            this.Controls.Add(this.txtFile);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnChangeExt);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.MaximizeBox = false;
            this.Name = "MainForm";
            this.Text = "Change File Extension";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnChangeExt;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.TextBox txtFile;
        private System.Windows.Forms.TextBox txtExt;
        private System.Windows.Forms.Label lblFile;
        private System.Windows.Forms.Label lblExt;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog;
        private System.Windows.Forms.Button btnBrowse;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.RadioButton radioButtonFile;
        private System.Windows.Forms.RadioButton radioButtonFolder;
        private System.Windows.Forms.Label lblFromExt;
        private System.Windows.Forms.TextBox txtFromExt;
    }
}

