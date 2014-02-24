using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;

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
    }
}
