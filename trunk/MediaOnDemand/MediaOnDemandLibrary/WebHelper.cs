using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemandLibrary
{
    public static class WebHelper
    {
        public static Control GetControlById(Control parent, String childId)
        {
            Control result = parent.FindControl(childId);
            if (result != null) return result;
            if (parent.Controls.Count > 0)
                foreach (Control control in parent.Controls)
                {
                    result = GetControlById(control, childId);
                    if (result != null) return result;
                    else continue;
                }
            return null;
        }


        public static void SortDropDownListItems(DropDownList dropDown)
        {
            string[] arr = new string[dropDown.Items.Count];

            for (int i = 0; i < dropDown.Items.Count; i++)
                arr[i] = dropDown.Items[i].Value;

            Array.Sort(arr);

            dropDown.Items.Clear();

            foreach (string str in arr)
                dropDown.Items.Add(str);
        }

    }
}
