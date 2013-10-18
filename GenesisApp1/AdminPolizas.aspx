<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPolizas.aspx.cs" Inherits="GenesisApp1.AdmimPolizas" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    string _UserApp;
    string _UserID;
    System.Data.DataTable dtCancelar = new System.Data.DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        validaSession();
        cargaValidaciones();

        if (Request.QueryString["NumPoliza"] != null)
        {
            if (!IsPostBack)
            {
                string NumPoliza = Request.QueryString["NumPoliza"].ToString();
                dtCancelar = new System.Data.DataTable();
                dtCancelar = AsignToTable(obten_Query("RenuevaPoliza", NumPoliza, "", "", "", ""));
                pnlBuscador.Visible = false;

                if (dtCancelar.Rows.Count >= 1)
                {
                    lblError.Text = dtCancelar.Rows[0][1].ToString();
                    cargaRepeater(txtBuscar.Text.ToString());
                }
                
                else
                {
                    lblError.Text = "Poliza Cancelada";
                    cargaRepeater(txtBuscar.Text.ToString());
                }
            }
        }
        lblError.Text = "";
        pnlBuscador.Visible = true;
        cargaRepeater(txtBuscar.Text.ToString());
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
    }

    protected void limpiaCampos()
    {
        txtBuscar.Text = "";
    }

    #endregion

    protected void cargaRepeater(string parametro)
    {
        dtCancelar = new System.Data.DataTable();
        dtCancelar = AsignToTable(obten_Query("BuscaCancelarPoliza", parametro, "", "", "", ""));
        pnlBuscador.Visible = false;

        if (dtCancelar.Rows.Count >= 1)
        {
            pnlBuscador.Visible = true;
            rptGridPoliza.DataSource = dtCancelar;
            rptGridPoliza.DataBind();
        }

        else
        {
            if (lblError.Text == "")
            {
                lblError.Text = "No hay datos a mostrar";
            }
        }
    }
        
    protected void btnFind_Click(object sender, ImageClickEventArgs e)
    {
        lblError.Text = "";
        pnlBuscador.Visible = true;
        cargaRepeater(txtBuscar.Text.ToString());
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
            case "BuscaCancelarPoliza":
                return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=3;";

            case "RenuevaPoliza":
                return "exec sp_GEN_CancelaRenueva_Poliza @type=4, @iPolizaID='" + variable1 + "';";
                
            default:
                return "";
        }
    }

    public SqlDataSource cSqlDataSource(string Alimentador)
    {
        SqlDataSource sSqlDataSource = new SqlDataSource();
        sSqlDataSource.ProviderName = "System.Data.SqlClient";
        sSqlDataSource.SelectCommand = Alimentador;
        sSqlDataSource.ConnectionString = DesencriptaConnString();
        return sSqlDataSource;
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Página sin título</title>
    <script type="text/javascript" src="Scripts/js/Funciones.js"></script>
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
                            <asp:Panel ID="pnlBuscador" runat="server" Visible="false">
                            <table style="width:100%; height:30px;">
                                <tr>
                                    <td class="style70" 
                                        style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">No. Póliza</td>
                                    <td class="style70" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">Placas Vehículo</td>
                                    <td class="style70" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">Nom. Asegurado</td>
                                    <td class="style70" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">Fecha Registro</td>
                                    <td class="style70" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif');">Agente</td>
                                    <td class="style58" style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;">
                                        <asp:Image ID="imgEye" runat="server" ImageUrl="images/ni.png" />
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
                                                <td class="style58" style="background-color:#ffffff; text-align: center;"><a href="Renovar.aspx?NumPoliza=<%# DataBinder.Eval(Container.DataItem, "iPolizaID")%>" ><asp:Image ID="imgView_1" runat="server"  ImageUrl="images/no.gif" /></a></td>
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
                                                <td class="style58" style="background-color:#fafafa; text-align: center;"><a href="Renovar.aspx?NumPoliza=<%# DataBinder.Eval(Container.DataItem, "iPolizaID")%>" ><asp:Image ID="imgView_2" runat="server"  ImageUrl="images/no.gif" /></a></td>
                                                <td></td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                    </asp:Repeater>
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
                            &nbsp;</td>
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

