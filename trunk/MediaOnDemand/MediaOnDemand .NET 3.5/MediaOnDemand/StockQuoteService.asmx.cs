using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
// From Microsoft.Web.Extensions.dll assembly
using System.Web.Script.Services;

namespace MsdnMagazine
{
    [WebService(Namespace = "http://msdnmagazine.com/ws")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class StockQuoteService : WebService
    {
        static Random _rand = new Random(Environment.TickCount);

        [WebMethod]
        public int GetStockQuote(string symbol)
        {
            return _rand.Next(0, 120);
        }
    }
}
