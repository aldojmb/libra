<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    string _UserApp;
    string _UserID;
    string _Agente = "0";
    string _Adegurado2 = "0";

    System.Data.DataTable dtSolicitud = new System.Data.DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        validaSession();

        if (!IsPostBack)
        {
            cargaCombos();
        }

        cargaValidaciones();
    }

    #region Validaciones

    protected void cargaValidaciones()
    {
        txtNumPoliza.Attributes.Add("onkeypress", "Validkey('numerico')");
        datepicker.Attributes.Add("onkeypress", "Validkey('blocktext')");
        txtCosto.Attributes.Add("onkeypress", "Validkey('numerico')");
        txtDeducible.Attributes.Add("onkeypress", "Validkey('numerico')");
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
        chkAgente.Checked = false;
        cmbAgentes.Enabled = false;
        chkAsegurados2.Checked = false;
        cmbAsegurados2.Enabled = false;
        txtNumPoliza.Text = "";
        datepicker.Value = "";
        txtCosto.Text = "";
        txtDeducible.Text = "";
        cargaCombos();
    }

    #endregion

    #region Combos

    protected void cargaCombos()
    {
        templateCombo(cmbAgentes, "Usuarios", "");
        templateCombo(cmbAsegurados, "Asegurados", "");
        templateCombo(cmbAsegurados2, "Asegurados", "");
        templateCombo(cmbVehiculos, "Vehiculos", "");
        templateCombo(cmbAseguradora, "Aseguradoras", "");
    }

    protected void templateCombo(DropDownList cmbCatalogo, string sQuery, string variable)
    {
        dtSolicitud = new System.Data.DataTable();
        cmbCatalogo.Items.Clear();
        dtSolicitud = AsignToTable(obten_Query(sQuery, variable, "", "", "", ""));

        if (dtSolicitud.Rows[0][0].ToString() != "-1")
        {
            cmbCatalogo.DataSource = dtSolicitud;
            cmbCatalogo.DataValueField = "ID";
            cmbCatalogo.DataTextField = "Descripcion";
            cmbCatalogo.DataBind();
            if (sQuery == "Aseguradoras")
            {
                templateCombo(cmbCobertura, "Coberturas", cmbAseguradora.SelectedValue.ToString());
            }
        }
    }

    protected void cmbAseguradora_SelectedIndexChanged(object sender, EventArgs e)
    {
        templateCombo(cmbCobertura, "Coberturas", cmbAseguradora.SelectedValue.ToString());
    }
    
    protected void cmbAseguradoras_SelectedIndexChanged(object sender, EventArgs e)
    {
        templateCombo(cmbCobertura, "Coberturas", cmbAseguradora.SelectedValue.ToString());
    }

    #endregion

    #region Botones

    protected void btnClean_Click(object sender, ImageClickEventArgs e)
    {
        limpiaCampos();
    }

    protected void btnNew_Click(object sender, ImageClickEventArgs e)
    {
        dtSolicitud = new System.Data.DataTable();

        if (_Agente == "0")
        {
            _Agente = _UserID;
        }

        string preQuery = "@iNumPoliza = '" + txtNumPoliza.Text + "', " +
        "@iAseguradoID = '" + cmbAsegurados.SelectedValue.ToString() + "', " +
        "@iVehiculoID = '" + cmbVehiculos.SelectedValue.ToString() + "', " +
        "@iAseguradoraID = '" + cmbAseguradora.SelectedValue.ToString() + "', " +
        "@iCoberturaID = '" + cmbCobertura.SelectedValue.ToString() + "', " +
        "@dFechaVigenciaINI = '" + Convert.ToDateTime(datepicker.Value).ToString("yyyyMMdd").ToString() + "', " +
        "@dFechaVigenciaFIN = '" + cmbMeses.SelectedValue.ToString() + "', " +
        "@mTotal = '" + txtCosto.Text + "', " +
        "@mSolDeducible = '" + txtDeducible.Text + "', " +
        "@iEmpleadoID = '" + _Agente + "', " +
        "@bStatus = '2'";

        if (_Adegurado2 != "0")
        {
            preQuery += ", @iAseguradoID2 = '" + _Adegurado2 + "'";
        }

        dtSolicitud = AsignToTable(obten_Query("InsertaSolPoliza", preQuery, "", "", "", ""));
        lblError.Text = dtSolicitud.Rows[0][1].ToString();
    }

    protected void btnPrint_Click(object sender, ImageClickEventArgs e)
    {

    }

    #endregion

    #region Botones_2

    protected void imgAddA1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Asegurados.aspx");
    }

    protected void imgAddA2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Asegurados.aspx");
    }

    protected void imgAddV_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Vehiculos.aspx");
    }

    protected void btncalcCsto_Click(object sender, ImageClickEventArgs e)
    {
        dtSolicitud = new System.Data.DataTable();
        dtSolicitud = AsignToTable(obten_Query("CalculaCostoSol", cmbVehiculos.SelectedValue.ToString(), "", "", "", ""));
        txtCosto.Text = dtSolicitud.Rows[0][0].ToString();
    }

    protected void btncalcDedu_Click(object sender, ImageClickEventArgs e)
    {
        dtSolicitud = new System.Data.DataTable();
        dtSolicitud = AsignToTable(obten_Query("CalculaDeducibleSol", cmbVehiculos.SelectedValue.ToString(), "", "", "", ""));
        txtDeducible.Text = dtSolicitud.Rows[0][0].ToString();
    }

    protected void chkAsegurados2_CheckedChanged(object sender, EventArgs e)
    {
        if (chkAsegurados2.Checked == true)
        {
            _Adegurado2 = cmbAsegurados2.SelectedValue.ToString();
            cmbAsegurados2.Enabled = true;
        }

        else
        {
            _Adegurado2 = "0";
            cmbAsegurados2.Enabled = false;
        }
    }

    protected void chkAgente_CheckedChanged(object sender, EventArgs e)
    {
        if (chkAgente.Checked == true)
        {

            _Agente = cmbAgentes.SelectedValue.ToString();
            cmbAgentes.Enabled = true;
        }

        else
        {
            _Agente = "0";
            cmbAgentes.Enabled = true;
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
            case "Aseguradoras":
                return "exec sp_GEN_Aseguradoras";

            case "Vehiculos":
                if (variable1.Length <= 0)
                {
                    variable1 = "0";
                }
                return "exec sp_GEN_Vehiculo null, 2, " + variable1;

            case "Asegurados":
                return "exec sp_GEN_Asegurado '0'";

            case "Coberturas":
                return "exec sp_GEN_Cat_Cobertura";

            case "Usuarios":
                return "exec sp_GEN_Cat_Menu_Usuario";

            case "CalculaCostoSol":
                return "exec pr_GEN_getCalculo '" + variable1 + "', 'Costo'";

            case "CalculaDeducibleSol":
                return "exec pr_GEN_getCalculo '" + variable1 + "', 'Deducible'";

            case "InsertaSolPoliza":
                return "exec sp_GEN_InsertaPoliza " + variable1;
    
            default:
                return "";
        }
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
    <script type="text/javascript" src="Scripts/js/Funciones.js"></script>
    <script type="text/javascript" src="Scripts/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="Scripts/js/jquery.ui.core.js"></script>
	<script type="text/javascript" src="Scripts/js/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="Scripts/js/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="styles/jquery.ui.all.css" />
	<link type="text/css" href="styles/jquery-ui-1.8.21.custom.css" rel="stylesheet" />
	<link rel="stylesheet" href="styles/demos.css" />
	<script type="text/javascript">
        $(function() {
            $("#datepicker").datepicker();
        });
	</script>
    <style type="text/css">
        .style9
        {
            width: 25px;
        }
        .style25
        {
            width: 100px;
            height: 35px;
        }
        .style26
        {
            width: 215px;
            height: 35px;
        }
        .style27
        {
            height: 35px;
        }
        .style31
        {
            width: 40px;
            height: 30px;
        }
        .style32
        {
            width: 100px;
            height: 30px;
        }
        .style33
        {
            width: 200px;
            height: 30px;
        }
        .style34
        {
            width: 130px;
            height: 30px;
        }
        .style35
        {
            height: 30px;
        }
        .style39
        {
            width: 130px;
            height: 35px;
        }
        .style45
        {
            width: 200px;
            height: 35px;
        }
        .style46
        {
            width: 40px;
            height: 35px;
        }
        .style47
        {
            width: 40px;
        }
        .style48
        {
            width: 300px;
        }
        .style50
        {
            width: 130px;
        }
        .style51
        {
            width: 165px;
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
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="style46"></td>
                        <td class="style25">*Vigencia: </td>
                        <td class="style45">
                            <div >
                            <p style="width: 140px"> 
                                <input type="text" id="datepicker" runat="server" 
                                    style="width:115px; font-style: normal; color: #999999;" /></p>
                            </div>
                        </td>
                        <td class="style39">*Duración:</td>
                        <td class="style26">
                            <asp:DropDownList ID="cmbMeses" runat="server" ForeColor="#999999" 
                                Width="120px">
                                <asp:ListItem Value="12">12 meses</asp:ListItem>
                                <asp:ListItem Value="6">6 meses</asp:ListItem>
                                <asp:ListItem Value="1">1 pago</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style27"></td>
                    </tr>
                </table>
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="style46"></td>
                        <td class="style25">*Asegurado:</td>
                        <td class="style45">
                            <asp:DropDownList ID="cmbAsegurados" runat="server" ForeColor="#999999" 
                                Width="120px">
                            </asp:DropDownList>
                            &nbsp;<asp:ImageButton ID="imgAddA1" runat="server" 
                                ImageUrl="images/people.gif" onclick="imgAddA1_Click" Height="25px" Width="25px" />
                        </td>
                        <td class="style39">
                            <asp:CheckBox ID="chkAsegurados2" runat="server" AutoPostBack="True" 
                                Checked="false" oncheckedchanged="chkAsegurados2_CheckedChanged" 
                                Text="Asegurado (2):" />
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbAsegurados2" runat="server" ForeColor="#999999" 
                                Width="120px" Enabled="False">
                            </asp:DropDownList>
                            &nbsp;<asp:ImageButton ID="imgAddA2" runat="server" ImageUrl="images/people2.gif" 
                                onclick="imgAddA2_Click" Height="25px" Width="25px" />
                        </td>
                    </tr>
                </table>
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="style46">
                        </td>
                        <td class="style25">
                            *Vehículo:</td>
                        <td class="style45">
                            <asp:DropDownList ID="cmbVehiculos" runat="server" ForeColor="#999999" 
                                Width="120px">
                            </asp:DropDownList>
                            &nbsp;<asp:ImageButton ID="imgAddV" runat="server" 
                                ImageUrl="images/vehiculo.png" onclick="imgAddV_Click" Height="25px" Width="25px" />
                        </td>
                        <td class="style39">
                            <asp:CheckBox ID="chkAgente" runat="server" AutoPostBack="True" Checked="false" 
                                oncheckedchanged="chkAgente_CheckedChanged" Text="Agente:" />
                        </td>
                        <td class="style27">
                            <asp:DropDownList ID="cmbAgentes" runat="server" ForeColor="#999999" 
                                Width="120px" Enabled="False">
                            </asp:DropDownList>
                        </td>
                        <td class="style27">
                        </td>
                    </tr>
                </table>
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="style46"></td>
                        <td class="style25">*Aseguradora:</td>
                        <td class="style45">
                            <asp:DropDownList ID="cmbAseguradora" runat="server" ForeColor="#999999" 
                                Width="120px" AutoPostBack="True" 
                                onselectedindexchanged="cmbAseguradora_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="style39">*Cobertura:</td>
                        <td class="style27">
                            <asp:DropDownList ID="cmbCobertura" runat="server" ForeColor="#999999" 
                                Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td class="style27"></td>
                    </tr>
                </table>
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="style31"></td>
                        <td class="style32">Costo:</td>
                        <td class="style33">
                            <asp:TextBox ID="txtCosto" runat="server" ForeColor="#999999" Width="115px" 
                                MaxLength="5"></asp:TextBox>
                            &nbsp;<asp:ImageButton ID="btncalcCsto" runat="server" ImageUrl="images/calc.gif" 
                                onclick="btncalcCsto_Click" />
                        </td>
                        <td class="style34">Deducible:</td>
                        <td class="style35">
                            <asp:TextBox ID="txtDeducible" runat="server" ForeColor="#999999" Width="115px" 
                                MaxLength="5"></asp:TextBox>
                            &nbsp;<asp:ImageButton ID="btncalcDedu" runat="server" 
                                ImageUrl="images/calc.gif" onclick="btncalcDedu_Click" />
                        </td>
                        <td class="style35"></td>
                    </tr>
                </table>
                <br />
                <br />
                <table style="width:100%">
                    <tr>
                        <td class="style47">
                        </td>
                        <td class="style48">
                            <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                        </td>
                        <td class="style50">
                            No. Poliza:</td>
                        <td class="style51">
                            <asp:TextBox ID="txtNumPoliza" runat="server" ForeColor="#999999" 
                                MaxLength="10" Width="115px"></asp:TextBox>
                        </td>
                        <td style="text-align: right">
                            <asp:ImageButton ID="btnClean" runat="server" ImageUrl="images/clean.gif" 
                                onclick="btnClean_Click" />
                            &nbsp;<asp:ImageButton ID="btnNew" runat="server" ImageUrl="images/add.gif" 
                                onclick="btnNew_Click" />
                            &nbsp;<asp:ImageButton ID="btnPrint" runat="server" ImageUrl="images/print.gif" 
                                onclick="btnPrint_Click" />
                        </td>
                        <td class="style9">
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
