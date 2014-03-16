using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Configuration;
using System.Data;
using System.Collections.Generic;

namespace MediaOnDemand
{
    public abstract class BaseEntity
    {
    }

    public class Media : BaseEntity
    {
        #region class fields

        private int _id;
        private string _mediaTitle = string.Empty;
        private string _mediaFileExt = string.Empty;
        private string _mediaType;
        private DateTime _dateAdded;
        private string _isViewable;
        private string _artist = string.Empty;
        private string _description = string.Empty;
        private string _genre = string.Empty;
        private string _album = string.Empty;
        private string _posterImageUrl = string.Empty;
        private DateTime _lastPlayedDate;
        private int _rating;
        private string _fileName = string.Empty;

        #endregion

        public int ID
        {
            get
            {
                return _id;
            }
            set
            {
                _id = value;
            }
        }

        public string MediaTitle
        {
            get
            {
                return _mediaTitle;
            }
            set
            {
                _mediaTitle = value;
            }
        }

        public string MediaType
        {
            get
            {
                return _mediaType;
            }
            set
            {
                _mediaType = value;
            }
        }

        public string MediaFileExt
        {
            get
            {
                return _mediaFileExt;
            }
            set
            {
                _mediaFileExt = value;
            }
        }

        public DateTime DateAdded
        {
            get
            {
                return _dateAdded;
            }
            set
            {
                _dateAdded = value;
            }
        }

        public string IsViewable
        {
            get
            {
                return _isViewable;
            }
            set
            {
                _isViewable = value;
            }
        }

        public string Artist
        {
            get
            {
                return _artist;
            }
            set
            {
                _artist = value;
            }
        }

        public string Description
        {
            get
            {
                return _description;
            }
            set
            {
                _description = value;
            }
        }

        public string Genre
        {
            get
            {
                return _genre;
            }
            set
            {
                _genre = value;
            }
        }

        public string Album
        {
            get
            {
                return _album;
            }
            set
            {
                _album = value;
            }
        }

        public string PosterImageUrl
        {
            get
            {
                return _posterImageUrl;
            }
            set
            {
                _posterImageUrl = value;
            }
        }

        public DateTime LastPlayedDate
        {
            get
            {
                return _lastPlayedDate;
            }
            set
            {
                _lastPlayedDate = value;
            }
        }

        public int Rating
        {
            get
            {
                return _rating;
            }
            set
            {
                _rating = value;
            }
        }

        public string FileName
        {
            get
            {
                return _fileName;
            }
            set
            {
                _fileName = value;
            }
        }
    }

    public class PagedResult<T> where T : BaseEntity
    {
        private int _total;
        private List<T> _rows;

        public int Total
        {
            get
            {
                return _total;
            }
            set
            {
                _total = value;
            }
        }

        public List<T> Rows
        {
            get
            {
                return _rows;
            }
            set
            {
                _rows = value;
            }
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class DataService : WebService
    {
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["MediaOnDemandDBConnectionString"].ConnectionString;

        [WebMethod]
        public Media[] GetAllMedia()
        {
            List<Media> list = new List<Media>();

            using (IDbConnection cnn = CreateConnection())
            {
                using (IDbCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandText = "select " +
                                      "[mobId], " +
                                      "[mobMediaTitle], " +
                                      "[mobMediaFileExt], " +
                                      "[mobMediaType], " +
                                      "[mobDateAdded], " +
                                      "[mobIsViewable], " +
                                      "[mobArtist], " +
                                      "[mobDescription], " +
                                      "[mobGenre], " +
                                      "[mobAlbum], " +
                                      "[mobPosterImageUrl], " +
                                      "[mobLastPlayedDate], " +
                                      "[mobRating], " +
                                      "[mobFileName] " +
                                      "from MobileMedia] " +
                                      "order by [mobId]";

                    using (IDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            Media m = BuildMedia(rdr);

                            list.Add(m);
                        }
                    }
                }
            }

            if (list.Count == 0)
            {
                return null;
            }

            for (int i = 0; i < list.Count; i++)
            {
                if (i == 0)
                {
                    //list[i].Active = true;
                }
                else
                {
                    //list[i].Active = ((i % 2) == 0);
                }
            }

            return list.ToArray();
        }

        [WebMethod]
        public PagedResult<Media> GetMediaListByMediaType(string mediaType , int start, int max, string sortColumn, string sortOrder)
        {
            if (max == 0)
            {
                max = 10;
            }

            if (string.IsNullOrEmpty(sortColumn) || (string.Compare(sortColumn, "mobMediaTitle", true) == 0))
            {
                sortColumn = "mobMediaTitle";
            }

            if (string.IsNullOrEmpty(sortOrder))
            {
                sortOrder = "ASC";
            }

            string SQL =

                            "SELECT  " +
                                      "[mobId], " +
                                      "[mobMediaTitle], " +
                                      "[mobMediaFileExt], " +
                                      "[mobMediaType], " +
                                      "[mobDateAdded], " +
                                      "[mobIsViewable], " +
                                      "[mobArtist], " +
                                      "[mobDescription], " +
                                      "[mobGenre], " +
                                      "[mobAlbum], " +
                                      "[mobPosterImageUrl], " +
                                      "[mobLastPlayedDate], " +
                                      "[mobRating], " +
                                      "[mobFileName] " +
                               "FROM                                                                   " +
                               "     (                                                                 " +
                               "        SELECT                                                         " +
                                      "[mobId], " +
                                      "[mobMediaTitle], " +
                                      "[mobMediaFileExt], " +
                                      "[mobMediaType], " +
                                      "[mobDateAdded], " +
                                      "[mobIsViewable], " +
                                      "[mobArtist], " +
                                      "[mobDescription], " +
                                      "[mobGenre], " +
                                      "[mobAlbum], " +
                                      "[mobPosterImageUrl], " +
                                      "[mobLastPlayedDate], " +
                                      "[mobRating], " +
                                      "[mobFileName], " +
                               "                ROW_NUMBER() OVER (ORDER BY [{0}] {1}) AS [RowIndex]   " +
                               "         FROM                                                          " +
                               "                [MobileMedia]                                          " +
                               "      WHERE [mobMediaType] = '" + mediaType + "'                       " + 
                               "     ) AS [MobileMediaWithRowIndex]                                    " +
                               "WHERE                                                                  " +
                               "        ([RowIndex] > {2})                                             " +
                               "AND     ([RowIndex] <= ({2} + {3}))                                    " +
                               "                                                                       " +
                               "SELECT COUNT(mobId)                                                    " +
                               "FROM                                                                   " +
                               "    [MobileMedia]                                                      ";

            int total = 0;
            List<Media> list = new List<Media>();

            using (IDbConnection cnn = CreateConnection())
            {
                using (IDbCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandText = string.Format(SQL, sortColumn, sortOrder, start, max);

                    using (IDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            Media m = BuildMedia(rdr);

                            list.Add(m);
                        }

                        if ((rdr.NextResult()) && (rdr.Read()))
                        {
                            total = rdr.GetInt32(0);
                        }
                    }
                }
            }

            if ((list.Count == 0) || (total == 0))
            {
                return null;
            }

            PagedResult<Media> result = new PagedResult<Media>();

            result.Rows = list;
            result.Total = total;

            return result;
        }

        private static Media BuildMedia(IDataReader reader)
        {
            Media media = new Media();

            media.ID = reader.IsDBNull(0) ? 0 : reader.GetInt32(0);
            media.MediaTitle = reader.IsDBNull(1) ? "" : reader.GetString(1);
            media.MediaFileExt = reader.IsDBNull(2) ? "" : reader.GetString(2);
            media.MediaType = reader.IsDBNull(3) ? "" : reader.GetString(3);
            media.DateAdded = reader.IsDBNull(4) ? DateTime.Now : reader.GetDateTime(4);
            media.IsViewable = reader.IsDBNull(5) ? "Y" : reader.GetString(5);
            media.Artist = reader.IsDBNull(6) ? "" : reader.GetString(6);
            media.Description = reader.IsDBNull(7) ? "" : reader.GetString(7);
            media.Genre = reader.IsDBNull(8) ? "" : reader.GetString(8);
            media.Album = reader.IsDBNull(9) ? "" : reader.GetString(9);
            media.PosterImageUrl = reader.IsDBNull(10) ? "" : reader.GetString(10);
            media.LastPlayedDate = reader.IsDBNull(11) ? DateTime.Now : reader.GetDateTime(11);
            media.Rating = reader.IsDBNull(12) ? 0 : reader.GetInt32(12);
            media.FileName = reader.IsDBNull(13) ? "" : reader.GetString(13);

            return media;
        }

        private static IDbConnection CreateConnection()
        {
            IDbConnection cnn = new System.Data.SqlClient.SqlConnection(ConnectionString);
            cnn.Open();

            return cnn;
        }
    }
}