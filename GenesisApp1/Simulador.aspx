﻿<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    string _UserApp;
    string _UserID;

    System.Data.DataTable dtRequerimientos = new System.Data.DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        validaSession();

        if (!IsPostBack)
        {
            cargaRepeater();
        }
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

    #endregion

    protected void cargaRepeater()
    {
        System.Data.DataTable dtSimulador = new System.Data.DataTable();
        dtSimulador = AsignToTable(obten_Query("CargaDatos", "", "", "", "", ""));

        if (dtSimulador.Rows.Count >= 1)
        {
            rptSimulador.DataSource = dtSimulador;
            rptSimulador.DataBind();
        }

        int i = 0;
        
        foreach (RepeaterItem ri in rptSimulador.Items)
        {
            Label labelo = (Label)ri.FindControl("lblID");
            labelo.Text = dtSimulador.Rows[i][0].ToString();

            TextBox Texto1 = (TextBox)ri.FindControl("txtDescripcion");
            Texto1.Attributes.Add("onkeypress", "Validkey('nombres')");
            Texto1.Text = dtSimulador.Rows[i][1].ToString();

            TextBox Texto2 = (TextBox)ri.FindControl("txtContado");
            Texto2.Attributes.Add("onkeypress", "Validkey('numerico')");
            Texto2.Text = dtSimulador.Rows[i][2].ToString();

            TextBox Texto3 = (TextBox)ri.FindControl("txtCredito");
            Texto3.Attributes.Add("onkeypress", "Validkey('numerico')");
            Texto3.Text = dtSimulador.Rows[i][3].ToString();

            TextBox Texto4 = (TextBox)ri.FindControl("txtDeducible");
            Texto4.Attributes.Add("onkeypress", "Validkey('numerico')");
            Texto4.Text = dtSimulador.Rows[i][4].ToString();

            TextBox Texto5 = (TextBox)ri.FindControl("txtPInicial");
            Texto5.Attributes.Add("onkeypress", "Validkey('numerico')");
            Texto5.Text = dtSimulador.Rows[i][5].ToString();

            TextBox Texto6 = (TextBox)ri.FindControl("txtNumPagos");
            Texto6.Attributes.Add("onkeypress", "Validkey('numerico')");
            Texto6.Text = dtSimulador.Rows[i][6].ToString();

            TextBox Texto7 = (TextBox)ri.FindControl("txtPSemanal");
            Texto7.Attributes.Add("onkeypress", "Validkey('numerico')");
            Texto7.Text = dtSimulador.Rows[i][7].ToString();

            CheckBox checo = (CheckBox)ri.FindControl("chkStatus");
            checo.Checked = Convert.ToBoolean(dtSimulador.Rows[i][8]);
            i += 1;
        }
    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string sSQL;
        System.Data.DataTable dtSimulador = new System.Data.DataTable();

        int i = 0;

        try
        {
            int checks = 0;

            foreach (RepeaterItem ri in rptSimulador.Items)
            {
                CheckBox checo = (CheckBox)ri.FindControl("chkStatus");
                if (checo.Checked == true)
                {
                    checks += 1;
                }
            }

            if (checks == 0)
            {
                lblError.Text = "Debe mantener por lo menos una opción activa.";
            }

            else
            {
                foreach (RepeaterItem ri in rptSimulador.Items)
                {
                    Label labelo = (Label)ri.FindControl("lblID");
                    TextBox Texto1 = (TextBox)ri.FindControl("txtDescripcion");
                    TextBox Texto2 = (TextBox)ri.FindControl("txtContado");
                    TextBox Texto3 = (TextBox)ri.FindControl("txtCredito");
                    TextBox Texto4 = (TextBox)ri.FindControl("txtDeducible");
                    TextBox Texto5 = (TextBox)ri.FindControl("txtPInicial");
                    TextBox Texto6 = (TextBox)ri.FindControl("txtNumPagos");
                    TextBox Texto7 = (TextBox)ri.FindControl("txtPSemanal");
                    CheckBox checo = (CheckBox)ri.FindControl("chkStatus");

                    sSQL = "@iCotizadorWebID = '" + labelo.Text + "', " +
                        "@dCotizadorWebDesc = '" + Texto1.Text + "', " +
                        "@iPrecioContado = '" + Texto2.Text + "', " +
                        "@iPrecioCredito = '" + Texto3.Text + "', " +
                        "@iDeducible = '" + Texto4.Text + "', " +
                        "@iPagoInicial = '" + Texto5.Text + "', " +
                        "@iNumPagos = '" + Texto6.Text + "', " +
                        "@iPagoSemanal = '" + Texto7.Text + "', " +
                        "@bCotizadorWeb_Status = '" + checo.Checked.ToString() + "'";

                    dtSimulador = new System.Data.DataTable();
                    dtSimulador = AsignToTable(obten_Query("GuardaDatos", sSQL, "", "", "", ""));

                    i += 1;
                }

                lblError.Text = "";
            }
        }
        catch
        {
            lblError.Text = "No se guardo la información, intente de nuevo o verifiquelo con el área de sistemas.";
        }

        cargaRepeater();
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
            case "CargaDatos":
                return "exec sp_GEN_WEB_Cotizador_Simulador_Admin;";

            case "GuardaDatos":
                return "Exec sp_GEN_WEB_Cotizador_Simulador_Admin @type = 0, " + variable1 + ";";

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
<head runat="server">
    <title>Simulador Web</title>
    <script type="text/javascript" src="Scripts/js/Funciones.js"></script>
    <style type="text/css">
        .style4
        {
            width: 25px;
        }
        .style5
        {
            width: 120px;
        }
        .style6
        {
            width: 65px;
        }
        .style7
        {
            width: 70px;
        }
        .style8
        {
            width: 80px;
        }
        .style9
        {
            width: 85px;
        }
        .style10
        {
            width: 49px;
        }
        .style12
        {
            width: 95px;
        }
        .style13
        {
            width: 97px;
        }
        .style14
        {
            text-align: center;
        }
        .style15
        {
            color: #FF0000;
        }
        .style16
        {
            color: #FF0000;
            width: 54px;
        }
        .style17
        {
            text-align: center;
            width: 30px;
        }
    </style>
</head>
<body style="background:url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
    <form id="form1" runat="server">
    <div style="overflow:hidden">
        <table style="width:100%; height:100%;" >
            <tr>
                <td class="style8"></td>
                <td>
                    <table style="width:100%; height:100%;">
                        <tr>
                            <td class="style14">
                            
                                <div class="style14" style="overflow:hidden">
                                    <span class="style15">
                                    <br />
                                    Los siguientes valores son los que apareceran en el simulador de la página web. 
                                    <br /><br />
                                </div>
                            
                            <table style="width:100%; height:30px;">
                                <tr>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style4">
                                        ID</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style5">
                                        Tipo Vehículo</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style6">
                                        Contado</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style6">
                                        Crédito</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style7">
                                        Deducible</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style8">
                                        Pago Inicial</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style9">
                                        Num. Pagos</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" 
                                        class="style12">
                                        Pago Semanal</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style10">
                                        Estatus</td>
                                    <td></td>
                                </tr>
                            </table>
                            
                            <table style="width:100%; height:30px;">
                            
                            
                            
                            
                                <asp:Repeater ID="rptSimulador" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="text-align: center;" class="style4">
                                                <asp:Label ID="lblID" runat="server" ForeColor="#999999" Text="ID"></asp:Label>
                                            </td>
                                            <td style="text-align: center;" class="style5">
                                                <asp:TextBox ID="txtDescripcion" runat="server" BorderStyle="None" MaxLength="50"
                                                    ForeColor="#999999" Width="110px"></asp:TextBox>
                                            </td>
                                            <td style="text-align: center;" class="style6">
                                                <asp:TextBox ID="txtContado" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="60px"></asp:TextBox>
                                            </td>
                                            <td style="text-align: center;" class="style6">
                                                <asp:TextBox ID="txtCredito" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="60px"></asp:TextBox>
                                            </td>
                                            <td style="text-align: center;" class="style7">
                                                <asp:TextBox ID="txtDeducible" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="65px"></asp:TextBox>
                                            </td>
                                            <td style="text-align: center;" class="style8">
                                                <asp:TextBox ID="txtPInicial" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="75px"></asp:TextBox>
                                            </td>
                                            <td style="text-align: center;" class="style9">
                                                <asp:TextBox ID="txtNumPagos" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="80px"></asp:TextBox>
                                            </td>
                                            <td style="text-align: center;" class="style13">
                                                <asp:TextBox ID="txtPSemanal" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="90px"></asp:TextBox>
                                            </td>
                                            <td style="text-align: center;" class="style10">
                                                <asp:CheckBox ID="chkStatus" runat="server" />
                                            </td>
                                            <td></td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style4">
                                                <asp:Label ID="lblID" runat="server" ForeColor="#999999" Text="ID"></asp:Label>
                                            </td>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style5">
                                                <asp:TextBox ID="txtDescripcion" runat="server" BorderStyle="None" MaxLength="50"
                                                    ForeColor="#999999" Width="110px" BackColor="#dbdbdb"></asp:TextBox>
                                            </td>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style6">
                                                <asp:TextBox ID="txtContado" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="60px" BackColor="#dbdbdb"></asp:TextBox>
                                            </td>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style6">
                                                <asp:TextBox ID="txtCredito" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="60px" BackColor="#dbdbdb"></asp:TextBox>
                                            </td>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style7">
                                                <asp:TextBox ID="txtDeducible" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="65px" BackColor="#dbdbdb"></asp:TextBox>
                                            </td>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style8">
                                                <asp:TextBox ID="txtPInicial" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="75px" BackColor="#dbdbdb"></asp:TextBox>
                                            </td>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style9">
                                                <asp:TextBox ID="txtNumPagos" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="80px" BackColor="#dbdbdb"></asp:TextBox>
                                            </td>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style13">
                                                <asp:TextBox ID="txtPSemanal" runat="server" BorderStyle="None" MaxLength="8"
                                                    ForeColor="#999999" Width="90px" BackColor="#dbdbdb"></asp:TextBox>
                                            </td>
                                            <td style="background-color:#dbdbdb; text-align: center;" class="style10">
                                                <asp:CheckBox ID="chkStatus" runat="server" />
                                            </td>
                                            <td></td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                            </table>
                            <table style="width:100%">
                                <tr>
                                    <td class="style17">&nbsp;</td>
                                    <td style="text-align: left">
                                        <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="images/save.gif" 
                                            onclick="btnSave_Click" />
                                    </td>
                                    <td class="style16"></td>
                                </tr>
                            </table>
                                    </span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
