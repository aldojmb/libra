<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    string _UserApp;
    string _UserID;
    System.Data.DataTable dtPolizas = new System.Data.DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlBuscador.Visible = false;
            pnlSolicitud.Visible = false;
            
        }
        
        validaSession();
        cargaValidaciones();

        if (Request.QueryString["NumPoliza"] != null)
        {
            if (!IsPostBack)
            {
                string NumPoliza = Request.QueryString["NumPoliza"].ToString();
                cargaCombos();
                cargaPoliza(NumPoliza);
            }
        }

        btnSave.Visible = pnlSolicitud.Visible;
        btnPrint.Visible = pnlSolicitud.Visible;
    }

    #region Validaciones

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
    
    protected void cargaValidaciones()
    {
        txtBuscar.Attributes.Add("onkeypress", "Validkey('domicilio')");
        txtDescuento.Attributes.Add("onkeypress", "Validkey('cantidad')");
        txtExpedicion.Attributes.Add("onkeypress", "Validkey('cantidad')");
        txtPrimaNeta.Attributes.Add("onkeypress", "Validkey('cantidad')");
        txtIVA.Attributes.Add("onkeypress", "Validkey('cantidad')");
        txtTotal.Attributes.Add("onkeypress", "Validkey('cantidad')");
        txtObservaciones.Attributes.Add("onkeypress", "Validkey('textarea')");
    }

    protected void limpiaCampos()
    {
        txtBuscar.Text = "";
        lblIDFolio.Text = "";
        lblNoPoliza.Text = "";
        lblFechaIni.Text = "";
        lblFechaFin.Text = "";
        lblAsegurado1.Text = "";
        lblVehiculo.Text = "";
        txtDescuento.Text = "";
        txtExpedicion.Text = "";
        lblAsegurado2.Text = "";
        txtPrimaNeta.Text = "";
        txtIVA.Text = "";
        txtTotal.Text = "";
        txtObservaciones.Text = "";
        cargaCombos();
    }

    #endregion
    
    protected void cargaPoliza (string NumPoliza)
    {
        pnlBuscador.Visible = false;
        pnlSolicitud.Visible = true;
        dtPolizas = new System.Data.DataTable();
        dtPolizas = AsignToTable(obten_Query("CargaPoliza", NumPoliza, "", "", "", ""));

        string Alterno = dtPolizas.Rows[0][6].ToString();
                    
        lblIDFolio.Text = dtPolizas.Rows[0][0].ToString();
        lblNoPoliza.Text = dtPolizas.Rows[0][1].ToString();
        lblFechaIni.Text = dtPolizas.Rows[0][2].ToString();
        lblFechaFin.Text = dtPolizas.Rows[0][3].ToString();
        lblAsegurado1_Link.Text = "<a target='_blank' href='Asegurados.aspx?ID=" + dtPolizas.Rows[0][4].ToString() + "'><img alt='' src='images/ojo.png' border='0' /></a>";
        lblA1H.Text = dtPolizas.Rows[0][4].ToString();
        lblAsegurado1.Text = dtPolizas.Rows[0][5].ToString();
        lblVehiculo_Link.Text = "<a target='_blank' href='Vehiculos.aspx?ID=" + dtPolizas.Rows[0][8].ToString() + "'><img alt='' src='images/ojo.png' border='0' /></a>";
        lblV1H.Text = dtPolizas.Rows[0][8].ToString();
        lblVehiculo.Text = dtPolizas.Rows[0][9].ToString();
        lblAsegurado2.Text = "N/A";
        cmbAseguradora.SelectedValue = dtPolizas.Rows[0][12].ToString();

        if (Alterno != "-1")
        {
            lblAsegurado2_Link.Text = "<a target='_blank' href='Asegurados.aspx?ID=" + Alterno + "'><img alt='' src='images/ojo.png' border='0' /></a>";
            lblA2H.Text = Alterno;
            lblAsegurado2.Text = dtPolizas.Rows[0][7].ToString();
        }

        else
        {
            lblAsegurado2_Link.Text = "";
            lblA2H.Text = "";
            lblAsegurado2.Text = ""; 
        }
        
        string valueCob = dtPolizas.Rows[0][13].ToString();
        lblError.Text = "";
        templateCombo(cmbCobertura, "Coberturas", cmbAseguradora.SelectedValue.ToString());
        if (lblError.Text == "")
        {
            cmbCobertura.SelectedValue = valueCob;
            cargaBeneficios();
        }
    }

    protected void cargaCombos()
    {
        templateCombo(cmbFormaPago, "FormaPago", "");
        templateCombo(cmbAseguradora, "Aseguradoras", "");
    }
    
    protected void cmbAseguradora_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblError.Text = "";
        templateCombo(cmbCobertura, "Coberturas", cmbAseguradora.SelectedValue.ToString());
        if (lblError.Text == "")
        {
            cargaBeneficios();
        }
    }
    
    protected void cmbCobertura_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblError.Text = "";
        cargaBeneficios();
    }

    protected void cargaBeneficios()
    {
        int i = 0;
        dtPolizas = new System.Data.DataTable();
        dtPolizas = AsignToTable(obten_Query("catBeneficios", cmbCobertura.SelectedValue.ToString(), "", "", "", ""));

        if (dtPolizas.Rows[0][0].ToString() == "-1")
        {
            lblError.Text = dtPolizas.Rows[0][1].ToString();
            rptBeneficios.DataSource = null;
            rptBeneficios.DataBind();
        }

        else
        {
            rptBeneficios.DataSource = dtPolizas;
            rptBeneficios.DataBind();
            decimal dDescuento;
            decimal dPrima;
            
            foreach (RepeaterItem ri in rptBeneficios.Items)
            {
                TextBox Limite = (TextBox)ri.FindControl("txtLimite");
                TextBox Deducible = (TextBox)ri.FindControl("txtDeducible");
                TextBox Descuento = (TextBox)ri.FindControl("txtDescuento");
                TextBox Prima = (TextBox)ri.FindControl("txtPrima");
                Label ident = (Label)ri.FindControl("lblID");
                
                Limite.Attributes.Add("onkeypress", "Validkey('domicilio')");
                Deducible.Attributes.Add("onkeypress", "Validkey('numerico')");
                Descuento.Attributes.Add("onkeypress", "Validkey('cantidad')");
                Prima.Attributes.Add("onkeypress", "Validkey('cantidad')");
                
                Limite.Text = dtPolizas.Rows[i][2].ToString();
                Deducible.Text = dtPolizas.Rows[i][3].ToString() + '%';
                dDescuento = Convert.ToDecimal(dtPolizas.Rows[i][4]);
                dPrima = Convert.ToDecimal(dtPolizas.Rows[i][5]);
                Prima.Text = dtPolizas.Rows[i][5].ToString();
                ident.Text = dtPolizas.Rows[i][6].ToString();

                Descuento.Text = dDescuento.ToString("0.00");
                Prima.Text = dPrima.ToString("0.00");
                 
                i += 1;
            }
        }
        
    }
    
    protected void cargaRepeater(string parametro)
    {
        dtPolizas = new System.Data.DataTable();
        dtPolizas = AsignToTable(obten_Query("BuscaPoliza", parametro, "", "", "", ""));
        pnlBuscador.Visible = false;

        if (dtPolizas.Rows.Count >= 1)
        {
            pnlBuscador.Visible = true;
            rptGridPoliza.DataSource = dtPolizas;
            rptGridPoliza.DataBind();
        }

        else
        {
            lblError.Text = "No hay datos a mostrar";
        }
    }
        
    protected void btnFind_Click(object sender, ImageClickEventArgs e)
    {
        lblError.Text = "";
        pnlBuscador.Visible = true;
        pnlSolicitud.Visible = false;
        cargaRepeater(txtBuscar.Text.ToString());
    }

    protected void btnCalcTotal_Click(object sender, ImageClickEventArgs e)
    {
        calculaMontos();
    }

    protected void calculaMontos()
    {
        decimal PrimaNeta = 0;
        decimal Total = 0;

        foreach (RepeaterItem ri in rptBeneficios.Items)
        {
            int i = 0;
            CheckBox ident = (CheckBox)ri.FindControl("chkBeneficios");
            if (ident.Checked == true)
            {
                TextBox Descuento = (TextBox)ri.FindControl("txtDescuento");
                TextBox Prima = (TextBox)ri.FindControl("txtPrima");
                PrimaNeta += (Convert.ToDecimal(Prima.Text) - Convert.ToDecimal(Descuento.Text));

                i += 1;
            }
        }

        Total += PrimaNeta;

        if (txtDescuento.Text == "")
        {
            txtDescuento.Text = "0";
        }

        if (txtExpedicion.Text == "")
        {
            txtExpedicion.Text = "0";
        }

        Total -= Convert.ToDecimal(txtDescuento.Text);
        Total += Convert.ToDecimal(txtExpedicion.Text);

        txtPrimaNeta.Text = Total.ToString("0.00");
        txtIVA.Text = ((float)Total * .16).ToString("0.00");
        txtTotal.Text = ((float)Total * 1.16).ToString("0.00");
    }
 
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        calculaMontos();
        GuardaPolizaNueva(0);
    }

    protected void btnPrint_Click(object sender, ImageClickEventArgs e)
    {
        calculaMontos();
        GuardaPolizaNueva(1);
    }
    
    protected void GuardaPolizaNueva(int print)
    {
        string preQuery;
        decimal PrimaNeta = 0;
        
        foreach (RepeaterItem ri in rptBeneficios.Items)
        {
            int i = 0;
            CheckBox ident = (CheckBox)ri.FindControl("chkBeneficios");
            if (ident.Checked == true)
            {
                TextBox Descuento = (TextBox)ri.FindControl("txtDescuento");
                TextBox Prima = (TextBox)ri.FindControl("txtPrima");
                PrimaNeta += (Convert.ToDecimal(Prima.Text) - Convert.ToDecimal(Descuento.Text));
                i += 1;
            }
        }
        
       /* preQuery = "@iNumPoliza='" + lblNoPoliza.Text + "', " +
        "@iAseguradoID='" + lblA1H.Text + "', " +
        "@iAseguradoID_Alterno='" + lblA2H.Text + "', " +
        "@iVehiculoID='" + lblV1H.Text + "', " +
        "@iAseguradoraID='" + cmbAseguradora.SelectedValue.ToString() + "', " +
        "@iCoberturaID='" + cmbCobertura.SelectedValue.ToString() + "', " +
        "@dFechaVigenciaINI='" + lblFechaIni.Text.Substring(6,4) + lblFechaIni.Text.Substring(3, 2) + lblFechaIni.Text.Substring(0,2) + "', " +
        "@dFechaVigenciaFIN='" + lblFechaFin.Text.Substring(6, 4) + lblFechaFin.Text.Substring(3, 2) + lblFechaFin.Text.Substring(0, 2) + "', " +
        "@mSubTotal='" + txtPrimaNeta.Text + "', " +
        "@mIVA='" + txtIVA.Text + "', " +
        "@mTotal='" + txtTotal.Text + "', " +
        "@iFormaPagoID='" + cmbFormaPago.SelectedValue.ToString() + "', " +
        "@mGastosExpedicion='" + txtExpedicion.Text + "', " +
        "@cObservaciones='" + txtObservaciones.Text + "', " +
        "@mPrimaNeta='" + ((float)PrimaNeta).ToString("0.00") + "', " +
        //"@cPrimaLetra='" + txtObservaciones.Text + "', " +
        "@iEmpleadoID='" + _UserID + "', " +
        "@bStatus='1'";
        
        dtPolizas = new System.Data.DataTable();
        dtPolizas = AsignToTable(obten_Query("GuardaPoliza", preQuery, "", "", "", ""));
        lblError.Text = dtPolizas.Rows[0][1].ToString();

        if (dtPolizas.Rows[0][0].ToString() != "-1")
        {
            btnSave.Visible = false;
            if (print == 1)
            {*/
                //Response.Redirect("PrintPoliza.aspx?idPoliza=" + dtPolizas.Rows[0][0].ToString());
                Response.Redirect("PrintPoliza.aspx?idPoliza=16");
         /*   }
        }*/
    }

    protected void templateCombo(DropDownList cmbCatalogo, string sQuery, string variable)
    {
        dtPolizas = new System.Data.DataTable();
        cmbCatalogo.Items.Clear();
        dtPolizas = AsignToTable(obten_Query(sQuery, variable, "", "", "", ""));

        if (dtPolizas.Rows[0][0].ToString() != "-1")
        {
            cmbCatalogo.DataSource = dtPolizas;
            cmbCatalogo.DataValueField = "ID";
            cmbCatalogo.DataTextField = "Descripcion";
            cmbCatalogo.DataBind();
            if (sQuery == "Aseguradoras")
            {
                templateCombo(cmbCobertura, "Coberturas", cmbAseguradora.SelectedValue.ToString());
            }
        }

        else
        {
            lblError.Text = dtPolizas.Rows[0][1].ToString();
        }
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

    public string obten_Query(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
    {
        switch (Concepto)
        {
            case "BuscaPoliza":
                return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=0;";

            case "CargaPoliza":
                return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=1;";

            case "GuardaPoliza":
                return "exec sp_GEN_InsertaPoliza " + variable1 ;
            
            case "FormaPago":
                return "exec sp_GEN_Cat_FormaPago;";
            
            case "catBeneficios":
                return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=2;";

            case "Aseguradoras":
                return "exec sp_GEN_Aseguradoras";

            case "Coberturas":
                return "exec sp_GEN_Cat_Cobertura @iAseguradoraID = '" + variable1 + "'";
                
            default:
                return "";
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
    <script type="text/javascript" src="Scripts/js/Funciones.js"></script>
    <style type="text/css">
        .style52
        {
            width: 40px;
            height: 42px;
        }
        .style54
        {
            width: 130px;
            height: 28px;
        }
        .style55
        {
            width: 165px;
            height: 28px;
        }
        .style56
        {
            height: 28px;
        }
        .style57
        {
            width: 50px;
            height: 38px;
        }
        .style58
        {
            width: 30px;
            height: 30px;
        }
        .style59
        {
            width: 40px;
            height: 28px;
        }
        .style60
        {
            width: 300px;
            height: 28px;
        }
        .style61
        {
            width: 25px;
            height: 28px;
        }
        .style64
        {
            width: 145px;
            height: 30px;
        }
        .style70
        {
            width: 145px;
            height: 30px;
            text-align: center;
            font-weight: bold;
        }
        .style71
        {
            width: 100px;
        }
        .style74
        {
            width: 125px;
        }
        .style76
        {
            width: 15px;
        }
        .style77
        {
            width: 256px;
        }
        .style79
        {
            width: 156px;
        }
        .style80
        {
            width: 76px;
        }
        .style81
        {
            width: 25px;
        }
        .style90
        {
            width: 200px;
        }
        .style91
        {
            width: 130px;
        }
        .style94
        {
            width: 60px;
        }
        .style95
        {
            width: 90px;
        }
        </style>
</head>
<body style="background:url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080">
    <asp:Panel ID="pnlSol" runat="server">
    <table style="width:100%; height:100%;">
        <tr>
            <td>
                <table style="width:100%">
                    <tr>
                        <td class="style52">
                        </td>
                        <td style="text-align: right">
                            Buscar Póliza:&nbsp;<asp:TextBox ID="txtBuscar" runat="server" 
                                ForeColor="#999999" MaxLength="35" Width="150px"></asp:TextBox>
                            &nbsp;<asp:ImageButton ID="btnFind" runat="server" ImageUrl="images/find.gif" 
                                onclick="btnFind_Click" />
                        </td>
                        <td class="style57">
                        </td>
                    </tr>
                </table>
                <table style="width:100%; height:330px;">
                    <tr>
                        <td class="style58"></td>
                        <td>
                            <asp:Panel ID="pnlBuscador" runat="server">
                            <table style="width:100%; height:30px;">
                                <tr>
                                    <td class="style70" 
                                        style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">No. Póliza</td>
                                    <td class="style70" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">Placas Vehículo</td>
                                    <td class="style70" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">Nom. Asegurado</td>
                                    <td class="style70" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">Fecha Registro</td>
                                    <td class="style70" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">Agente</td>
                                    <td class="style58" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;">
                                        <asp:Image ID="imgEye" runat="server" ImageUrl="images/eye.png" />
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                            <div id="Bucar" style="width:795px; height:300px; overflow: auto;">
                                <table style="width:100%;">
                                    <asp:Repeater ID="rptGridPoliza" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="style64" style="background-color:#ffffff; text-align: center"><%# DataBinder.Eval(Container.DataItem, "iNumPoliza")%></td>
                                                <td class="style64" style="background-color:#ffffff; text-align: center"><%# DataBinder.Eval(Container.DataItem, "cNumPlacas")%></td>
                                                <td class="style64" style="background-color:#ffffff; text-align: left"><%# DataBinder.Eval(Container.DataItem, "Nombre")%></td>
                                                <td class="style64" style="background-color:#ffffff; text-align: center"><%# DataBinder.Eval(Container.DataItem, "dFechaEmision")%></td>
                                                <td class="style64" style="background-color:#ffffff; text-align: left"><%# DataBinder.Eval(Container.DataItem, "Agente")%></td>
                                                <td class="style58" style="background-color:#ffffff; text-align: center;"><a href="Emitir.aspx?NumPoliza=<%# DataBinder.Eval(Container.DataItem, "iPolizaID")%>" ><asp:Image ID="imgView_1" runat="server"  ImageUrl="images/ojo.png" /></a></td>
                                                <td></td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr>
                                                <td class="style64" style="background-color:#fafafa; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "iNumPoliza")%></td>
                                                <td class="style64" style="background-color:#fafafa; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "cNumPlacas")%></td>
                                                <td class="style64" style="background-color:#fafafa; text-align: left;"><%# DataBinder.Eval(Container.DataItem, "Nombre")%></td>
                                                <td class="style64" style="background-color:#fafafa; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "dFechaEmision")%></td>
                                                <td class="style64" style="background-color:#fafafa; text-align: left;"><%# DataBinder.Eval(Container.DataItem, "Agente")%></td>
                                                <td class="style58" style="background-color:#fafafa; text-align: center;"><a href="Emitir.aspx?NumPoliza=<%# DataBinder.Eval(Container.DataItem, "iPolizaID")%>" ><asp:Image ID="imgView_2" runat="server"  ImageUrl="images/ojo.png" /></a></td>
                                                <td></td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>                        
                            </asp:Panel>
                            <asp:Panel ID="pnlSolicitud" runat="server">
                                <div id="divPoliza" style="width:795px; height:300px; overflow: auto;">
                                    <table style="width:100%; height:300px;">
                                        <tr>
                                            <td>
                                                <table style="width:100%;">
                                                    <tr>
                                                        <td class="style76"></td>
                                                        <td>Vigencia Desde el
                                                            <asp:Label ID="lblFechaIni" runat="server" Font-Bold="True"></asp:Label>
                                                            &nbsp;hasta el
                                                            <asp:Label ID="lblFechaFin" runat="server" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td>Folio:
                                                            <asp:Label ID="lblIDFolio" runat="server" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td>No. Poliza:
                                                            <asp:Label ID="lblNoPoliza" runat="server" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width:100%;">
                                                    <tr>
                                                        <td class="style76"></td>
                                                        <td class="style77">Asegurado:
                                                            <asp:Label ID="lblAsegurado1" runat="server" Font-Bold="True"></asp:Label>
                                                            &nbsp;
                                                            <asp:Label ID="lblAsegurado1_Link" runat="server" Font-Bold="True"></asp:Label>
                                                            <asp:Label ID="lblA1H" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td class="style77">Asegurado Alterno:
                                                            <asp:Label ID="lblAsegurado2" runat="server" Font-Bold="True"></asp:Label>
                                                            &nbsp;
                                                            <asp:Label ID="lblAsegurado2_Link" runat="server" Font-Bold="True"></asp:Label>
                                                            <asp:Label ID="lblA2H" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td>Vehículo:
                                                            <asp:Label ID="lblVehiculo" runat="server" Font-Bold="True"></asp:Label>
                                                            &nbsp;
                                                            <asp:Label ID="lblVehiculo_Link" runat="server" Font-Bold="True"></asp:Label>
                                                            <asp:Label ID="lblV1H" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width:100%; ">
                                                    <tr>
                                                        <td class="style76"></td>
                                                        <td class="style71">Aseguradora:</td>
                                                        <td class="style79">
                                                            <asp:DropDownList ID="cmbAseguradora" runat="server" AutoPostBack="True" 
                                                                onselectedindexchanged="cmbAseguradora_SelectedIndexChanged" 
                                                                ForeColor="#999999" Width="120px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="style80">Cobertura:</td>
                                                        <td class="style74">
                                                            <asp:DropDownList ID="cmbCobertura" runat="server" ForeColor="#999999" 
                                                                onselectedindexchanged="cmbCobertura_SelectedIndexChanged"
                                                                Width="120px" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="style71">&nbsp;</td>
                                                        <td class="style74">
                                                            &nbsp;</td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width:100%;">
                                                    <tr>
                                                        <td>
                                                            <table style="width:100%; ">
                                                                <tr>
                                                                    <td class="style76"></td>
                                                                    <td>
                                                                        <asp:Label ID="lblTituloBeneficios" runat="server" Font-Bold="True">Beneficios:</asp:Label>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style76"></td>
                                                                    <td>
                                                                        <table style="width:100%; ">
                                                                            <tr>
                                                                                <td>
                                                                                    <table style="width:100%; ">
                                                                                        <tr>
                                                                                            <td align="center" bgcolor="#999999" style="color: #ffffff; font-weight: bold; width:100%; height:3px;"></td>
                                                                                            <td></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                
                                                                                    <table style="width:100%; ">
                                                                                        <tr>
                                                                                            <td class="style81"></td>
                                                                                            <td class="style94" align="center" bgcolor="#999999" style="color: #ffffff; font-weight: bold;">No.</td>
                                                                                            <td class="style90" align="center" bgcolor="#999999" style="color: #ffffff; font-weight: bold;">Beneficio</td>
                                                                                            <td class="style91" align="center" bgcolor="#999999" style="color: #ffffff; font-weight: bold;">Suma Asegurada</td>
                                                                                            <td class="style95" align="center" bgcolor="#999999" style="color: #ffffff; font-weight: bold;">Deducible %</td>
                                                                                            <td class="style95" align="center" bgcolor="#999999" style="color: #ffffff; font-weight: bold;">Descuento</td>
                                                                                            <td class="style95" align="center" bgcolor="#999999" style="color: #ffffff; font-weight: bold;">Prima Neta</td>
                                                                                            <td></td>
                                                                                        </tr>
                                                                                    </table>

                                                                                    <table style="width:100%; ">
                                                                                        <asp:Repeater ID="rptBeneficios" runat="server">
                                                                                            <ItemTemplate>
                                                                                                <tr>
                                                                                                    <td class="style81" style="background-color:#ffffff; text-align: center;"><asp:CheckBox ID="chkBeneficios" Checked="true" runat="server" /></td>
                                                                                                    <td class="style94" style="background-color:#ffffff; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "Row")%></td>
                                                                                                    <td class="style90" style="background-color:#ffffff; text-align: left;"><%# DataBinder.Eval(Container.DataItem, "Beneficio")%></td>
                                                                                                    <td class="style91" style="background-color:#ffffff; text-align: left;"><asp:TextBox runat="server" ID="txtLimite" BorderStyle="None" ForeColor="#999999" MaxLength="25" Width="110px" /></td>
                                                                                                    <td class="style95" style="background-color:#ffffff; text-align: left;"><asp:TextBox runat="server" ID="txtDeducible" BorderStyle="None" ForeColor="#999999" MaxLength="10" Width="80px"/></td>
                                                                                                    <td class="style95" style="background-color:#ffffff; text-align: left;">$<asp:TextBox runat="server" ID="txtDescuento" BorderStyle="None" ForeColor="#999999" MaxLength="10" Width="80px"/></td>
                                                                                                    <td class="style95" style="background-color:#ffffff; text-align: left;">$<asp:TextBox runat="server" ID="txtPrima" BorderStyle="None" ForeColor="#999999" MaxLength="10" Width="80px"/></td>
                                                                                                    <td><asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label></td>
                                                                                                    <td></td>
                                                                                                </tr>
                                                                                            </ItemTemplate>
                                                                                            <AlternatingItemTemplate>
                                                                                                <tr>
                                                                                                    <td class="style81" style="background-color:#fafafa; text-align: center;"><asp:CheckBox ID="chkBeneficios" Checked="true" runat="server" /></td>
                                                                                                    <td class="style94" style="background-color:#fafafa; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "Row")%></td>
                                                                                                    <td class="style90" style="background-color:#fafafa; text-align: left;"><%# DataBinder.Eval(Container.DataItem, "Beneficio")%></td>
                                                                                                    <td class="style91" style="background-color:#fafafa; text-align: left;"><asp:TextBox runat="server" ID="txtLimite" BorderStyle="None" ForeColor="#999999" MaxLength="25" Width="110px" BackColor="#fafafa"/></td>
                                                                                                    <td class="style95" style="background-color:#fafafa; text-align: left;"><asp:TextBox runat="server" ID="txtDeducible" BorderStyle="None" ForeColor="#999999" MaxLength="10" Width="80px" BackColor="#fafafa"/></td>
                                                                                                    <td class="style95" style="background-color:#fafafa; text-align: left;">$<asp:TextBox runat="server" ID="txtDescuento" BorderStyle="None" ForeColor="#999999" MaxLength="10" Width="80px" BackColor="#fafafa"/></td>
                                                                                                    <td class="style95" style="background-color:#fafafa; text-align: left;">$<asp:TextBox runat="server" ID="txtPrima" BorderStyle="None" ForeColor="#999999" MaxLength="10" Width="80px" BackColor="#fafafa"/></td>
                                                                                                    <td><asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label></td>
                                                                                                </tr>
                                                                                            </AlternatingItemTemplate>
                                                                                        </asp:Repeater>
                                                                                    </table>
                                                                                
                                                                                    <table style="width:100%; ">
                                                                                        <tr>
                                                                                            <td align="center" bgcolor="#999999" style="color: #ffffff; font-weight: bold; width:100%; height:3px;"></td>
                                                                                            <td></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width:100%; ">
                                                    <tr>
                                                        <td class="style76"></td>
                                                        <td class="style71">Descuento:</td>
                                                        <td class="style74">
                                                            $<asp:TextBox ID="txtDescuento" runat="server" ForeColor="#999999" 
                                                                MaxLength="10" BorderStyle="None" Width="115px"></asp:TextBox>
                                                        </td>
                                                        <td class="style74">Gastos Expedición:</td>
                                                        <td class="style74">
                                                            $<asp:TextBox ID="txtExpedicion" runat="server" ForeColor="#999999" 
                                                                MaxLength="10" BorderStyle="None" Width="115px"></asp:TextBox>
                                                        </td>
                                                        <td class="style71">Forma de Pago:</td>
                                                        <td class="style74">
                                                            <asp:DropDownList ID="cmbFormaPago" runat="server" ForeColor="#999999" 
                                                                Width="120px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width:100%; ">
                                                    <tr>
                                                        <td class="style76"></td>
                                                        <td class="style71">Total Neto:</td>
                                                        <td class="style74">
                                                            $<asp:TextBox ID="txtPrimaNeta" runat="server" ForeColor="#999999" MaxLength="10" 
                                                                BorderStyle="None" Width="115px" ></asp:TextBox>
                                                        </td>
                                                        <td class="style74">IVA:</td>
                                                        <td class="style74">
                                                            $<asp:TextBox ID="txtIVA" runat="server" ForeColor="#999999" 
                                                                MaxLength="10" BorderStyle="None" Width="115px"></asp:TextBox>
                                                        </td>
                                                        <td class="style71">Total:</td>
                                                        <td class="style74">
                                                            $<asp:TextBox ID="txtTotal" runat="server" ForeColor="#999999" MaxLength="10" 
                                                                BorderStyle="None" Width="115px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton ID="btnCalcTotal" runat="server" 
                                                                ImageUrl="~/images/calc.gif" onclick="btnCalcTotal_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width:100%; ">
                                                    <tr>
                                                        <td class="style76"></td>
                                                        <td>Observaciones:</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style76"></td>
                                                        <td>
                                                            <asp:TextBox ID="txtObservaciones" runat="server" ForeColor="#999999" 
                                                                Height="70px" MaxLength="10" TextMode="MultiLine" Width="700px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <table style="width:100%">
                    <tr>
                        <td class="style59">
                        </td>
                        <td class="style60">
                            <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                        </td>
                        <td class="style54">
                            </td>
                        <td class="style55">
                            </td>
                        <td style="text-align: right" class="style56">
                            &nbsp;<asp:ImageButton ID="btnSave" runat="server" ImageUrl="images/save.gif" 
                                onclick="btnSave_Click" />
                            &nbsp;
                            <asp:ImageButton ID="btnPrint" runat="server" ImageUrl="images/print.gif" 
                                onclick="btnPrint_Click" />
                            </td>
                        <td class="style61">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
