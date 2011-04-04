using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace MediaOnDemand
{
    public partial class SiteAdministration : System.Web.UI.Page
    {
        #region Private Fields
        static string query = "";

        public StorageMediaDataContext dataContext
        {
            get
            {
                return new StorageMediaDataContext();
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.txtSQLQuery.Text = "";
                this.lblErrors.Text = "";
                this.SqlDataSource.SelectCommand = "";
                this.SqlDataSource.DataBind();
                this.gvQueryResults.DataBind();
            }
        }

        protected void btnExecuteQuery_Click(object sender, EventArgs e)
        {
            string query = this.txtSQLQuery.Text;
            SqlCommand cmd;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["aspnetdbConnectionString"].ConnectionString))
            {
                conn.Open();

                cmd = new SqlCommand(query, conn);

                try
                {
                    if (query.StartsWith("select"))
                    {
                        this.SqlDataSource.SelectCommand = query;
                        this.SqlDataSource.DataBind();
                        this.gvQueryResults.DataBind();
                    }
                    else
                    {
                        int recsAffective = cmd.ExecuteNonQuery();
                    }

                    this.lblErrors.ForeColor = Color.Green;
                    this.lblErrors.Text = "Query ran successfully";
                }
                catch (SqlException ex)
                {
                    this.lblErrors.ForeColor = Color.Red;
                    this.lblErrors.Text = ex.ToString();
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}