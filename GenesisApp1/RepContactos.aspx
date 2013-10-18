<%@ Page Language="C#" AutoEventWireup="true" %>

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
            lblError.Text = "";
        }

        else
        {
            rptSimulador.DataSource = null;
            rptSimulador.DataBind();
            lblError.Text = "*No hay buzones pendientes.";
        }

        int i = 0;
        
        foreach (RepeaterItem ri in rptSimulador.Items)
        {
            Label labelo1 = (Label)ri.FindControl("lblID");
            labelo1.Text = dtSimulador.Rows[i][0].ToString();

            Label labelo2 = (Label)ri.FindControl("lblFecha");
            labelo2.Text = dtSimulador.Rows[i][1].ToString();

            Label labelo3 = (Label)ri.FindControl("lblName");
            labelo3.Text = dtSimulador.Rows[i][2].ToString();

            Label labelo4 = (Label)ri.FindControl("lblMail");
            labelo4.Text = dtSimulador.Rows[i][3].ToString();

            Label labelo5 = (Label)ri.FindControl("lblMsg");
            labelo5.Text = dtSimulador.Rows[i][4].ToString();

            CheckBox checo1 = (CheckBox)ri.FindControl("chkStatus");
            checo1.Checked = Convert.ToBoolean(dtSimulador.Rows[i][5]);

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
            foreach (RepeaterItem ri in rptSimulador.Items)
            {
                CheckBox checo1 = (CheckBox)ri.FindControl("chkStatus");
                CheckBox checo2 = (CheckBox)ri.FindControl("chkDelete");
                Label lblID = (Label)ri.FindControl("lblID");

                sSQL = "@bStatusMail=" + checo1.Checked.ToString() + ", @iMailID='" + lblID.Text + "'";
                dtSimulador = new System.Data.DataTable();
                dtSimulador = AsignToTable(obten_Query("GuardaDatos", sSQL, "", "", "", ""));


                if (checo2.Checked == true)
                {
                    sSQL = "@iMailID='" + lblID.Text + "'";
                    dtSimulador = new System.Data.DataTable();
                    dtSimulador = AsignToTable(obten_Query("EliminaDatos", sSQL, "", "", "", ""));
                }                

                i += 1;
            }

            lblError.Text = "";
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
                return "exec sp_GEN_WEB_Cotizador_Simulador_Mail 2;";

            case "GuardaDatos":
                return "Exec sp_GEN_WEB_Cotizador_Simulador_Mail @type=4, " + variable1 + ";";

            case "EliminaDatos":
                return "Exec sp_GEN_WEB_Cotizador_Simulador_Mail @type=3, " + variable1 + ";";

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
        .style14
        {
            text-align: center;
        }
        .style16
        {
            color: #FF0000;
            width: 20px;
        }
        .style17
        {
            text-align: center;
            width: 30px;
        }
        .style18
        {
            width: 150px;
        }
        .style19
        {
            width: 200px;
        }
        .style20
        {
            width: 100px;
        }
        .style21
        {
            width: 130px;
        }
        .style22
        {
            width: 42px;
        }
        .style23
        {
            width: 50px;
        }
        .style24
        {
            width: 91px;
        }
        .style25
        {
            width: 307px;
        }
    </style>
</head>
<body style="background:url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
    <form id="form1" runat="server">
    <div style="overflow:hidden">
        <table style="width:100%; height:100%;" >
            <tr>
                <td class="style22"></td>
                <td>
                    <table style="width:100%; height:100%;">
                        <tr>
                            <td class="style14">
                            <br />                            
                            <table style="width:100%; height:30px;">
                                <tr>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" class="style4">
                                        ID</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" 
                                        class="style20">
                                        Fecha</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" 
                                        class="style21">
                                        Nombre</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" 
                                        class="style18">
                                        Mail</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" 
                                        class="style19">
                                        Mensaje</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" 
                                        class="style24">
                                        ¿Fue Leído?</td>
                                    <td style="background-color: #ee2c24; color: #FFFFFF; background-image: url('images/pattern_bg.gif'); text-align: center;" 
                                        class="style24">
                                        ¿Eliminar?</td>
                                    <td></td>
                                </tr>
                            </table>
                            
                            <div id="Mails" 
                                    style="width:100%; height:300px; overflow: auto; text-align: left;">
                                <table style="width:100%; height:30px; text-align: left;">
                                    <asp:Repeater ID="rptSimulador" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="text-align: center;" class="style4"><asp:Label ID="lblID" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="text-align: center;" class="style20"><asp:Label ID="lblFecha" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="text-align: center;" class="style21"><asp:Label ID="lblName" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="text-align: center;" class="style18"><asp:Label ID="lblMail" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="text-align: center;" class="style19"><asp:Label ID="lblMsg" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="text-align: center;" class="style24"><asp:CheckBox ID="chkStatus" runat="server" /></td>
                                                <td style="text-align: center;" class="style24"><asp:CheckBox ID="chkDelete" runat="server" /></td>
                                                <td></td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr>
                                                <td style="background-color:#dbdbdb; text-align: center;" class="style4"><asp:Label ID="lblID" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="background-color:#dbdbdb; text-align: center;" class="style20"><asp:Label ID="lblFecha" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="background-color:#dbdbdb; text-align: center;" class="style21"><asp:Label ID="lblName" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="background-color:#dbdbdb; text-align: center;" class="style18"><asp:Label ID="lblMail" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="background-color:#dbdbdb; text-align: center;" class="style19"><asp:Label ID="lblMsg" runat="server" Text="" ForeColor="#999999"></asp:Label></td>
                                                <td style="background-color:#dbdbdb; text-align: center;" class="style24"><asp:CheckBox ID="chkStatus" runat="server" /></td>
                                                <td style="background-color:#dbdbdb; text-align: center;" class="style24"><asp:CheckBox ID="chkDelete" runat="server" /></td>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                            <br />
                            <table style="width:100%">
                                <tr>
                                    <td class="style17">&nbsp;</td>
                                    <td style="text-align: left">
                                        <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                                    </td>
                                    <td style="text-align: right" class="style25">
                                        <asp:ImageButton ID="btnSave" runat="server" ImageUrl="images/save.gif" 
                                            onclick="btnSave_Click" />
                                    </td>
                                </tr>
                            </table>
                                    </span>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="style23"></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
