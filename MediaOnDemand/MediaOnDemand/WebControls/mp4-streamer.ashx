<%@ WebHandler Language="C#" Class="mp4_streamer" %>

using System;
using System.Web;
using System.IO;
using System.Collections.Specialized;

public class mp4_streamer : IHttpHandler {

  
    private string _vsk_path_root = "";
    private string _vsk_path_files = "/contents/test/"; // directory path where mp4 videos reside
    //private bool _vsk_conf_limit_bandwidth = true;
    private bool _vsk_conf_allow_file_cache = false;
    // bandwidth settings
    //private int _vsk_bw_packet_size = 90; //set how many kilobytes will be sent per time interval
    //private float _vsk_bw_packet_internal = 0.3F; //set the time interval in which data packets will be sent in seconds.
    //private bool _vsk_conf_allow_dynamic_bandwith = true; //set to TRUE to control bandwidth externally via http.
    // incomming get variables
    //private string _vsk_get_bandwidth="bw";
    // domain restriction
    private bool _islimitdomain = false; // set to TRUE to limit access to the player
    private static string[] _allowed_domains = new string[] { "www.remix-video.com", "www.mediasoftpro.com" };
    private bool _isrestrictdomain = false; // set to TRUE to restrict access to the player.
    private static string[] _restricted_domains = new string[] { "www.sampledomain.com", "www.sampledomain2.com", "www.sampledomain3.com" };

    // points to server root
    public string VSK_PATH_ROOT
    {
        set { _vsk_path_root = value; }
        get { return _vsk_path_root; }
    }

    public string VSK_PATH_FILES
    {
        set { _vsk_path_files = value; }
        get { return _vsk_path_files; }
    }

    ////set to TRUE to use bandwidth limiting.
    //public bool VSK_CONF_LIMIT_BANDWIDTH
    //{
    //    set { _vsk_conf_limit_bandwidth = value;}
    //    get { return _vsk_conf_limit_bandwidth;}
    //}

    //set to FALSE to prohibit caching of video files.
    public bool VSK_CONF_ALLOW_FILE_CACHE
    {
        set { _vsk_conf_allow_file_cache = value; }
        get { return _vsk_conf_allow_file_cache; }
    }

    ////set how many kilobytes will be sent per time interval
    //public int VSK_BW_PACKET_SIZE
    //{
    //    set { _vsk_bw_packet_size = value;}
    //    get { return _vsk_bw_packet_size;}
    //}

    //// set the time interval in which data packets will be sent in seconds.
    //public float VSK_BW_PACKET_INTERVAL
    //{
    //    set { _vsk_bw_packet_internal = value;}
    //    get { return _vsk_bw_packet_internal;}
    //}

    ////set to TRUE to control bandwidth externally via http.
    //public bool VSK_CONF_ALLOW_DYNAMIC_BANDWIDTH
    //{
    //    set { _vsk_conf_allow_dynamic_bandwith = value;}
    //    get { return _vsk_conf_allow_dynamic_bandwith;}
    //}

    //public string VSK_GET_BANDWIDTH
    //{
    //    set { _vsk_get_bandwidth =value;}
    //    get { return _vsk_get_bandwidth;}
    //}

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            int i = 0;
            bool flag = false;
            // limit access of player to certain domains
            if (_islimitdomain)
            {
                if (context.Request.UrlReferrer == null)
                {
                    context.Response.Write("<b>ERROR:</b> Unknown Referrer.");
                    return;
                }
                StringCollection _list = new StringCollection();
                _list.AddRange(_allowed_domains);
                for (i = 0; i <= _list.Count - 1; i++)
                {
                    if (_list[i].Contains(context.Request.UrlReferrer.Host))
                        flag = true; // referrer host matched with list of allowed domains
                }
                if (!flag) // referrer host not matched
                {
                    context.Response.Write("<b>ERROR:</b> Access Denied.");

                    return;
                }
            }

            // restrict access of some domains to player
            if (_isrestrictdomain)
            {
                if (context.Request.UrlReferrer == null)
                {
                    context.Response.Write("<b>ERROR:</b> Unknown Referrer.");
                    return;
                }
                flag = false;
                StringCollection _list = new StringCollection();
                _list.AddRange(_restricted_domains);
                for (i = 0; i <= _list.Count - 1; i++)
                {
                    if (_list[i].Contains(context.Request.UrlReferrer.Host))
                        flag = true; // referrer host matched with list of restricted domains
                }
                if (flag) // referrer host matched with restricted domains
                {
                    context.Response.Write("<b>ERROR:</b> Access Restricted.");
                    return;
                }
            }

            // Security Check
            if (context.Request.Params["token"] == null)
            {
                //if (context.Request.Params["token"] != "kxdffxki")
                //{
                context.Response.Write("<b>ERROR:</b> Access Denied.");
                return;
                //}
            }


            int position;
            int length;
            // Check start parameter if present
            //string filename = Path.GetFileName(context.Request.FilePath);
            string filename = context.Request.Params["file"];
            string seekpos = context.Request.Params["start"];
            string user = context.Request.Params["token"]; // point token with author of video
            // assemble file path
            string rootpath = context.Server.MapPath(context.Request.ApplicationPath);
            // string file = rootpath + "" + this.VSK_PATH_FILES + "" + user + "/FLV/" + filename;
            string file = rootpath + "" + this.VSK_PATH_FILES + "" + filename;

            if (!File.Exists(file))
            {
                context.Response.Write("<b>ERROR:</b> vsk-mp4 could not find (" + filename + ") please check your settings.");
                return;
            }

            if (File.Exists(file) && filename.EndsWith(".mp4") && filename.Length > 2)
            {
                FileStream fs = new FileStream(file, FileMode.Open, FileAccess.Read);
                if (string.IsNullOrEmpty(seekpos))
                {
                    position = 0;
                    length = Convert.ToInt32(fs.Length);
                }
                else
                {
                    position = Convert.ToInt32(seekpos);
                    //length = Convert.ToInt32(fs.Length - position) + _header.Length;
                    length = Convert.ToInt32(fs.Length - position);
                }

                // Add HTTP header stuff: cache, content type and length        

                if (!this.VSK_CONF_ALLOW_FILE_CACHE)
                {
                    // session_cache_limiter("nocache");
                    // header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");
                    // header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
                    // header("Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0");
                    //  header("Pragma: no-cache");
                }
                else
                {
                    //context.Response.Cache.SetCacheability(HttpCacheability.Public);
                    //context.Response.Cache.SetLastModified(DateTime.Now);
                }
                //context.Response.AppendHeader("Content-Type", "video/x-flv"); 
                context.Response.AppendHeader("Content-Type", "video/mp4");
                context.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + "");
                context.Response.AppendHeader("Content-Length", length.ToString());

                // Read buffer and write stream to the response stream
                const int buffersize = 16384;
                byte[] buffer = new byte[buffersize];

                int count = fs.Read(buffer, 0, buffersize);
                while (count > 0)
                {
                    if (context.Response.IsClientConnected)
                    {
                        context.Response.OutputStream.Write(buffer, 0, count);
                        context.Response.Flush();
                        count = fs.Read(buffer, 0, buffersize);
                    }
                    else
                    {
                        count = -1;
                    }
                }
                fs.Close();


            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.ToString());
        }

    }


    public bool IsReusable
    {
        get
        {
            return true;
        }
    }



    //------------------------------------------------------------------------------------------
    //    DYNAMIC BANDWIDTH CONTROL
    //------------------------------------------------------------------------------------------

    //private float getBandwidthLimit(string part)
    //{
    //    float val = 0;
    //    switch(part)
    //    {
    //        case "interval":
    //            switch(this.VSK_GET_BANDWIDTH)
    //            {
    //                case "low":
    //                    val = 0.5F;
    //                break;
    //                case "mid":
    //                    val = 0.5F;
    //                break;
    //                case "high":
    //                    val = 0.2F;
    //                break;
    //                case "off":
    //                    val = 0F;
    //                break;
    //                default :
    //                    val = this.VSK_BW_PACKET_INTERVAL;
    //                break;
    //            }
    //        break;
    //        case "size":
    //            switch(this.VSK_GET_BANDWIDTH)
    //            {
    //                case "low":
    //                    val = 20;
    //                break;
    //                case "mid":
    //                    val = 40;
    //                break;
    //                case "high":
    //                    val = 90;
    //                break;
    //                default :
    //                    val = this.VSK_BW_PACKET_SIZE;
    //                break;
    //            }
    //        break;
    //    }
    //    return val;
    //}


    private static byte[] HexToByte(string hexString)
    {
        byte[] returnBytes = new byte[hexString.Length / 2];
        for (int i = 0; i < returnBytes.Length; i++)
            returnBytes[i] = Convert.ToByte(hexString.Substring(i * 2, 2), 16);
        return returnBytes;
    }

}