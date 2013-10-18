<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    #region Load

    string _UserApp;
    string _UserID;
    int _imgSize;
    System.Data.DataTable dtVehiculos = new System.Data.DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        validaSession();
        cargaValidaciones();

        if (!IsPostBack)
        {
            cargaCombos();

            if (Request.QueryString["ID"] != null)
            {
                cmbVehiculos.SelectedValue = Request.QueryString["ID"].ToString();
                cmbVehiculos.Enabled = false;
            }
            
            cargaInfoV(cmbVehiculos.SelectedValue.ToString());
        }
    }

    #endregion

    #region Validaciones

    protected void cargaValidaciones()
    {
        txtMotor.Attributes.Add("onkeypress", "Validkey('rfc')");
        txtSerie.Attributes.Add("onkeypress", "Validkey('rfc')");
        txtNumPasajeros.Attributes.Add("onkeypress", "Validkey('numerico')");
        txtCapLitros.Attributes.Add("onkeypress", "Validkey('numerico')");
        txtPlacas.Attributes.Add("onkeypress", "Validkey('placas')");
        txtRuta.Attributes.Add("onkeypress", "Validkey('domicilio')");
        txtColor.Attributes.Add("onkeypress", "Validkey('texto')");
        txtNumEconomico.Attributes.Add("onkeypress", "Validkey('domicilio')");
        txtNumPuertas.Attributes.Add("onkeypress", "Validkey('numerico')");
        txtCarroceria.Attributes.Add("onkeypress", "Validkey('domicilio')");
    }

    protected void limpiaCampos()
    {
        cargaCombos();
        txtPlacas.Text = ""; // Placas
        txtMotor.Text = "";
        txtSerie.Text = "";
        txtNumPasajeros.Text = "";
        txtRuta.Text = "";
        txtNumEconomico.Text = "";
        txtCapLitros.Text = "";
        txtNumPuertas.Text = "";
        txtColor.Text = "";
        txtCarroceria.Text = "";
        lblError.Text = "";
        lblFoto.Text = "";
        lblSlider.Text = "";
        _imgSize = 0;
        Session["_imgSize_1864984"] = null;
        Session["_FotoImg_118649461"] = null;
        Session["_FotoImg_218649461"] = null;
        Session["_FotoImg_318649461"] = null;
        Session["_FotoImg_418649461"] = null;
        Session["_FotoImg_518649461"] = null;
        Session["_FotoImg_618649461"] = null;
        Session["_FotoImg_718649461"] = null;
        Session["_FotoImg_818649461"] = null;

        foreach (RepeaterItem ri in rptEquipamiento.Items)
        {
            CheckBox checo = (CheckBox)ri.FindControl("chkEquip");
            checo.Checked = false;
        }

        pnlVeh_1.Visible = true;
        pnlVeh_2.Visible = false;
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

        if (Session["_imgSize_1864984"] == null)
        {
            _imgSize = 0;
        }

        else
        {
            _imgSize = Convert.ToInt32(Session["_imgSize_1864984"]);
        }
    }

    #endregion

    #region Combos

    protected void cargaCombos()
    {
        templateCombo(cmbMarca, "Marca", "");
        templateCombo(cmbVehiculos, "Vehiculos", "");
        templateCombo(cmbTipoClase, "TipoClase", "");
        templateCombo(cmbServicio, "Servicio", "");
        templateCombo(cmbTipoUso, "TipoUso", "");
        templateCombo(cmbRamal, "Ramal", "");
        templateCombo(cmbTransmision, "Transmision", "");
    }

    protected void cmbMarca_SelectedIndexChanged(object sender, EventArgs e)
    {
        templateCombo(cmbModelo, "Modelo", cmbMarca.SelectedValue.ToString());
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

    #endregion

    #region Imagenes

    protected string obtenIDName(String size)
    {
        dtVehiculos = new System.Data.DataTable();
        dtVehiculos = AsignToTable(obten_Query("imgObtenID", size.ToString(), "", "", "", ""));
        return dtVehiculos.Rows[0][0].ToString();
    }

    protected void eliminaIDName(string fileName)
    {
        dtVehiculos = new System.Data.DataTable();
        dtVehiculos = AsignToTable(obten_Query("imgDelID", fileName, "", "", "", ""));
    }

    protected void cargaImagenes(string Identificador)
    {
        dtVehiculos = new System.Data.DataTable();
        dtVehiculos = AsignToTable(obten_Query("imgVehiculos", Identificador, "", "", "", ""));
        lblSlider.Text = dtVehiculos.Rows[0][0].ToString();

        for (int counter = 0; counter < (dtVehiculos.Rows.Count); counter++)
        {
            if (dtVehiculos.Rows[0][0].ToString() != "")
            {
                _imgSize += Convert.ToInt32(dtVehiculos.Rows[counter][1]);

                switch (counter)
                {
                    case 0:
                        Session["_FotoImg_118649461"] = dtVehiculos.Rows[counter][2].ToString();
                        break;

                    case 1:
                        Session["_FotoImg_218649461"] = dtVehiculos.Rows[counter][2].ToString();
                        break;

                    case 2:
                        Session["_FotoImg_318649461"] = dtVehiculos.Rows[counter][2].ToString();
                        break;

                    case 3:
                        Session["_FotoImg_418649461"] = dtVehiculos.Rows[counter][2].ToString();
                        break;

                    case 4:
                        Session["_FotoImg_518649461"] = dtVehiculos.Rows[counter][2].ToString();
                        break;

                    case 5:
                        Session["_FotoImg_618649461"] = dtVehiculos.Rows[counter][2].ToString();
                        break;

                    case 6:
                        Session["_FotoImg_718649461"] = dtVehiculos.Rows[counter][2].ToString();
                        break;

                    case 7:
                        Session["_FotoImg_818649461"] = dtVehiculos.Rows[counter][2].ToString();
                        break;
                }
            }
        }
    }

    protected void guardaImagenes(string iVehiculoID)
    {
        if (Session["_FotoImg_118649461"] != null)
        {
            AsignaImagen(iVehiculoID, Session["_FotoImg_118649461"].ToString());
        }

        if (Session["_FotoImg_218649461"] != null)
        {
            AsignaImagen(iVehiculoID, Session["_FotoImg_218649461"].ToString());
        }

        if (Session["_FotoImg_318649461"] != null)
        {
            AsignaImagen(iVehiculoID, Session["_FotoImg_318649461"].ToString());
        }

        if (Session["_FotoImg_418649461"] != null)
        {
            AsignaImagen(iVehiculoID, Session["_FotoImg_418649461"].ToString());
        }

        if (Session["_FotoImg_518649461"] != null)
        {
            AsignaImagen(iVehiculoID, Session["_FotoImg_518649461"].ToString());
        }

        if (Session["_FotoImg_618649461"] != null)
        {
            AsignaImagen(iVehiculoID, Session["_FotoImg_618649461"].ToString());
        }

        if (Session["_FotoImg_718649461"] != null)
        {
            AsignaImagen(iVehiculoID, Session["_FotoImg_718649461"].ToString());
        }

        if (Session["_FotoImg_818649461"] != null)
        {
            AsignaImagen(iVehiculoID, Session["_FotoImg_818649461"].ToString());
        }
    }

    protected void AsignaImagen(string iVehiculoID, string idImagen)
    {
        dtVehiculos = new System.Data.DataTable();
        dtVehiculos = AsignToTable(obten_Query("imgAsignID", iVehiculoID, idImagen, "", "", ""));
    }

    protected void btnUpload_Click(object sender, ImageClickEventArgs e)
    {
        String savePath = ".\\images\\autos\\";

        if (updImagen.HasFile)
        {
            string extension = System.IO.Path.GetExtension(updImagen.FileName).ToLower();

            if (extension != ".jpg" && extension != ".gif" && extension != ".jpeg" && extension != ".png")
            {
                lblFoto.Text = "No se seleccionó una foto a subir.";
            }

            else
            {
                int fileSize = updImagen.PostedFile.ContentLength;

                if (fileSize >= 3145728)
                {
                    lblFoto.Text = "El archivo es demasiado grande (3Mb).";
                }

                else if ((_imgSize + fileSize) >= 3145728)
                {
                    lblFoto.Text = "Los archivos sobrepasaron el límite (3Mb).";
                }

                else
                {
                    String fileName;    // updImagen.FileName;

                    switch (extension)
                    {
                        case ".jpg":
                            fileName = obtenIDName(fileSize.ToString() + "-1");
                            break;

                        case ".gif":
                            fileName = obtenIDName(fileSize.ToString() + "-2");
                            break;

                        case ".jpeg":
                            fileName = obtenIDName(fileSize.ToString() + "-3");
                            break;

                        case ".png":
                            fileName = obtenIDName(fileSize.ToString() + "-4");
                            break;

                        default:
                            fileName = obtenIDName(fileSize.ToString() + "-0");
                            break;
                    }

                    string result = saveFotoRAM(fileName, fileSize);

                    if (result == "0")
                    {
                        savePath += (fileName + extension);
                        updImagen.SaveAs(Server.MapPath(".") + savePath);
                        lblSlider.Text += "<a href='delImagen.aspx?img=" + fileName + ".jpg' target='_blank'><img id='scale-down' src='images/autos/" + fileName + ".jpg' alt='' style='display: none;' /></a>";
                    }

                    else
                    {
                        eliminaIDName(fileName);
                        lblFoto.Text = result;
                    }

                }
            }
        }
        else
        {
            // Notify the user that a file was not uploaded.
            lblFoto.Text = "No se seleccionó una foto a subir.";
            cargaImagenes("1");
        }
    }

    protected string saveFotoRAM(string Foto, int size)
    {
        if (Session["_FotoImg_118649461"] == null)
        {
            Session["_FotoImg_118649461"] = Foto;
        }

        else if (Session["_FotoImg_218649461"] == null)
        {
            Session["_FotoImg_218649461"] = Foto;
        }

        else if (Session["_FotoImg_318649461"] == null)
        {
            Session["_FotoImg_318649461"] = Foto;
        }

        else if (Session["_FotoImg_418649461"] == null)
        {
            Session["_FotoImg_418649461"] = Foto;
        }

        else if (Session["_FotoImg_518649461"] == null)
        {
            Session["_FotoImg_518649461"] = Foto;
        }

        else if (Session["_FotoImg_618649461"] == null)
        {
            Session["_FotoImg_618649461"] = Foto;
        }

        else if (Session["_FotoImg_718649461"] == null)
        {
            Session["_FotoImg_718649461"] = Foto;
        }

        else if (Session["_FotoImg_818649461"] == null)
        {
            Session["_FotoImg_818649461"] = Foto;
        }

        else
        {
            return "Límite de fotos excedido";
        }

        _imgSize += size;
        Session["_imgSize_1864984"] = _imgSize.ToString();
        return "0";

    }

    #endregion

    #region Botones

    protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
    {
        cargaInfoV(cmbVehiculos.SelectedValue.ToString());
    }

    protected void btnClean_Click(object sender, ImageClickEventArgs e)
    {
        limpiaCampos();
    }

    protected void btnTrash_Click(object sender, ImageClickEventArgs e)
    {
        eliminarVehiculo(cmbVehiculos.SelectedValue.ToString());
        limpiaCampos();
    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        actualizaInfo(cmbVehiculos.SelectedValue.ToString());
    }

    protected void btnNew_Click(object sender, ImageClickEventArgs e)
    {
        actualizaInfo("");
    }

    protected void btnEquip_Click(object sender, ImageClickEventArgs e)
    {
        pnlVeh_1.Visible = false;
        pnlVeh_2.Visible = true;
    }

    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        pnlVeh_1.Visible = true;
        pnlVeh_2.Visible = false;
    }

    #endregion

    #region ProcesosData

    protected void cmbVehiculos_SelectedIndexChanged(object sender, EventArgs e)
    {
        cargaInfoV(cmbVehiculos.SelectedValue.ToString());
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
            cmbTipoClase.SelectedValue = dtDatos.Rows[0][4].ToString();
            cmbServicio.SelectedValue = dtDatos.Rows[0][5].ToString();
            cmbTipoUso.SelectedValue = dtDatos.Rows[0][6].ToString();
            cmbRamal.SelectedValue = dtDatos.Rows[0][7].ToString();
            cmbTransmision.SelectedValue = dtDatos.Rows[0][8].ToString();
            txtMotor.Text = dtDatos.Rows[0][9].ToString();
            txtSerie.Text = dtDatos.Rows[0][10].ToString();
            txtNumPasajeros.Text = dtDatos.Rows[0][11].ToString();
            txtRuta.Text = dtDatos.Rows[0][12].ToString();
            txtNumEconomico.Text = dtDatos.Rows[0][13].ToString();
            txtCapLitros.Text = dtDatos.Rows[0][14].ToString();
            txtNumPuertas.Text = dtDatos.Rows[0][15].ToString();
            txtColor.Text = dtDatos.Rows[0][16].ToString();
            txtCarroceria.Text = dtDatos.Rows[0][17].ToString();

            templateCombo(cmbModelo, "Modelo", cmbMarca.SelectedValue.ToString());
            cmbModelo.SelectedValue = dtDatos.Rows[0][3].ToString();

            cargaImagenes(sVehiculoID);
            cargaEquipamiento(sVehiculoID);
        }
    }

    protected void eliminarVehiculo(string sVehiculoID)
    {
        dtVehiculos = new System.Data.DataTable();
        dtVehiculos = AsignToTable(obten_Query("DelVehiculos", sVehiculoID, "", "", "", ""));

        if (dtVehiculos.Rows[0][0].ToString() == "-1")
        {
            lblError.Text = dtVehiculos.Rows[0][1].ToString();
        }
    }

    protected void actualizaInfo(string iVehiculoID)
    {
        string preQUery;

        preQUery = "@iVehiculoID= '" + iVehiculoID +
            "', @iMarcaID = '" + cmbMarca.SelectedValue.ToString() +
            "', @iModeloID = '" + cmbModelo.SelectedValue.ToString() +
            "', @iTipoClaseID = '" + cmbTipoClase.SelectedValue.ToString() +
            "', @iServicioID = '" + cmbServicio.SelectedValue.ToString() +
            "', @iTipoUsoID = '" + cmbTipoUso.SelectedValue.ToString() +
            "', @iRamalID = '" + cmbRamal.SelectedValue.ToString() +
            "', @iTipoTransmisionID = '" + cmbTransmision.SelectedValue.ToString() +
            "', @cNumMotor = '" + txtMotor.Text +
            "', @cNumSerie = '" + txtSerie.Text +
            "', @iCapPasajeros = '" + txtNumPasajeros.Text +
            "', @cNumPlacas = '" + txtPlacas.Text +
            "', @cRuta = '" + txtRuta.Text +
            "', @cNumEconomico = '" + txtNumEconomico.Text +
            "', @iCapLitros = '" + txtCapLitros.Text +
            "', @iNoPuertas = '" + txtNumPuertas.Text +
            "', @cColor = '" + txtColor.Text +
            "', @cCarroceria = '" + txtCarroceria.Text +
            "', @iEmpleadoID = '" + _UserID + "'";

        dtVehiculos = new System.Data.DataTable();
        dtVehiculos = AsignToTable(obten_Query("InsVehiculos", preQUery, "", "", "", ""));

        if (dtVehiculos.Rows[0][0].ToString() == "-1")
        {
            lblError.Text = dtVehiculos.Rows[0][1].ToString();
        }

        else
        {
            if (iVehiculoID == "0" || iVehiculoID == "")
            {
                iVehiculoID = dtVehiculos.Rows[0][0].ToString();
            }

            guardaImagenes(iVehiculoID);
            guardaEquipamiento(iVehiculoID);
            templateCombo(cmbVehiculos, "Vehiculos", "");
            cmbVehiculos.SelectedValue = iVehiculoID;

            lblError.Text = "Datos guardados con éxito";
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

    protected void guardaEquipamiento(string sVehiculoID)
    {
        int i = 0;

        dtVehiculos = new System.Data.DataTable();
        dtVehiculos = AsignToTable(obten_Query("Equipamiento_Del", sVehiculoID, "", "", "", ""));

        System.Data.DataTable dtEquipamiento = new System.Data.DataTable();

        foreach (RepeaterItem ri in rptEquipamiento.Items)
        {
            Label ident = (Label)ri.FindControl("ident");
            CheckBox checo = (CheckBox)ri.FindControl("chkEquip");

            if (checo.Checked)
            {
                dtEquipamiento = new System.Data.DataTable();
                dtVehiculos = AsignToTable(obten_Query("Equipamiento_Ins", sVehiculoID, ident.Text, _UserID, "", ""));
            }

            i += 1;
        }
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

</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <script type="text/javascript" src="Scripts/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="Scripts/js/coin-slider.js"></script>
    <script type="text/javascript" src="Scripts/js/Funciones.js"></script>
    <link rel="stylesheet" href="styles/coin-slider-styles.css" type="text/css" />
    <link rel="stylesheet" href="styles/file-upload.css" type="text/css" />
    <title>Página sin título</title>
    <script type="text/javascript">
        function SetFileName() {
            var arrFileName = document.getElementById('<%= updImagen.ClientID %>').value.split('\\');
            document.getElementById('<%= lblFoto.ClientID %>').innerHTML = arrFileName[arrFileName.length - 1];
        }
    </script>
    <style type="text/css">
        #equipamiento {
	    width: 290px;
	    height: 330px;
	    overflow: auto;
	    position: relative;
	    }
    	
        .style1
        {
            width: 396px;
        }
        .style2
        {
            width: 220px;
        }
        .style5
        {
            width: 587px;
        }
        .style7
        {
            width: 13px;
        }
        .style8
        {
            width: 453px;
        }
        .style9
        {
            width: 31px;
        }
        .style10
        {
            text-align: left;
        }
        .style11
        {
            width: 15px;
        }
        .style12
        {
            width: 100px;
        }
        .style13
        {
            width: 120px;
        }
        .style14
        {
            width: 30px;
        }
        .style15
        {
            width: 49px;
        }
        .style16
        {
            width: 365px;
        }
    </style>
</head>
<body style="background-color:#757575;">
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080">
    <table style="width:880px; height:450px; background:url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
        <tr>
            <td style="width:100%; height:100%; text-align:center;">
                
        <table style="width:100%; height:100px;">
            <tr>
                <td class="style8">
                    <table style="width:100%; height:100px;">
                        <tr>
                            <td class="style9">
                            </td>
                            <td style="text-align:center;" class="style1">
                                <table style="width:100%; height:100px;">
                                    <tr>
                                        <td class="style16">
                                            <br />
                                            Placa Vehículo:<br />
                                            <asp:DropDownList ID="cmbVehiculos" runat="server" Width="200px" 
                                                onselectedindexchanged="cmbVehiculos_SelectedIndexChanged" 
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
		                                            <div id="autos" style="position: relative; ">
                                                        <asp:Label ID="lblSlider" runat="server" Text=""></asp:Label>
                                                    </div>			
	                                            </div>

                                                <script type="text/javascript">
                                                    $(document).ready(function() {
                                                        $('#autos').coinslider({ width: 300, height: 150 });
                                                    });
                                                </script>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style16">
                                            <table style="width:100%; height:100px;">
                                                <tr>
                                                    <td class="style11"></td>
                                                    <td class="style2">
                                                        <div >
		                                                    <label class="file-upload">
			                                                    <span><strong>&nbsp;Seleccionar Foto</strong></span>
			                                                    <asp:FileUpload runat="server" ID="updImagen" onchange="SetFileName()" />
		                                                    </label>
	                                                    </div>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:ImageButton ID="btnUpload" runat="server" ImageUrl="images/upload.gif" 
                                                            onclick="btnUpload_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style11"></td>
                                                    <td class="style10">
                                                        <asp:Label ID="lblFoto" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
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
                    <table style="width:100%; height:100px;">
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">*Marca:
                            </td>
                            <td class="style13">
                                <asp:DropDownList ID="cmbMarca" runat="server" Width="100px" 
                                    ForeColor="#999999" AutoPostBack="True" 
                                    onselectedindexchanged="cmbMarca_SelectedIndexChanged" BackColor="White">
                                </asp:DropDownList>
                            </td>
                            <td class="style13">*Tipo de Uso:                             </td>
                            <td>
                                <asp:DropDownList ID="cmbTipoUso" runat="server" Width="100px" 
                                    ForeColor="#999999" BackColor="White">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">*Modelo:
                            </td>
                            <td class="style13">
                                <asp:DropDownList ID="cmbModelo" runat="server" Width="100px" 
                                    ForeColor="#999999" BackColor="White">
                                </asp:DropDownList>
                            </td>
                            <td class="style13">*Ramal:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbRamal" runat="server" Width="100px" 
                                    ForeColor="#999999" BackColor="White">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">*Tipo/Clase:
                            </td>
                            <td class="style13">
                                <asp:DropDownList ID="cmbTipoClase" runat="server" Width="100px" 
                                    ForeColor="#999999" BackColor="White">
                                </asp:DropDownList>
                            </td>
                            <td class="style13">*Transmisión:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbTransmision" runat="server" Width="100px" 
                                    ForeColor="#999999" BackColor="White">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">*Servicio:
                            </td>
                            <td class="style13">
                                <asp:DropDownList ID="cmbServicio" runat="server" Width="100px" 
                                    ForeColor="#999999" BackColor="White">
                                </asp:DropDownList>
                            </td>
                            <td class="style13">Carroceria:
                            </td>
                            <td>
                                <asp:TextBox ID="txtCarroceria" runat="server" BackColor="White" 
                                    ForeColor="#999999" MaxLength="20" Width="100px"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">*Motor:<br />
                            </td>
                            <td class="style13">
                                <asp:TextBox ID="txtMotor" runat="server" Width="100px" ForeColor="#999999" 
                                    MaxLength="15" BackColor="White"></asp:TextBox>
                            </td>
                            <td class="style13">*Serie:<br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtSerie" runat="server" Width="100px" ForeColor="#999999" 
                                    MaxLength="15" BackColor="White"></asp:TextBox>
                            </td>
                            <td><br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">Núm Pasajeros:<br />
                            </td>
                            <td class="style13">
                                <asp:TextBox ID="txtNumPasajeros" runat="server" Width="100px" 
                                    ForeColor="#999999" MaxLength="2" BackColor="White"></asp:TextBox>
                            </td>
                            <td class="style13">*Capacidad (Lts):<br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtCapLitros" runat="server" Width="100px" ForeColor="#999999" 
                                    MaxLength="3" BackColor="White"></asp:TextBox>
                            </td>
                            <td><br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">*Placas:<br />
                            </td>
                            <td class="style13">
                                <asp:TextBox ID="txtPlacas" runat="server" Width="100px" ForeColor="#999999" 
                                    MaxLength="10" BackColor="White"></asp:TextBox>
                            </td>
                            <td class="style13">Ruta:<br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtRuta" runat="server" Width="100px" ForeColor="#999999" 
                                    MaxLength="30" BackColor="White"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">*Núm. Puertas:<br />
                            </td>
                            <td class="style13">
                                <asp:TextBox ID="txtNumPuertas" runat="server" Width="100px" ForeColor="#999999" 
                                    MaxLength="1" BackColor="White"></asp:TextBox>
                            </td>
                            <td class="style13">Núm. Económico:<br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtNumEconomico" runat="server" Width="100px" 
                                    ForeColor="#999999" MaxLength="8" BackColor="White"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12"></td>
                            <td class="style13"></td>
                            <td class="style13"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="style12">Color:</td>
                            <td class="style13">
                                <asp:TextBox ID="txtColor" runat="server" Width="100px" ForeColor="#999999" 
                                    MaxLength="15" BackColor="White"></asp:TextBox>
                            </td>
                            <td class="style13">Equipamiento:<br />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="btnEquip" runat="server" ImageUrl="images/equip.gif" 
                                    onclick="btnEquip_Click" />
                            </td>
                            <td></td>
                        </tr>
                    </table>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlVeh_2" Visible="false">
                    <table style="width:100%; height:100px;">
                        <tr>
                            <td>
                                <table style="width:100%; height:280px;">
                                    <tr>
                                        <td style="width:100%; height:60px">
                                        Equipamiento:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="equipamiento" style="width:100%; height:200px; overflow: auto;">
                                                <table style="border-style: none; border-width: 0px; width:100%; height:100%;">
                                                <asp:Repeater ID="rptEquipamiento" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# DataBinder.Eval(Container.DataItem, "Name") %>:</td>
                                                            <td>
                                                                <asp:Label ID="ident" runat="server" Visible="false"></asp:Label>
                                                                <asp:CheckBox ID="chkEquip" runat="server"/>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr style="background-color:#fafafa;">
                                                            <td><%# DataBinder.Eval(Container.DataItem, "Name") %>:</td>
                                                            <td>
                                                                <asp:Label ID="ident" runat="server" Visible="false"></asp:Label>
                                                                <asp:CheckBox ID="chkEquip" runat="server"/>
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
                        <tr>
                            <td>
                                <table style="width:100%; height:100px;">
                                    <tr>
                                        <td class="style12">&nbsp;</td>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td class="style13">Regresar<br />
                                        </td>
                                        <td>
                                            &nbsp;<asp:ImageButton ID="btnBack" runat="server" ImageUrl="images/key.gif" 
                                                onclick="btnBack_Click" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <table style="width:100%">
            <tr>
                <td class="style14"></td>
                <td>
                    <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:ImageButton ID="btnRefresh" runat="server" ImageUrl="images/refresh.gif" 
                        onclick="btnRefresh_Click" />
                    &nbsp;<asp:ImageButton ID="btnClean" runat="server" ImageUrl="images/clean.gif" 
                        onclick="btnClean_Click" />
                    &nbsp;<asp:ImageButton ID="btnTrash" runat="server" ImageUrl="images/trash.gif" 
                        onclick="btnTrash_Click" />
                    &nbsp;<asp:ImageButton ID="btnSave" runat="server" ImageUrl="images/save.gif" 
                        onclick="btnSave_Click" />
                    &nbsp;<asp:ImageButton ID="btnNew" runat="server" ImageUrl="images/add.gif" 
                        onclick="btnNew_Click" />
                </td>
                <td class="style15"></td>
            </tr>
        </table>

            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
