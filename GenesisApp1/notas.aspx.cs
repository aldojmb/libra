using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace GenesisApp1
{
    public partial class notas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BotonNotas_Click(Object sender, EventArgs e)
        {
            if (txtNotas.Text.Trim() != System.String.Empty) { Session["notas"] = txtNotas.Text.Trim(); }
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("alert('Se guardó la nota'); window.close();");
            ScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "Pase Médico", sb.ToString(), true);

        }
    }
}
