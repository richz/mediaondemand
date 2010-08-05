using System;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.ComponentModel;
using System.ComponentModel.Design;
using AjaxControlToolkit;

[assembly: System.Web.UI.WebResource("MattBerseth.WebControls.AJAX.Progress._assets.css.progress.css", "text/css", PerformSubstitution = true)]
[assembly: System.Web.UI.WebResource("MattBerseth.WebControls.AJAX.Progress._assets.img.progress.gif", "img/gif")]
[assembly: System.Web.UI.WebResource("MattBerseth.WebControls.AJAX.Progress._assets.img.progress_bg.gif", "img/gif")]
[assembly: System.Web.UI.WebResource("MattBerseth.WebControls.AJAX.Progress.ProgressBehavior.js", "text/javascript")]

namespace MattBerseth.WebControls.AJAX.Progress
{
    /// <summary>
    /// 
    /// </summary>
    [RequiredScript(typeof(CommonToolkitScripts))]
    [RequiredScript(typeof(AnimationScripts))]
    [ClientCssResource("MattBerseth.WebControls.AJAX.Progress._assets.css.progress.css")]
    [ClientScriptResource("MattBerseth.WebControls.AJAX.Progress.ProgressBehavior", "MattBerseth.WebControls.AJAX.Progress.ProgressBehavior.js")]
    public class ProgressControl : ScriptControlBase
    {
        /// <summary>
        /// 
        /// </summary>
        protected override HtmlTextWriterTag TagKey
        {
            get { return HtmlTextWriterTag.Div; }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="writer"></param>
        public override void RenderBeginTag(HtmlTextWriter writer)
        {
            writer.AddAttribute(HtmlTextWriterAttribute.Class, string.Format("ajax__progress {0}", this.CssClass).TrimEnd());
            base.RenderBeginTag(writer);
        }

        /// <summary>
        /// 
        /// </summary>
        protected override void AddAttributesToRender(HtmlTextWriter writer)
        {
            //  make sure we don't render the width style
            this.Style.Remove(HtmlTextWriterStyle.Width);

            writer.AddAttribute(HtmlTextWriterAttribute.Class, string.Format("ajax__progress {0}", this.CssClass).TrimEnd());
            base.AddAttributesToRender(writer);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="writer"></param>
        protected override void RenderContents(HtmlTextWriter writer)
        {
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "ajax__progress_outer");
            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ClientID + "_outer");
            writer.AddStyleAttribute(HtmlTextWriterStyle.Width, this.Width.ToString());
            writer.RenderBeginTag(HtmlTextWriterTag.Div);

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "ajax__progress_inner");
            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ClientID + "_inner");
            writer.RenderBeginTag(HtmlTextWriterTag.Div);

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "ajax__progress_indicator");
            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ClientID + "_indicator");
            writer.RenderBeginTag(HtmlTextWriterTag.Div);
            writer.RenderEndTag();
            writer.RenderEndTag();
            writer.RenderEndTag();

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "ajax__progress_info");
            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ClientID + "_info");
            writer.RenderBeginTag(HtmlTextWriterTag.Div);
            writer.RenderEndTag();
        }

        /// <summary>
        /// 
        /// </summary>
        protected V GetPropertyValue<V>(string propertyName, V nullValue)
        {
            if (this.ViewState[propertyName] == null)
            {
                return nullValue;
            }
            return (V)this.ViewState[propertyName];
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="V"></typeparam>
        /// <param name="propertyName"></param>
        /// <param name="value"></param>
        protected void SetPropertyValue<V>(string propertyName, V value)
        {
            this.ViewState[propertyName] = value;
        }


        /// <summary>
        /// 
        /// </summary>
        [ExtenderControlProperty]
        [RequiredProperty]
        public Mode Mode
        {
            get { return this.GetPropertyValue<Mode>("Mode", Mode.Manual); }
            set { this.SetPropertyValue<Mode>("Mode", value); }
        }
    }
}
