using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;

namespace MediaOnDemandLibrary
{
    public static class BusinessLogic
    {
        public static string GetMachineIPAddress()
        {
            string ipAddress = "";

            List<IPAddress> ipAddresses = Dns.GetHostAddresses(Environment.MachineName).ToList<IPAddress>();
            foreach (IPAddress address in ipAddresses)
                if (address.ToString().StartsWith("192.168.1."))
                {
                    ipAddress = address.ToString();
                }

            return ipAddress;
        }

        public static string RemoveSpecialCharacters(string input)
        {
            Regex r = new Regex("(?:[^a-z0-9 ]|(?<=['\"]))", RegexOptions.IgnoreCase | RegexOptions.CultureInvariant | RegexOptions.Compiled);
            return r.Replace(input, String.Empty);
        }
    }
}
