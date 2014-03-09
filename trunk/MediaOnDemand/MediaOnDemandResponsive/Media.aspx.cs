using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand
{
    public partial class Media : System.Web.UI.Page
    {
        protected string postBackStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");               
            }
            
            MediaSQLDataSource.SelectParameters.Clear();
            MediaSQLDataSource.SelectParameters.Add("mediaType", Request.QueryString["Type"]);
            MediaSQLDataSource.SelectParameters["mediaType"].DefaultValue = Request.QueryString["Type"];

            MediaSQLDataSource.SelectCommand += " and medMediaType = @mediaType";

            switch (Request.QueryString["Type"])
            {
                case "movie":
                    {
                        MediaSQLDataSource.SelectParameters.Add("mediaGenre", Request.QueryString["Genre"]);
                        MediaSQLDataSource.SelectParameters["mediaGenre"].DefaultValue = Request.QueryString["Genre"];

                        MediaSQLDataSource.SelectCommand += " and medGenre = @mediaGenre";

                        this.gvMedia.Columns[8].Visible = true;
                    }
                    break;
                case "tv":
                    {
                        MediaSQLDataSource.SelectParameters.Add("mediaAlbum", Request.QueryString["Series"]);
                        MediaSQLDataSource.SelectParameters["mediaAlbum"].DefaultValue = Request.QueryString["Series"];

                        MediaSQLDataSource.SelectCommand += " and medAlbum = @mediaAlbum";
                                                
                        this.gvMedia.Columns[11].Visible = true;
                        this.gvMedia.Columns[8].Visible = true;
                        this.gvMedia.Columns[8].HeaderText = "Season";
                    }
                    break;
                case "music":
                    {
                        MediaSQLDataSource.SelectParameters.Add("mediaArtist", Request.QueryString["Artist"]);
                        MediaSQLDataSource.SelectParameters["mediaArtist"].DefaultValue = Request.QueryString["Artist"];

                        MediaSQLDataSource.SelectCommand += " and medArtist = @mediaArtist";

                        this.gvMedia.Columns[5].Visible = true;
                        this.gvMedia.Columns[11].Visible = true;
                    }
                    break;
                case "musicvideo":
                    {
                        MediaSQLDataSource.SelectParameters.Add("mediaArtist", Request.QueryString["Artist"]);
                        MediaSQLDataSource.SelectParameters["mediaArtist"].DefaultValue = Request.QueryString["Artist"];

                        MediaSQLDataSource.SelectCommand += " and medArtist = @mediaArtist";

                        this.gvMedia.Columns[5].Visible = true;
                        this.gvMedia.Columns[11].Visible = true;
                    }
                    break;
                case "sports":
                    {
                        MediaSQLDataSource.SelectParameters.Add("mediaSport", Request.QueryString["Sport"]);
                        MediaSQLDataSource.SelectParameters["mediaSport"].DefaultValue = Request.QueryString["Sport"];

                        MediaSQLDataSource.SelectCommand += " and medGenre = @mediaSport";
                                                
                        this.gvMedia.Columns[11].Visible = true;
                        this.gvMedia.Columns[11].HeaderText = "League";
                    }
                    break;
            }

            if (!Request.QueryString["Type"].Equals("music"))
            {
                if(Request.Browser.IsMobileDevice)
                {
                    MediaSQLDataSource.SelectCommand += " and medFileExt = '.mp4'";
                }
            }

            MediaSQLDataSource.SelectCommand += " order by medtitle";
            
            this.MediaSQLDataSource.DataBind();
        }

        protected void MediaSQLDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {                    
        }

        protected void MediaSQLDataSource_Filtering(object sender, SqlDataSourceFilteringEventArgs e)
        {         
        }

        protected void MediaSQLDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {   
        }

        protected void gvMedia_Sorted(object sender, EventArgs e)
        {            
        }
    }
}