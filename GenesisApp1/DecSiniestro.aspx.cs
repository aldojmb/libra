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
    public partial class DecSiniestro : System.Web.UI.Page
    {
        System.Data.DataTable dtAsegurados = new System.Data.DataTable();
        System.Data.DataTable dtBuscar = new System.Data.DataTable();

        string _UserApp;
        string _UserID;
        int _imgSize;
        System.Data.DataTable dtVehiculos = new System.Data.DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            validaSession();

            if (!IsPostBack)
            {
                cargaCombos();

                /* if (Request.QueryString["ID"] != null)
                 {
                     cmbAsegurados.SelectedValue = Request.QueryString["ID"].ToString();
                     cmbAsegurados.Enabled = false;
                 }

                 cargaInfo(cmbAsegurados.SelectedValue);
                 cargaInfoV("12");*/
            }

            cargaValidaciones();
        }

        #region Validaciones

        protected void cargaValidaciones()
        {
            /* txtRFC.Attributes.Add("onkeypress", "Validkey('rfc')");
             txtCalle.Attributes.Add("onkeypress", "Validkey('domicilio')");
             txtNE.Attributes.Add("onkeypress", "Validkey('domicilio')");
             txtNI.Attributes.Add("onkeypress", "Validkey('domicilio')");
             txtColonia.Attributes.Add("onkeypress", "Validkey('domicilio')");
             txtCP.Attributes.Add("onkeypress", "Validkey('numerico')");
             txtMpio.Attributes.Add("onkeypress", "Validkey('nombres')");
             txtCiudad.Attributes.Add("onkeypress", "Validkey('nombres')");
             txtTel1.Attributes.Add("onkeypress", "Validkey('numerico')");
             txtTel2.Attributes.Add("onkeypress", "Validkey('numerico')");
             txtTel3.Attributes.Add("onkeypress", "Validkey('numerico')");
             txtMail.Attributes.Add("onkeypress", "Validkey('email')");
             txtNomRep.Attributes.Add("onkeypress", "Validkey('nombres')");
             txtAPRep.Attributes.Add("onkeypress", "Validkey('nombres')");
             txtAMRep.Attributes.Add("onkeypress", "Validkey('nombres')");*/
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
            /*cargaCombos();
            txtRFC.Text = "";
            txtCalle.Text = "";
            txtNE.Text = "";
            txtNI.Text = "";
            txtColonia.Text = "";
            txtCP.Text = "";
            cmbEstado.SelectedValue = "1";
            txtMpio.Text = "";
            txtCiudad.Text = "";
            txtTel1.Text = "";
            txtTel2.Text = "";
            txtTel3.Text = "";
            txtMail.Text = "";
            txtNomRep.Text = "";
            txtAPRep.Text = "";
            txtAMRep.Text = "";
            lblError.Text = "";*/
        }

        protected void cmbAsegurados_SelectedIndexChanged(object sender, EventArgs e)
        {
            // cargaInfo(cmbAsegurados.SelectedValue);
        }
        protected void btnFind_Click(object sender, ImageClickEventArgs e)
        {
            lblError.Text = "";
            //pnlBuscador.Visible = true;
            cargarInfo(txtReporteSearch.Text.ToString());
        }
        #endregion
        protected void cargarInfo(string parametro)
        {
            dtBuscar = new System.Data.DataTable();
            dtBuscar = AsignToTable(obten_Query("BuscaReporte", parametro, "", "", "", ""));
            //pnlBuscador.Visible = false;

            if (dtBuscar.Rows[0][0].ToString() != "-1")
            {

                txtAseguradoNombre.Text = dtBuscar.Rows[0]["Nombre_Asegurado"].ToString();
                txtAseguradoDireccion.Text = dtBuscar.Rows[0]["Direccion_Asegurado"].ToString();
                txtAseguradoPolizaStatus.Text = dtBuscar.Rows[0]["cDescripcion_Poliza"].ToString();
                txtAseguradoPolizaVigencia.Text = "De:" + dtBuscar.Rows[0]["dFechaVigenciaINI"].ToString() + " A " + dtBuscar.Rows[0]["dFechaVigenciaFIN"].ToString();
                txtAseguradoPolizaDedudible.Text = dtBuscar.Rows[0]["mSolDeducible"].ToString();
                txtAseguradoPolizaTelefono.Text = dtBuscar.Rows[0]["cTelefono"].ToString();

                txtConductorNombre.Text = dtBuscar.Rows[0]["cTelefono"].ToString();
                txtConductorEdad.Text = dtBuscar.Rows[0]["cNombreConductor"].ToString();
                //txtConductorTelefono.Text = dtBuscar.Rows[0][3].ToString();
                //txtConductorCalle.Text = dtBuscar.Rows[0][3].ToString();
                //txtConductorNoExt.Text = dtBuscar.Rows[0][3].ToString();
                //txtConductorNoInt.Text = dtBuscar.Rows[0][3].ToString();
                //txtConductorColonia.Text = dtBuscar.Rows[0][3].ToString();
                //txtConductorCP.Text = dtBuscar.Rows[0][3].ToString();
                //txtConductorFechaNac.Text = dtBuscar.Rows[0][3].ToString();
                //txtConductorLicencia.Text = dtBuscar.Rows[0][3].ToString();
                // txtConductorVigencia.Text = dtBuscar.Rows[0][3].ToString();
                txtVehiculoAseguradoMarca.Text = dtBuscar.Rows[0]["Marca"].ToString();
                txtVehiculoAseguradoTipo.Text = dtBuscar.Rows[0]["cTipoVehiculo_Descripcion"].ToString();
                txtVehiculoAseguradoModelo.Text = dtBuscar.Rows[0]["cModelo_Descripcion"].ToString();
                txtVehiculoAseguradoColor.Text = dtBuscar.Rows[0]["cColor"].ToString();
                txtVehiculoAseguradoNoSerie.Text = dtBuscar.Rows[0]["cNumSerie"].ToString();
                txtVehiculoAseguradoNoMotor.Text = dtBuscar.Rows[0]["cNumMotor"].ToString();
                txtVehiculoAseguradoPlacas.Text = dtBuscar.Rows[0]["cNumPlacas"].ToString();
                txtSiniestroHora.Text = dtBuscar.Rows[0]["cHora"].ToString();

                txtSiniestroArribo.Text = dtBuscar.Rows[0]["cHoraArribo"].ToString();
                txtSiniestroTermino.Text = dtBuscar.Rows[0]["cHoraTermino"].ToString();
                txtSiniestroUbicacion.Text = dtBuscar.Rows[0]["Ubicacion"].ToString();
                txtSiniestroNarracion.Text = dtBuscar.Rows[0]["cRelatoHechos"].ToString();

                //txtVehiculoTercerNombreProp.Text = dtBuscar.Rows[0][3].ToString();
                //txtVehiculoTercerDireccion.Text = dtBuscar.Rows[0][3].ToString();
                //txtVehiculoTercerTelefono.Text = dtBuscar.Rows[0][3].ToString();

                //txtVehiculoTercerConductorNombre.Text = dtBuscar.Rows[0][3].ToString();
                //txtVehiculoTercerConductorLicencia.Text = dtBuscar.Rows[0][3].ToString();
                //txtVehiculoTercerConductorTelefono.Text = dtBuscar.Rows[0][3].ToString();

                //txtVehiculoTercerMarca.Text = dtBuscar.Rows[0][3].ToString();
                txtVehiculoTercerTipo.Text = dtBuscar.Rows[0]["TerceroTipo"].ToString();
                txtVehiculoTercerModelo.Text = dtBuscar.Rows[0]["TerceroModelo"].ToString();
                txtVehiculoTercerColor.Text = dtBuscar.Rows[0]["TerceroColor"].ToString();
                // txtVehiculoTercerNoSerie.Text = dtBuscar.Rows[0][""].ToString();
                //txtVehiculoTercerNoMotor.Text = dtBuscar.Rows[0][3].ToString();
                txtVehiculoTercerPlacas.Text = dtBuscar.Rows[0]["TerceroPlacas"].ToString();



                /* txtVehiculoTercerCiaSeguros.Text = dtBuscar.Rows[0][3].ToString();
                 txtVehiculoTercerPoliza.Text = dtBuscar.Rows[0][3].ToString();
                 txtVehiculoTercerVigencia.Text = dtBuscar.Rows[0][3].ToString();
                 txtVehiculoTercerCobertura.Text = dtBuscar.Rows[0][3].ToString();
                 txtVehiculoTercerSiniestro.Text = dtBuscar.Rows[0][3].ToString();
                 txtVehiculoTercerAjustador.Text = dtBuscar.Rows[0][3].ToString();
                 txtVehiculoTercerDanos.Text = dtBuscar.Rows[0][3].ToString();*/

            }

            else
            {
                if (lblError.Text == "")
                {
                    lblError.Text = "No existe ";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("alert('No. de Reporte no existe');");
                    ScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "Error d", sb.ToString(), true);
                }
            }
        }
        protected void cargaCombos()
        {
            // cmbEstado.Items.Clear(); ;
            //// cmbAsegurados.Items.Clear(); ;
            // dtAsegurados = new System.Data.DataTable();

            // dtAsegurados = AsignToTable("exec sp_GEN_Asegurado '0'");
            // if (dtAsegurados.Rows[0][0].ToString() != "-1")
            // {
            //  //   cmbAsegurados.DataSource = dtAsegurados;
            //   //  cmbAsegurados.DataValueField = "ID";
            //    // cmbAsegurados.DataTextField = "Descripcion";
            //     //cmbAsegurados.DataBind();
            // }

            // dtAsegurados = new System.Data.DataTable();
            // dtAsegurados = AsignToTable("exec sp_GEN_Cat_Estado;");
            // if (dtAsegurados.Rows[0][0].ToString() != "-1")
            // {
            //     cmbEstado.DataSource = dtAsegurados;
            //     cmbEstado.DataValueField = "ID";
            //     cmbEstado.DataTextField = "Descripcion";
            //     cmbEstado.DataBind();
            // }

            // templateCombo(cmbMarca, "Marca", "");
            // templateCombo(cmbVehiculos, "Vehiculos", "");
            // //templateCombo(cmbTipoClase, "TipoClase", "");
            // //templateCombo(cmbServicio, "Servicio", "");
            // templateCombo(cmbTipoUso, "TipoUso", "");
            // templateCombo(cmbRamal, "Ramal", "");
            // //templateCombo(cmbTransmision, "Transmision", "");
        }

        protected void templateCombo(DropDownList cmbCatalogo, string sQuery, string variable)
        {
            dtVehiculos = new System.Data.DataTable();
            cmbCatalogo.Items.Clear(); ;
            dtVehiculos = AsignToTable(obten_Query(sQuery, variable, "", "", "", ""));

            if (dtVehiculos.Rows[0][0].ToString() != "-1")
            {
                cmbCatalogo.DataSource = dtVehiculos;
                cmbCatalogo.DataValueField = "ID";
                cmbCatalogo.DataTextField = "Descripcion";
                cmbCatalogo.DataBind();

                if (sQuery == "Marca")
                {
                    //templateCombo(cmbModelo, "Modelo", cmbMarca.SelectedValue.ToString());
                }
            }
        }


        protected void cargaInfo(string Asegurados)
        {
            dtAsegurados = new System.Data.DataTable();
            dtAsegurados = AsignToTable("exec sp_GEN_Asegurado '" + Asegurados + "'");

            if (dtAsegurados.Rows[0][0].ToString() == "-1")
            {
                lblError.Text = "*Error: " + dtAsegurados.Rows[0][1].ToString();
            }

            else
            {
                //txtNomRep.Text = dtAsegurados.Rows[0][1].ToString();
                //txtAPRep.Text = dtAsegurados.Rows[0][2].ToString();
                //txtAMRep.Text = dtAsegurados.Rows[0][3].ToString();
                //txtRFC.Text = dtAsegurados.Rows[0][4].ToString();
                //txtCalle.Text = dtAsegurados.Rows[0][5].ToString();
                //txtNE.Text = dtAsegurados.Rows[0][6].ToString();
                //txtNI.Text = dtAsegurados.Rows[0][7].ToString();
                //txtColonia.Text = dtAsegurados.Rows[0][8].ToString();
                //txtCP.Text = dtAsegurados.Rows[0][9].ToString();
                //txtMpio.Text = dtAsegurados.Rows[0][10].ToString();
                //txtCiudad.Text = dtAsegurados.Rows[0][11].ToString();
                //cmbEstado.SelectedValue = dtAsegurados.Rows[0][12].ToString();
                //txtTel1.Text = dtAsegurados.Rows[0][13].ToString();
                //txtTel2.Text = dtAsegurados.Rows[0][14].ToString();
                //txtTel3.Text = dtAsegurados.Rows[0][15].ToString();
                //txtMail.Text = dtAsegurados.Rows[0][16].ToString();

                lblError.Text = "";
            }
        }

        protected void ActualizaInfo(string Asegurados)
        {
            //  dtAsegurados = new System.Data.DataTable();
            //  string preQuery;

            //  preQuery = " @iAseguradoID = '" + Asegurados + "', " +
            //      "@cNombre_Asegurado = '" + txtNomRep.Text + "', " +
            //      "@cPaterno_Asegurado = '" + txtAPRep.Text + "', " +
            //      "@cMaterno_Asegurado = '" + txtAMRep.Text + "', " +
            //      "@cRFC_Asegurado = '" + txtRFC.Text.ToUpper() + "', " +
            //      "@cCalle_Asegurado = '" + txtCalle.Text + "', " +
            //      "@cNoExt_Asegurado = '" + txtNE.Text + "', " +
            //      "@cNoInt_Asegurado = '" + txtNI.Text + "', " +
            //      "@cColonia_Asegurado = '" + txtColonia.Text + "', " +
            //      "@cCP_Asegurado = '" + txtCP.Text + "', " +
            //      "@iEstadoID_Asegurado = '" + cmbEstado.SelectedValue.ToString() + "', " +
            //      "@cDelMun_Asegurado = '" + txtMpio.Text + "', " +
            //      "@cCiudad_Asegurado = '" + txtCiudad.Text + "', " +
            //      "@cTelefono1_Asegurado = '" + txtTel1.Text + "', " +
            //      "@cTelefono2_Asegurado = '" + txtTel2.Text + "', " +
            //      "@cTelefono3_Asegurado = '" + txtTel3.Text + "', " +
            //      "@cMail_Asegurado = '" + txtMail.Text + "', " +
            //      "@iEmpleadoID = '" + _UserID + "'";

            //  dtAsegurados = AsignToTable("exec sp_GEN_InsertaAsegurado " + preQuery);
            //  lblError.Text = "";

            //  if (dtAsegurados.Rows[0][0].ToString() == "-1")
            //  {
            //      lblError.Text = "*Error: " + dtAsegurados.Rows[0][1].ToString();
            //  }

            ////  cmbAsegurados.Items.Clear(); ;
            //  dtAsegurados = new System.Data.DataTable();

            //  dtAsegurados = AsignToTable("exec sp_GEN_Asegurado '0'");
            //  if (dtAsegurados.Rows[0][0].ToString() != "-1")
            //  {
            //   //   cmbAsegurados.DataSource = dtAsegurados;
            //    //  cmbAsegurados.DataValueField = "ID";
            //    //  cmbAsegurados.DataTextField = "Descripcion";
            //     // cmbAsegurados.DataBind();
            //  }
        }

        #region Botones

        protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
        {
            //  cargaInfo(cmbAsegurados.SelectedValue);
        }

        protected void btnClean_Click(object sender, ImageClickEventArgs e)
        {
            limpiaCampos();
        }

        protected void btnTrash_Click(object sender, ImageClickEventArgs e)
        {
            /* string Asegurados = cmbAsegurados.SelectedValue;
             dtAsegurados = new System.Data.DataTable();
             dtAsegurados = AsignToTable("exec sp_GEN_ABC_Asegurado @iType=0, @iAseguradoID='" + Asegurados + "'");

             if (dtAsegurados.Rows[0][0].ToString() == "-1")
             {
                 lblError.Text = "*Error: " + dtAsegurados.Rows[0][1].ToString();
             }

             else
             {
                 limpiaCampos();
             }*/
        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
            //   ActualizaInfo(cmbAsegurados.SelectedValue);
        }

        protected void btnNew_Click(object sender, ImageClickEventArgs e)
        {
            ActualizaInfo("0");
        }

        #endregion

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

        public string obten_Query(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
        {
            switch (Concepto)
            {
                case "imgVehiculos":
                    return "exec sp_GEN_MuestraFoto 1, '" + variable1 + "', 1;";

                case "imgObtenID":
                    return "exec sp_GEN_MuestraFoto 1, '" + variable1 + "', 2;";

                case "imgAsignID":
                    return "exec sp_GEN_MuestraFoto 1, '" + variable2 + "', 3, " + variable1 + ";";

                case "imgDelID":
                    return "exec sp_GEN_MuestraFoto 1, '" + variable1 + "', 4;";

                case "Marca":
                    return "exec sp_GEN_Cat_Marca";

                case "Modelo":
                    return "exec sp_GEN_Cat_Modelo @iMarcaID='" + variable1 + "'";

                case "TipoClase":
                    return "exec sp_GEN_Cat_TipoClase";

                case "Servicio":
                    return "exec sp_GEN_Cat_Servicio";

                case "TipoUso":
                    return "exec sp_GEN_Cat_Uso";

                case "Ramal":
                    return "exec sp_GEN_Cat_Ramal";

                case "Transmision":
                    return "exec sp_GEN_Cat_Transmision";

                case "Vehiculos":
                    if (variable1.Length <= 0)
                    {
                        variable1 = "0";
                    }
                    return "exec sp_GEN_Vehiculo null, 2, " + variable1;

                case "DelVehiculos":
                    return "exec sp_GEN_Vehiculo null, 3, '" + variable1 + "'";

                case "InsVehiculos":
                    return "exec sp_GEN_InsertaVehiculo " + variable1;

                case "Equipamiento":
                    return "exec sp_GEN_Relacion_Equipamiento " + variable1;

                case "Equipamiento_Del":
                    return "exec sp_GEN_Relacion_Equipamiento " + variable1 + ", 1";

                case "Equipamiento_Ins":
                    return "exec sp_GEN_InsertaRelacion_Equipamiento @iVehiculoID='" + variable1 + "', @iEquipamientoID='" + variable2 + "', @iEmpleadoID='" + variable3 + "'";

                case "Coberturas":
                    return "exec sp_GEN_Cat_Cobertura";

                case "BuscaPoliza":
                    return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=3;";

                case "BuscaReporte":
                    return "exec pr_GEN_ReporteSiniestro_Buscar @iReporteSiniestroID='" + variable1 + "';";

                default:
                    return "";
            }
        }
        protected void cargaEquipamiento(string sVehiculoID)
        {
            //int i = 0;
            //dtVehiculos = new System.Data.DataTable();
            //dtVehiculos = AsignToTable(obten_Query("Equipamiento", sVehiculoID, "", "", "", ""));
            //rptEquipamiento.DataSource = dtVehiculos;
            //rptEquipamiento.DataBind();

            //foreach (RepeaterItem ri in rptEquipamiento.Items)
            //{
            //    Label ident = (Label)ri.FindControl("ident");
            //    ident.Text = dtVehiculos.Rows[i][0].ToString();

            //    CheckBox checo = (CheckBox)ri.FindControl("chkEquip");
            //    checo.Checked = Convert.ToBoolean(dtVehiculos.Rows[i][2]);
            //    i += 1;
            //}
        }

        protected void cargaInfoV(string sVehiculoID)
        {
            //limpiaCampos();
            //cmbVehiculos.SelectedValue = sVehiculoID;
            //System.Data.DataTable dtDatos = new System.Data.DataTable();
            //dtVehiculos = new System.Data.DataTable();
            //dtDatos = AsignToTable(obten_Query("Vehiculos", sVehiculoID, "", "", "", ""));

            //if (dtDatos.Rows[0][0].ToString() == "-1")
            //{
            //    lblError.Text = dtDatos.Rows[0][1].ToString();
            //}

            //else
            //{
            //    txtPlacas.Text = dtDatos.Rows[0][1].ToString(); // Placas
            //    cmbMarca.SelectedValue = dtDatos.Rows[0][2].ToString();
            //    //cmbTipoClase.SelectedValue = dtDatos.Rows[0][4].ToString();
            //    //cmbServicio.SelectedValue = dtDatos.Rows[0][5].ToString();
            //    cmbTipoUso.SelectedValue = dtDatos.Rows[0][6].ToString();
            //    cmbRamal.SelectedValue = dtDatos.Rows[0][7].ToString();
            //    //cmbTransmision.SelectedValue = dtDatos.Rows[0][8].ToString();
            //    txtMotor.Text = dtDatos.Rows[0][9].ToString();
            //    txtSerie.Text = dtDatos.Rows[0][10].ToString();
            //    //txtNumPasajeros.Text = dtDatos.Rows[0][11].ToString();
            //    txtRuta.Text = dtDatos.Rows[0][12].ToString();
            //    //  txtNumEconomico.Text = dtDatos.Rows[0][13].ToString();
            //    // txtCapLitros.Text = dtDatos.Rows[0][14].ToString();
            //    //txtNumPuertas.Text = dtDatos.Rows[0][15].ToString();
            //    txtColor.Text = dtDatos.Rows[0][16].ToString();
            //    //   txtCarroceria.Text = dtDatos.Rows[0][17].ToString();

            //    templateCombo(cmbModelo, "Modelo", cmbMarca.SelectedValue.ToString());
            //    cmbModelo.SelectedValue = dtDatos.Rows[0][3].ToString();


            //    cargaEquipamiento(sVehiculoID);
            //}
        }
        protected void cmbVehiculos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //cargaInfoV(cmbVehiculos.SelectedValue.ToString());
        }
        protected void Apoyo_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (this.rdbtnlApoyo.SelectedItem.Value == "1")
                this.pnlDatosApoyo.Visible = true;
            else
                this.pnlDatosApoyo.Visible = false;
        }
        protected void Lesionados_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.rdbtnlLesionados.SelectedItem.Value == "1")
                this.pnlLesionados.Visible = true;
            else
                this.pnlLesionados.Visible = false;
        }
        protected void Cierres_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cmbCierres.SelectedItem.Value == "6")
            {

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("popWin=window.open('");
                sb.Append("PaseMedico.aspx");
                sb.Append("','','width=");
                sb.Append("730");
                sb.Append(",height=");
                sb.Append("400");
                sb.Append(",toolbar=no,location=no, directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes");
                sb.Append("');");
                sb.Append("popWin.focus();");


                ScriptManager.RegisterClientScriptBlock(this.Page, GetType(), "Pase Médico", sb.ToString(), true);
            }
        }

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
    }
}
