using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Web.Script.Services;

namespace MediaOnDemand
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    //[System.Web.Script.Services.ScriptService]
    //public class WebService : System.Web.Services.WebService
    //{

    //    [WebMethod]
    //    public string HelloWorld()
    //    {
    //        return "Hello World";
    //    }

    //}

    [ScriptService]
    public class DoStuffWebService : WebService
    {
        [WebMethod, ScriptMethod]
        public void BeginProcess(string processName)
        {
            // Here is where I'm starting my timers...
        }

        [WebMethod, ScriptMethod]
        public int GetProcessProgress(string processName)
        {
            return 0;
        }
    }
}
