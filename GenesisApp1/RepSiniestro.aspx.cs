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
    public partial class RepSiniestro : System.Web.UI.Page
    {
        string _UserApp;
        string _UserID;

        System.Data.DataTable dtAseguradoras = new System.Data.DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            validaSession();

            if (!IsPostBack)
            {
                //cargaCombos();
                //  cargaInfo(cmbAseguradoras.SelectedValue);
            }

            cargaValidaciones();
        }

        #region Validaciones

        protected void cargaValidaciones()
        {
            //txtRazonSocial.Attributes.Add("onkeypress", "Validkey('textarea')");
            //txtRFC.Attributes.Add("onkeypress", "Validkey('rfc')");
            //txtCalle.Attributes.Add("onkeypress", "Validkey('domicilio')");
            //txtNE.Attributes.Add("onkeypress", "Validkey('domicilio')");
            //txtNI.Attributes.Add("onkeypress", "Validkey('domicilio')");
            //txtColonia.Attributes.Add("onkeypress", "Validkey('domicilio')");
            //txtCP.Attributes.Add("onkeypress", "Validkey('numerico')");
            //txtMpio.Attributes.Add("onkeypress", "Validkey('nombres')");
            //txtCiudad.Attributes.Add("onkeypress", "Validkey('nombres')");
            //txtTel1.Attributes.Add("onkeypress", "Validkey('numerico')");
            //txtTel2.Attributes.Add("onkeypress", "Validkey('numerico')");
            //txtTel3.Attributes.Add("onkeypress", "Validkey('numerico')");
            //txtMail.Attributes.Add("onkeypress", "Validkey('email')");
            //txtNomRep.Attributes.Add("onkeypress", "Validkey('nombres')");
            //txtAPRep.Attributes.Add("onkeypress", "Validkey('nombres')");
            //txtAMRep.Attributes.Add("onkeypress", "Validkey('nombres')");
        }

        protected void validaSession()
        {
            try
            {
                _UserApp = Session["_UserApp1135416"].ToString();
                _UserID = Session["_EmpID99874987"].ToString();

                if (_UserApp == null || _UserID == null)
                {
                    Response.Redirect("Template.aspx");
                }
            }
            catch
            {
                Response.Redirect("Template.aspx");
            }
        }

        protected void limpiaCampos()
        {
            //cargaCombos();
            //txtRazonSocial.Text = "";
            //txtRFC.Text = "";
            //txtCalle.Text = "";
            //txtNE.Text = "";
            //txtNI.Text = "";
            //txtColonia.Text = "";
            //txtCP.Text = "";
            //cmbEstado.SelectedValue = "1";
            //txtMpio.Text = "";
            //txtCiudad.Text = "";
            //txtTel1.Text = "";
            //txtTel2.Text = "";
            //txtTel3.Text = "";
            //txtMail.Text = "";
            //txtNomRep.Text = "";
            //txtAPRep.Text = "";
            //txtAMRep.Text = "";
            //lblError.Text = "";
        }

        protected void cmbAseguradoras_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargaInfo(cmbAseguradoras.SelectedValue);
        }

        #endregion

        protected void cargaCombos()
        {
            cmbEstado.Items.Clear(); ;
            cmbAseguradoras.Items.Clear(); ;
            dtAseguradoras = new System.Data.DataTable();

            dtAseguradoras = AsignToTable("exec sp_GEN_Aseguradoras");
            if (dtAseguradoras.Rows[0][0].ToString() != "-1")
            {
                cmbAseguradoras.DataSource = dtAseguradoras;
                cmbAseguradoras.DataValueField = "ID";
                cmbAseguradoras.DataTextField = "Descripcion";
                cmbAseguradoras.DataBind();
            }

            dtAseguradoras = new System.Data.DataTable();
            dtAseguradoras = AsignToTable("exec sp_GEN_Cat_Estado;");
            if (dtAseguradoras.Rows[0][0].ToString() != "-1")
            {
                cmbEstado.DataSource = dtAseguradoras;
                cmbEstado.DataValueField = "ID";
                cmbEstado.DataTextField = "Descripcion";
                cmbEstado.DataBind();
            }
        }

        protected void cargaInfo(string Aseguradora)
        {
            dtAseguradoras = new System.Data.DataTable();
            dtAseguradoras = AsignToTable("exec sp_GEN_Aseguradoras '" + Aseguradora + "'");

            if (dtAseguradoras.Rows[0][0].ToString() == "-1")
            {
                lblError.Text = "*Error: " + dtAseguradoras.Rows[0][1].ToString();
            }

            else
            {
                // txtRazonSocial.Text = dtAseguradoras.Rows[0][1].ToString();
                // txtRFC.Text = dtAseguradoras.Rows[0][2].ToString();
                //  txtCalle.Text = dtAseguradoras.Rows[0][3].ToString();
                //   txtNE.Text = dtAseguradoras.Rows[0][4].ToString();
                //  txtNI.Text = dtAseguradoras.Rows[0][5].ToString();
                //txtColonia.Text = dtAseguradoras.Rows[0][6].ToString();
                //txtCP.Text = dtAseguradoras.Rows[0][7].ToString();
                cmbEstado.SelectedValue = dtAseguradoras.Rows[0][8].ToString();
                txtMpio.Text = dtAseguradoras.Rows[0][9].ToString();
                txtCiudad.Text = dtAseguradoras.Rows[0][10].ToString();
                txtTel1.Text = dtAseguradoras.Rows[0][11].ToString();
                txtTel2.Text = dtAseguradoras.Rows[0][12].ToString();
                txtTel3.Text = dtAseguradoras.Rows[0][13].ToString();
                txtMail.Text = dtAseguradoras.Rows[0][14].ToString();
                txtNomRep.Text = dtAseguradoras.Rows[0][15].ToString();
                txtAPRep.Text = dtAseguradoras.Rows[0][16].ToString();
                txtAMRep.Text = dtAseguradoras.Rows[0][17].ToString();
                lblError.Text = "";
            }
        }

        public bool validateData() {
            bool result = true;
            string message = "";
            if(txtPoliza.Text.Trim()==""){
                message="Introduzca el número de Póliza";
                result = false;
            }else if(datepicker.Value==""){
                message="Introduzca la fecha";
                result = false;
            }else if(this.txtHora.Text==""){
                message="Introduzca la hora";
                result = false;
            }
            else if (this.txtEdad.Text == "")
            {
                message = "Introduzca Edad";
                result = false;
            }
            else if (this.txtEsquina.Text == "")
            {
                message = "Introduzca Esquina";
                result = false;
            }
            else if (this.txtColDel.Text == "")
            {
                message = "Introduzca Col/Delegación";
                result = false;
            }
            else if (this.txtRumbo.Text == "")
            {
                message = "Introduzca Rumbo";
                result = false;
            }
            else if (this.txtRef.Text == "")
            {
                message = "Introduzca Referencia";
                result = false;
            }
            else if (this.txtRelato.Text == "")
            {
                message = "Introduzca relato de los hechos";
                result = false;
            }
            else if (this.txtRelato.Text == "")
            {
                message = "Introduzca relato de los hechos";
                result = false;
            }
              else if (this.txtPM.Text == "")
            {
                message = "Introduzca AM/PM";
                result = false;
            }
              else if (this.txtArribo.Text == "")
            {
                message = "Introduzca Hora de arribo";
                result = false;
            }
              else if (this.txtTermino.Text == "")
            {
                message = "Introduzca Hora de Termino";
                result = false;
            }

              else if (this.txtConclusion.Text == "")
            {
                message = "Introduzca Conclusión";
                result = false;
            }
             

            if(message!="")Alert(message);
            return result;
        }

        public void Alert(string message) {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "myalert", "alert('" + message + "');", true);

//            ScriptManager1.RegisterStartupScript(this.UpdatePanel1,this.UpdatePanel1.GetType(), "myalert", "alert('" + message + "');", true);
        }

        protected void ActualizaInfo(string Aseguradora)
        {
            string notas = System.String.Empty;
            int fotos = 0;
            if (validateData())
            {
                if (chkFotos.Checked) fotos = 1;
                notas = Session["notas"].ToString();
                dtAseguradoras = new System.Data.DataTable();
                string preQuery;
                preQuery = "@iPolizaID = " + txtPoliza.Text + ", " +
                "@iEmpleadoID = 0, " +
                "@dFechaSiniestro = '" + Convert.ToDateTime(datepicker.Value).ToString("yyyyMMdd").ToString() + "', " +
                "@cHora = '" + txtHora.Text.ToUpper() + "', " +
                "@cTelefono = '" + txtTelefono.Text.ToUpper() + "', " +
                "@cRuta = '" + txtRuta.Text.ToUpper() + "', " +
                "@cPlacas = '" + txtTerceroPlacas.Text.ToUpper() + "', " +
                "@cNombreConductor = '" + txtNombreConductor.Text.ToUpper() + "', " +
                "@cNombreAsegurado = '" + txtNombreAsegurado.Text.ToUpper() + "', " +
                "@iEdad = " + txtEdad.Text.ToUpper() + ", " +
                "@cVehiculo = '" + txtVehiculo.Text.ToUpper() + "', " +
                "@cUbicacionEsquina = '" + txtEsquina.Text.ToUpper() + "', " +
                "@cUbicacionColDel = '" + txtColDel.Text.ToUpper() + "', " +
                "@cUbicacionRumbo = '" + txtRumbo.Text.ToUpper() + "', " +
                "@cUbicacionRef = '" + txtRef.Text.ToUpper() + "', " +
                "@cRelatoHechos = '" + txtRelato.Text.ToUpper() + "', " +
                "@cAsesoria = '" + txtAsesoria.Text.ToUpper() + "', " +
                "@cTipo = '" + txtTerceroTipo.Text.ToUpper() + "', " +
                "@cUso = '" + txtTerceroUso.Text.ToUpper() + "', " +
                "@cColor = '" + txtTerceroColor.Text.ToUpper() + "', " +
                "@cModelo = '" + txtTerceroModelo.Text.ToUpper() + "', " +
                "@cLesionados = '" + txtTerceroLesionados.Text.ToUpper() + "', " +
                "@cAveriguacionPrev = '" + txtTerceroAveriguacion.Text.ToUpper() + "', " +
                "@cNotas = '" + notas + "', " +
                "@cHoraAMPM = '" + txtPM.Text.ToUpper() + "', " +
                "@cHoraArribo = '" + txtArribo.Text.ToUpper() + "', " +
                "@cHoraTermino = '" + txtTermino.Text.ToUpper() + "', " +
                "@cAjustador = '" + txtAjustador.Text.ToUpper() + "', " +
                "@cConclusion = '" + txtConclusion.Text.ToUpper() + "', " +
                "@cDeducible = '" + txtDeducible.Text.ToUpper() + "', " +
                "@cAcuenta = '" + txtACuenta.Text.ToUpper() + "', " +
                "@cDebe = '" + txtDebe.Text.ToUpper() + "', " +
                "@cCapturo = '" + txtCapturo.Text.ToUpper() + "', " +
                "@cRecibo = '" + txtRecibo.Text.ToUpper() + "', " +
                "@cPagare = '" + txtPagare.Text.ToUpper() + "', " +
                "@iFotos = " + fotos.ToString();


                dtAseguradoras = AsignToTable("exec sp_GEN_InsertaReporteSiniestros " + preQuery);
                lblError.Text = "";

                if (dtAseguradoras.Rows[0][0].ToString() == "-1")
                {
                    lblError.Text = "*Error: " + dtAseguradoras.Rows[0][1].ToString();
                }
                else
                {
                    lblError.Text = "Número de Reporte: " + dtAseguradoras.Rows[0][0].ToString();
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("alert('Número de Reporte: " + dtAseguradoras.Rows[0][0].ToString() + "');");
                    ScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "Poliza", sb.ToString(), true);
                }
            }
        }

        #region Botones

        protected void btnClean_Click(object sender, ImageClickEventArgs e)
        {
            limpiaCampos();
        }

        protected void btnTrash_Click(object sender, ImageClickEventArgs e)
        {
            System.Data.DataTable dtAseguradora = new System.Data.DataTable();

            string Aseguradora = cmbAseguradoras.SelectedValue;
            dtAseguradora = AsignToTable("exec sp_GEN_ABC_Aseguradora @iAseguradoraID='" + Aseguradora + "', @bStatus_Aseguradora='0', @iEmpleadoID='" + _UserID + "'");
            if (dtAseguradora.Rows[0][0].ToString() == "-1")
            {
                lblError.Text = "*Error: " + dtAseguradora.Rows[0][1].ToString();
            }

            else
            {
                limpiaCampos();
            }
        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
            ActualizaInfo(cmbAseguradoras.SelectedValue);
        }

        protected void btnNew_Click(object sender, ImageClickEventArgs e)
        {
            ActualizaInfo("0");
        }

        protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
        {
            cargaInfo(cmbAseguradoras.SelectedValue);
        }

        public System.Data.DataTable AsignToTable(string queryString)
        {
            System.Data.DataTable dataTable = new System.Data.DataTable();

            using (System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection(DesencriptaConnString()))
            {
                System.Data.SqlClient.SqlDataAdapter adapter = new System.Data.SqlClient.SqlDataAdapter();
                adapter.SelectCommand = new System.Data.SqlClient.SqlCommand(queryString, connection);
                adapter.Fill(dataTable);
                return dataTable;
            }
        }

        public string DesencriptaConnString()
        {
            string constrFinal = Session["_app_418498_connX_7858"].ToString();
            return constrFinal;
        }

        #endregion

        protected void BotonNotas_Click(Object sender, EventArgs e)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("popWin=window.open('");
            sb.Append("notas.aspx");
            sb.Append("','','width=");
            sb.Append("730");
            sb.Append(",height=");
            sb.Append("400");
            sb.Append(",toolbar=no,location=no, directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes");
            sb.Append("');");
            sb.Append("popWin.focus();");


            ScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "Pase Médico", sb.ToString(), true);

        }
        public string obten_Query(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
        {
            switch (Concepto)
            {
                case "BuscarPoliza":
                    return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=4, @bStatus=0;";

                case "RenuevaPoliza":
                    return "exec sp_GEN_CancelaRenueva_Poliza @type=7, @iPolizaID='" + variable1 + "';";

                default:
                    return "";
            }
        }
        protected void btnFind_Click(object sender, ImageClickEventArgs e)
        {
            lblError.Text = "";
            System.Data.DataTable dt;
            dt = new System.Data.DataTable();
            dt = AsignToTable(obten_Query("BuscarPoliza", txtPoliza.Text, "", "", "", ""));

            if (dt.Rows.Count > 0)
            {
                txtPlacas.Text = dt.Rows[0]["cNumPlacas"].ToString();
                txtTelefono.Text = dt.Rows[0]["Telefono"].ToString();
                txtRuta.Text = dt.Rows[0]["Ruta"].ToString();
                txtNombreAsegurado.Text = dt.Rows[0]["Nombre"].ToString();
                txtPolizaVendedor.Text = dt.Rows[0]["Agente"].ToString();
                txtPolizastatus.Text = dt.Rows[0]["cDescripcion_Poliza"].ToString();
                txtPolizaVigencia.Text = dt.Rows[0]["Fecha"].ToString();

            }
            else
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("alert('No se encontró la Póliza');");
                ScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "Poliza", sb.ToString(), true);
            }
        }

    }
}
