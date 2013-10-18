﻿<%@ Page Language="C#" AutoEventWireup="True" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    System.Data.DataTable dtAsegurados = new System.Data.DataTable();

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

            if (Request.QueryString["ID"] != null)
            {
                cmbAsegurados.SelectedValue = Request.QueryString["ID"].ToString();
                cmbAsegurados.Enabled = false;
            }

            cargaInfo(cmbAsegurados.SelectedValue);
            cargaInfoV("12");
        }

        cargaValidaciones();
    }

    #region Validaciones

    protected void cargaValidaciones()
    {
        txtRFC.Attributes.Add("onkeypress", "Validkey('rfc')");
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
        txtAMRep.Attributes.Add("onkeypress", "Validkey('nombres')");
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
        cargaCombos();
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
        lblError.Text = "";
    }

    protected void cmbAsegurados_SelectedIndexChanged(object sender, EventArgs e)
    {
        cargaInfo(cmbAsegurados.SelectedValue);
    }

    #endregion

    protected void cargaCombos()
    {
        cmbEstado.Items.Clear(); ;
        cmbAsegurados.Items.Clear(); ;
        dtAsegurados = new System.Data.DataTable();

        dtAsegurados = AsignToTable("exec sp_GEN_Asegurado '0'");
        if (dtAsegurados.Rows[0][0].ToString() != "-1")
        {
            cmbAsegurados.DataSource = dtAsegurados;
            cmbAsegurados.DataValueField = "ID";
            cmbAsegurados.DataTextField = "Descripcion";
            cmbAsegurados.DataBind();
        }

        dtAsegurados = new System.Data.DataTable();
        dtAsegurados = AsignToTable("exec sp_GEN_Cat_Estado;");
        if (dtAsegurados.Rows[0][0].ToString() != "-1")
        {
            cmbEstado.DataSource = dtAsegurados;
            cmbEstado.DataValueField = "ID";
            cmbEstado.DataTextField = "Descripcion";
            cmbEstado.DataBind();
        }

        templateCombo(cmbMarca, "Marca", "");
        templateCombo(cmbVehiculos, "Vehiculos", "");
        //templateCombo(cmbTipoClase, "TipoClase", "");
        //templateCombo(cmbServicio, "Servicio", "");
        templateCombo(cmbTipoUso, "TipoUso", "");
        templateCombo(cmbRamal, "Ramal", "");
        //templateCombo(cmbTransmision, "Transmision", "");
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
                templateCombo(cmbModelo, "Modelo", cmbMarca.SelectedValue.ToString());
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
            txtNomRep.Text = dtAsegurados.Rows[0][1].ToString();
            txtAPRep.Text = dtAsegurados.Rows[0][2].ToString();
            txtAMRep.Text = dtAsegurados.Rows[0][3].ToString();
            txtRFC.Text = dtAsegurados.Rows[0][4].ToString();
            txtCalle.Text = dtAsegurados.Rows[0][5].ToString();
            txtNE.Text = dtAsegurados.Rows[0][6].ToString();
            txtNI.Text = dtAsegurados.Rows[0][7].ToString();
            txtColonia.Text = dtAsegurados.Rows[0][8].ToString();
            txtCP.Text = dtAsegurados.Rows[0][9].ToString();
            txtMpio.Text = dtAsegurados.Rows[0][10].ToString();
            txtCiudad.Text = dtAsegurados.Rows[0][11].ToString();
            cmbEstado.SelectedValue = dtAsegurados.Rows[0][12].ToString();
            txtTel1.Text = dtAsegurados.Rows[0][13].ToString();
            txtTel2.Text = dtAsegurados.Rows[0][14].ToString();
            txtTel3.Text = dtAsegurados.Rows[0][15].ToString();
            txtMail.Text = dtAsegurados.Rows[0][16].ToString();

            lblError.Text = "";
        }
    }

    protected void ActualizaInfo(string Asegurados)
    {
        dtAsegurados = new System.Data.DataTable();
        string preQuery;

        preQuery = " @iAseguradoID = '" + Asegurados + "', " +
            "@cNombre_Asegurado = '" + txtNomRep.Text + "', " +
            "@cPaterno_Asegurado = '" + txtAPRep.Text + "', " +
            "@cMaterno_Asegurado = '" + txtAMRep.Text + "', " +
            "@cRFC_Asegurado = '" + txtRFC.Text.ToUpper() + "', " +
            "@cCalle_Asegurado = '" + txtCalle.Text + "', " +
            "@cNoExt_Asegurado = '" + txtNE.Text + "', " +
            "@cNoInt_Asegurado = '" + txtNI.Text + "', " +
            "@cColonia_Asegurado = '" + txtColonia.Text + "', " +
            "@cCP_Asegurado = '" + txtCP.Text + "', " +
            "@iEstadoID_Asegurado = '" + cmbEstado.SelectedValue.ToString() + "', " +
            "@cDelMun_Asegurado = '" + txtMpio.Text + "', " +
            "@cCiudad_Asegurado = '" + txtCiudad.Text + "', " +
            "@cTelefono1_Asegurado = '" + txtTel1.Text + "', " +
            "@cTelefono2_Asegurado = '" + txtTel2.Text + "', " +
            "@cTelefono3_Asegurado = '" + txtTel3.Text + "', " +
            "@cMail_Asegurado = '" + txtMail.Text + "', " +
            "@iEmpleadoID = '" + _UserID + "'";

        dtAsegurados = AsignToTable("exec sp_GEN_InsertaAsegurado " + preQuery);
        lblError.Text = "";

        if (dtAsegurados.Rows[0][0].ToString() == "-1")
        {
            lblError.Text = "*Error: " + dtAsegurados.Rows[0][1].ToString();
        }

        cmbAsegurados.Items.Clear(); ;
        dtAsegurados = new System.Data.DataTable();

        dtAsegurados = AsignToTable("exec sp_GEN_Asegurado '0'");
        if (dtAsegurados.Rows[0][0].ToString() != "-1")
        {
            cmbAsegurados.DataSource = dtAsegurados;
            cmbAsegurados.DataValueField = "ID";
            cmbAsegurados.DataTextField = "Descripcion";
            cmbAsegurados.DataBind();
        }
    }

    #region Botones

    protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
    {
        cargaInfo(cmbAsegurados.SelectedValue);
    }

    protected void btnClean_Click(object sender, ImageClickEventArgs e)
    {
        limpiaCampos();
    }

    protected void btnTrash_Click(object sender, ImageClickEventArgs e)
    {
        string Asegurados = cmbAsegurados.SelectedValue;
        dtAsegurados = new System.Data.DataTable();
        dtAsegurados = AsignToTable("exec sp_GEN_ABC_Asegurado @iType=0, @iAseguradoID='" + Asegurados + "'");

        if (dtAsegurados.Rows[0][0].ToString() == "-1")
        {
            lblError.Text = "*Error: " + dtAsegurados.Rows[0][1].ToString();
        }

        else
        {
            limpiaCampos();
        }
    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        ActualizaInfo(cmbAsegurados.SelectedValue);
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

            default:
                return "";
        }
    }
    protected void cargaEquipamiento(string sVehiculoID)
    {
        int i = 0;
        dtVehiculos = new System.Data.DataTable();
        dtVehiculos = AsignToTable(obten_Query("Equipamiento", sVehiculoID, "", "", "", ""));
        rptEquipamiento.DataSource = dtVehiculos;
        rptEquipamiento.DataBind();

        foreach (RepeaterItem ri in rptEquipamiento.Items)
        {
            Label ident = (Label)ri.FindControl("ident");
            ident.Text = dtVehiculos.Rows[i][0].ToString();

            CheckBox checo = (CheckBox)ri.FindControl("chkEquip");
            checo.Checked = Convert.ToBoolean(dtVehiculos.Rows[i][2]);
            i += 1;
        }
    }

    protected void cargaInfoV(string sVehiculoID)
    {
        limpiaCampos();
        cmbVehiculos.SelectedValue = sVehiculoID;
        System.Data.DataTable dtDatos = new System.Data.DataTable();
        dtVehiculos = new System.Data.DataTable();
        dtDatos = AsignToTable(obten_Query("Vehiculos", sVehiculoID, "", "", "", ""));

        if (dtDatos.Rows[0][0].ToString() == "-1")
        {
            lblError.Text = dtDatos.Rows[0][1].ToString();
        }

        else
        {
            txtPlacas.Text = dtDatos.Rows[0][1].ToString(); // Placas
            cmbMarca.SelectedValue = dtDatos.Rows[0][2].ToString();
            //cmbTipoClase.SelectedValue = dtDatos.Rows[0][4].ToString();
            //cmbServicio.SelectedValue = dtDatos.Rows[0][5].ToString();
            cmbTipoUso.SelectedValue = dtDatos.Rows[0][6].ToString();
            cmbRamal.SelectedValue = dtDatos.Rows[0][7].ToString();
            //cmbTransmision.SelectedValue = dtDatos.Rows[0][8].ToString();
            txtMotor.Text = dtDatos.Rows[0][9].ToString();
            txtSerie.Text = dtDatos.Rows[0][10].ToString();
            //txtNumPasajeros.Text = dtDatos.Rows[0][11].ToString();
            txtRuta.Text = dtDatos.Rows[0][12].ToString();
            //  txtNumEconomico.Text = dtDatos.Rows[0][13].ToString();
            // txtCapLitros.Text = dtDatos.Rows[0][14].ToString();
            //txtNumPuertas.Text = dtDatos.Rows[0][15].ToString();
            txtColor.Text = dtDatos.Rows[0][16].ToString();
            //   txtCarroceria.Text = dtDatos.Rows[0][17].ToString();

            templateCombo(cmbModelo, "Modelo", cmbMarca.SelectedValue.ToString());
            cmbModelo.SelectedValue = dtDatos.Rows[0][3].ToString();


            cargaEquipamiento(sVehiculoID);
        }
    }
    protected void cmbVehiculos_SelectedIndexChanged(object sender, EventArgs e)
    {
        cargaInfoV(cmbVehiculos.SelectedValue.ToString());
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


            ScriptManager.RegisterClientScriptBlock(this.Page,GetType(), "Pase Médico", sb.ToString(), true);
        }    
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Página sin título</title>

    <script type="text/javascript" src="Scripts/js/Funciones.js"></script>

    <style type="text/css">
        .style1
        {
            width: 30px;
        }
        .style2
        {
            width: 650px;
            height: 18px;
            text-align: right;
        }
        .style8
        {
            height: 18px;
        }
        .style10
        {
            width: 67px;
        }
        .style13
        {
            width: 38px;
        }
        .style17
        {
            width: 110px;
        }
        .style18
        {
            width: 25px;
        }
        .style19
        {
            width: 49px;
        }
        .style20
        {
            width: 50px;
        }
        .style21
        {
            width: 60px;
        }
        .style23
        {
            width: 205px;
        }
        .style24
        {
            width: 180px;
        }
        .style25
        {
            width: 53px;
        }
        .style26
        {
            width: 208px;
        }
        .style27
        {
            width: 256px;
        }
        .style28
        {
            width: 131px;
        }
        .style29
        {
            width: 120px;
        }
        .style30
        {
            width: 570px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080;">
        <table style="width: 850px; height: 400px; background: url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
            <tr>
                <td style="width: 100%; height: 100%; text-align: center;">
                    <asp:Panel ID="pnlMain" runat="server">
                        <br />
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="Datos del Asegurado"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style2" style="width:150px" align="right">
                                    <br />
                                    Asegurado:
                                </td>
                                <td class="style8" align="left">
                                    <br />
                                    <asp:DropDownList ID="cmbAsegurados" runat="server" Width="160px" AutoPostBack="True"
                                        OnSelectedIndexChanged="cmbAsegurados_SelectedIndexChanged" ForeColor="#999999"
                                        BackColor="White">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    *Nombre:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="txtNomRep" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    A. Paterno:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAPRep" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    A. Materno:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAMRep" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    RFC:
                                </td>
                                <td class="style28">
                                    <asp:TextBox ID="txtRFC" runat="server" BackColor="White" ForeColor="#999999" MaxLength="15"
                                        Width="84px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    *Teléfono 1:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="txtTel1" runat="server" Width="90px" ForeColor="#999999" MaxLength="20"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Teléfono 2:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTel2" runat="server" Width="90px" ForeColor="#999999" MaxLength="20"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Teléfono 3:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTel3" runat="server" Width="90px" ForeColor="#999999" MaxLength="20"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Mail:
                                </td>
                                <td class="style28">
                                    <asp:TextBox ID="txtMail" runat="server" Width="84px" ForeColor="#999999" MaxLength="30"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td class="style20">
                                    *Calle:
                                </td>
                                <td class="style26">
                                    <asp:TextBox ID="txtCalle" runat="server" Width="195px" ForeColor="#999999" MaxLength="30"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style21">
                                    *No. Ext:
                                </td>
                                <td class="style13">
                                    <asp:TextBox ID="txtNE" runat="server" Width="30px" ForeColor="#999999" MaxLength="10"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style20">
                                    No. Int:
                                </td>
                                <td class="style25">
                                    <asp:TextBox ID="txtNI" runat="server" Width="30px" ForeColor="#999999" MaxLength="10"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style19">
                                    *Colonia:
                                </td>
                                <td class="style17">
                                    <asp:TextBox ID="txtColonia" runat="server" Width="118px" ForeColor="#999999" MaxLength="15"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style18">
                                    *CP:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCP" runat="server" Width="60px" MaxLength="5" ForeColor="#999999"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td class="style1">
                                </td>
                                <td class="style20">
                                    *Estado:
                                </td>
                                <td class="style23">
                                    <asp:DropDownList ID="cmbEstado" runat="server" Width="200px" ForeColor="#999999"
                                        BackColor="White">
                                    </asp:DropDownList>
                                </td>
                                <td class="style20">
                                    Ciudad:
                                </td>
                                <td class="style24">
                                    <asp:TextBox ID="txtCiudad" runat="server" Width="170px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style10">
                                    Municipio/Delegación:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMpio" runat="server" Width="124px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td class="style1">
                                </td>
                                <td class="style20">
                                    Status de Póliza:
                                </td>
                                <td class="style23">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" ForeColor="#999999"
                                        BackColor="White">
                                    </asp:DropDownList>
                                </td>
                                <td class="style20">
                                    Vigencia:
                                </td>
                                <td class="style24">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="170px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style10">
                                    Deducible:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="124px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Datos del Conductor"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    *Nombre:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox3" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    A. Paterno:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    A. Materno:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    *Teléfono 1:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox7" runat="server" Width="90px" ForeColor="#999999" MaxLength="20"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td class="style20">
                                    *Calle:
                                </td>
                                <td class="style26">
                                    <asp:TextBox ID="TextBox11" runat="server" Width="195px" ForeColor="#999999" MaxLength="30"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style21">
                                    *No. Ext:
                                </td>
                                <td class="style13">
                                    <asp:TextBox ID="TextBox12" runat="server" Width="30px" ForeColor="#999999" MaxLength="10"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style20">
                                    No. Int:
                                </td>
                                <td class="style25">
                                    <asp:TextBox ID="TextBox13" runat="server" Width="30px" ForeColor="#999999" MaxLength="10"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style19">
                                    *Colonia:
                                </td>
                                <td class="style17">
                                    <asp:TextBox ID="TextBox14" runat="server" Width="118px" ForeColor="#999999" MaxLength="15"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style18">
                                    *CP:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox15" runat="server" Width="60px" MaxLength="5" ForeColor="#999999"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td class="style20">
                                    *Fecha Nac.:
                                </td>
                                <td class="style26">
                                    <asp:TextBox ID="TextBox6" runat="server" Width="195px" ForeColor="#999999" MaxLength="30"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style21">
                                    *Licencia:
                                </td>
                                <td class="style13">
                                    <asp:TextBox ID="TextBox8" runat="server" Width="30px" ForeColor="#999999" MaxLength="10"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td class="style20">
                                    Vigencia:
                                </td>
                                <td class="style25">
                                    <asp:TextBox ID="TextBox9" runat="server" Width="30px" ForeColor="#999999" MaxLength="10"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Datos del Vehículo"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%; height: 100px;">
                            <tr>
                                <td class="style8">
                                    <table style="width: 100%; height: 100px;">
                                        <tr>
                                            <td class="style9">
                                            </td>
                                            <td style="text-align: center;" class="style1">
                                                <table style="width: 100%; height: 100px;">
                                                    <tr>
                                                        <td class="style16">
                                                            <br />
                                                            Placa Vehículo:<br />
                                                            <asp:DropDownList ID="cmbVehiculos" runat="server" Width="200px" OnSelectedIndexChanged="cmbVehiculos_SelectedIndexChanged"
                                                                AutoPostBack="True" ForeColor="#999999" BackColor="White">
                                                            </asp:DropDownList>
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style16">
                                                            <div id="Holder">
                                                                <div class="coin-slider" id="coin-slider-games">
                                                                    <div id="autos" style="position: relative;">
                                                                        <asp:Label ID="lblSlider" runat="server" Text=""></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td class="style7">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="style5">
                                    <asp:Panel runat="server" ID="pnlVeh_1" Visible="true">
                                        <table style="width: 100%; height: 100px;">
                                            <tr>
                                                <td class="style12">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    *Marca:
                                                </td>
                                                <td class="style13">
                                                    <asp:DropDownList ID="cmbMarca" runat="server" Width="100px" ForeColor="#999999"
                                                        AutoPostBack="True" BackColor="White">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style13">
                                                    *Tipo de Uso:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cmbTipoUso" runat="server" Width="100px" ForeColor="#999999"
                                                        BackColor="White">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    *Modelo:
                                                </td>
                                                <td class="style13">
                                                    <asp:DropDownList ID="cmbModelo" runat="server" Width="100px" ForeColor="#999999"
                                                        BackColor="White">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style13">
                                                    *Ramal:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="cmbRamal" runat="server" Width="100px" ForeColor="#999999"
                                                        BackColor="White">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    *Motor:<br />
                                                </td>
                                                <td class="style13">
                                                    <asp:TextBox ID="txtMotor" runat="server" Width="100px" ForeColor="#999999" MaxLength="15"
                                                        BackColor="White"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    *Serie:<br />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSerie" runat="server" Width="100px" ForeColor="#999999" MaxLength="15"
                                                        BackColor="White"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    *Placas:<br />
                                                </td>
                                                <td class="style13">
                                                    <asp:TextBox ID="txtPlacas" runat="server" Width="100px" ForeColor="#999999" MaxLength="10"
                                                        BackColor="White"></asp:TextBox>
                                                </td>
                                                <td class="style13">
                                                    Ruta:<br />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRuta" runat="server" Width="100px" ForeColor="#999999" MaxLength="30"
                                                        BackColor="White"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td class="style13">
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    Color:
                                                </td>
                                                <td class="style13">
                                                    <asp:TextBox ID="txtColor" runat="server" Width="100px" ForeColor="#999999" MaxLength="15"
                                                        BackColor="White"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="pnlVeh_2" Visible="false">
                                        <table style="width: 100%; height: 100px;">
                                            <tr>
                                                <td>
                                                    <table style="width: 100%; height: 280px;">
                                                        <tr>
                                                            <td style="width: 100%; height: 60px">
                                                                Equipamiento:
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div id="equipamiento" style="width: 100%; height: 200px; overflow: auto;">
                                                                    <table style="border-style: none; border-width: 0px; width: 100%; height: 100%;">
                                                                        <asp:Repeater ID="rptEquipamiento" runat="server">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <%# DataBinder.Eval(Container.DataItem, "Name") %>:
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="ident" runat="server" Visible="false"></asp:Label>
                                                                                        <asp:CheckBox ID="chkEquip" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                            <AlternatingItemTemplate>
                                                                                <tr style="background-color: #fafafa;">
                                                                                    <td>
                                                                                        <%# DataBinder.Eval(Container.DataItem, "Name") %>:
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="ident" runat="server" Visible="false"></asp:Label>
                                                                                        <asp:CheckBox ID="chkEquip" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                            </AlternatingItemTemplate>
                                                                        </asp:Repeater>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Font-Size="X-Large" Text="Información del siniestro"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    Hora Asignada:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox10" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Arribo:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox16" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Termino:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox17" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    Ubicación:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox18" runat="server" Width="90px" ForeColor="#999999" MaxLength="20"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style20">
                                    Narración de los hechos:
                                </td>
                                <td class="style8">
                                    <asp:TextBox ID="TextBox27" runat="server" Width="100%" ForeColor="#999999" MaxLength="45"
                                        BackColor="White" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Datos del vehículo tercero"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    Nombre del propietario:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox19" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Dirección:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox20" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Teléfono:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox21" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    Nombre del conductor:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox23" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Licencia:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox24" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Teléfono:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox25" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    Marca:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox22" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Tipo:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox26" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Modelo:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox28" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Color:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox29" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    No. Serie:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox30" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    No. Motor:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox31" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Placas:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox32" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    Cia. de seguros:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox33" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Póliza:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox34" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Vigencia:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox35" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    Cobertura:
                                </td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox36" runat="server" Width="90px" ForeColor="#999999" MaxLength="35"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Siniestro:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox37" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                                <td>
                                    Ajustador:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox38" runat="server" Width="90px" ForeColor="#999999" MaxLength="25"
                                        BackColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style20">
                                    Daños:
                                </td>
                                <td class="style8">
                                    <asp:TextBox ID="TextBox39" runat="server" Width="100%" ForeColor="#999999" MaxLength="45"
                                        BackColor="White" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style20">
                                    Apoyo:
                                </td>
                                <td class="style8" align="left">
                                    <asp:RadioButtonList ID="rdbtnlApoyo" runat="server" RepeatDirection="Horizontal"
                                        OnSelectedIndexChanged="Apoyo_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                            </tr>
                        </table>
                        <asp:Panel ID="pnlDatosApoyo" runat="server" Visible="false">
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">
                                    </td>
                                    <td class="style3">
                                        Transito:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox40" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td class="style6">
                                        Seguridad Pública:
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="TextBox41" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    <td class="style3">
                                        INVEA:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox42" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">
                                        AMBULANCIA
                                    </td>
                                    <td class="style3">
                                        Dependencia:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox43" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td class="style6">
                                        Placas:
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="TextBox44" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    <td class="style3">
                                        No.:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox45" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">
                                        PATRULLA
                                    </td>
                                    <td class="style3">
                                        Dependencia:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox46" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td class="style6">
                                        Placas:
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="TextBox47" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    <td class="style3">
                                        No.:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox48" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">
                                        OFICIAL
                                    </td>
                                    <td class="style3">
                                        Dependencia:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox49" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td class="style6">
                                        Placas:
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="TextBox50" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    <td class="style3">
                                        No.:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox51" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style1">
                                        Protec.Civil:
                                    </td>
                                    <td class="style3">
                                        Dependencia:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox52" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td class="style6">
                                        Placas:
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="TextBox53" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    <td class="style3">
                                        Organo Normativo:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox54" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td class="style20">
                                    Lesionados:
                                </td>
                                <td class="style8" align="left">
                                    <asp:RadioButtonList ID="rdbtnlLesionados" runat="server" RepeatDirection="Horizontal"
                                        OnSelectedIndexChanged="Lesionados_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="style20" style="width: 120px">
                                    Pase Médico:
                                </td>
                                <td class="style8" align="left">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                            </tr>
                        </table>
                        <asp:Panel ID="pnlLesionados" runat="server" Visible="false">
                            <table style="width: 100%">
                                <tr>
                                    <td class="style3">
                                        Viajero:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox55" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td class="style6">
                                        3o:
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="TextBox56" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    <td class="style3">
                                        Nombre:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox57" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td class="style3">
                                        Teléfono:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox58" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style20">
                                        Dirección:
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox59" runat="server" Width="100%" ForeColor="#999999" MaxLength="45"
                                            BackColor="White" Rows="5"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style20">
                                        Observaciones:
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox60" runat="server" Width="100%" ForeColor="#999999" MaxLength="45"
                                            BackColor="White" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style3">
                                        Viajero:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox61" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td class="style6">
                                        3o:
                                    </td>
                                    <td class="style7">
                                        <asp:TextBox ID="TextBox62" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td>
                                    <td class="style3">
                                        Nombre:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox63" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                    <td class="style3">
                                        Teléfono:
                                    </td>
                                    <td class="style5">
                                        <asp:TextBox ID="TextBox64" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                                            BackColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style20">
                                        Dirección:
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox65" runat="server" Width="100%" ForeColor="#999999" MaxLength="45"
                                            BackColor="White" Rows="5"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td class="style20">
                                        Observaciones:
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="TextBox66" runat="server" Width="100%" ForeColor="#999999" MaxLength="45"
                                            BackColor="White" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Font-Size="X-Large" Text="Informe Ajustador"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style20">
                                    RESPONSABILIDAD:
                                </td>
                                <td class="style8" align="left">
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Asegurado" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Tercero" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="style8">
                                    <asp:TextBox ID="TextBox67" runat="server" Width="100%" ForeColor="#999999" MaxLength="45"
                                        BackColor="White" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        
                        <br />
                        <br />
                           <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Font-Size="X-Large" Text="Croquis"></asp:Label>
                                </td>
                            </tr>
                        </table>
                              <asp:Panel runat="server" ID="pnl1" >
                                            <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyBNYMw_NXIyFSUxAHtXTdcYBYuN5kM4Xrs"
                                                type="text/javascript"></script>
                                            <script type="text/javascript">                                                 var polygon;
                                                function load() {
                                                    if (GBrowserIsCompatible()) {
                                                        var map = new GMap2(document.getElementById("map"));
                                                        map.setCenter(new GLatLng(-99.220118, 19.429979), 13);
                                                        map.openInfoWindowHtml(new GLatLng(19.398800, -99.261069), "<h3>Atendido por: </h1><img id='Grafica' src='images/Logo.png' style='float:left;margin-right:20px;'>");

                                                        map.addControl(new GMapTypeControl());
                                                        map.addControl(new GSmallZoomControl());
                                                        map.addControl(new GLargeMapControl);
                                                        map.setMapType(G_NORMAL_MAP);


                                                        //DEFINO EL ICONO
                                                        var iconoMarca = new GIcon(G_DEFAULT_ICON);


                                                        function createMarker(point, nombre, ruta, VMU, VMV, Grw, Cove) {

                                                            //CREO LA MARCA EN EL PUNTO Y CON EL ICONO DESEADO
                                                            var marker = new GMarker(point, iconoMarca);

                                                            GEvent.addListener(marker, 'click', function () {
                                                                marker.openInfoWindowHtml("<span style='font-size: 8pt; font-family: verdana'>" + nombre + "</span>");
                                                            });
                                                            return marker;
                                                        }

                                                        // Punto Rojo
                                                        var point = new GPoint(-99.250924, 19.386437);
                                                        var nombre = 'Lugar del Accidente';
                                                        var ruta = "";
                                                        var VMU = '';
                                                        var VMV = '';
                                                        var Grw = '';
                                                        var Cove = ''
                                                        var marker = createMarker(point, nombre, ruta, VMU, VMV, Grw, Cove);
                                                        map.addOverlay(marker);
                                                                                
                                                    }
                                                }

                                                window.onload = load
	//]]>

                                            </script>
                                            <div id="map" style="width: 90%; height: 300px">
                                            </div>
                                        </asp:Panel>
                                 
                        <br />
                        <br />
                           <table style="width: 100%">
                            <tr>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Font-Size="X-Large" Text="Cierre"></asp:Label>
                                </td>
                            </tr>
                        </table>
                                  <table style="width: 100%">
                            <tr>
                                <td class="style2" style="width:150px" align="right">
                                    <br />
                                    Indique el tipo de cierre:
                                </td>
                                <td class="style8" align="left">
                                    <br />
                                    <asp:DropDownList ID="cmbCierres" runat="server" Width="160px" AutoPostBack="True" ForeColor="#999999" BackColor="White" OnSelectedIndexChanged="Cierres_SelectedIndexChanged">
                                        <asp:ListItem Text="Seleccione" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No localizado" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Convenio" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Pase a cobro" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Orden de admisión" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Pase Médico" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td class="style30">
                    <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                </td>
                <td class="style27" style="text-align: right">
                    <asp:ImageButton ID="btnRefresh" runat="server" ImageUrl="images/refresh.gif" OnClick="btnRefresh_Click" />
                    &nbsp;<asp:ImageButton ID="btnClean" runat="server" ImageUrl="images/clean.gif" OnClick="btnClean_Click" />
                    &nbsp;<asp:ImageButton ID="btnTrash" runat="server" ImageUrl="images/trash.gif" OnClick="btnTrash_Click" />
                    &nbsp;<asp:ImageButton ID="btnSave" runat="server" ImageUrl="images/save.gif" OnClick="btnSave_Click" />
                    &nbsp;<asp:ImageButton ID="btnNew" runat="server" ImageUrl="images/add.gif" OnClick="btnNew_Click" />
                </td>
                <td>
                </td>
            </tr>
        </table>
   
    </div>
    </form>
</body>
</html>
