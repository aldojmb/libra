<%@ Page Language="C#" AutoEventWireup="True" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    string _UserApp;
    string _UserID;

    System.Data.DataTable dtAseguradoras = new System.Data.DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        validaSession();
        txtFechahoy.Text = "06/04/2013";
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

  

    #endregion

  

    

    

    #region Botones

    protected void btnClean_Click(object sender, ImageClickEventArgs e)
    {
        limpiaCampos();
    }

    protected void btnTrash_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        
    }

    protected void btnNew_Click(object sender, ImageClickEventArgs e)
    {
        
    }

    protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
    {
       
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
            height: 28px;
            text-align: right;
        }
        .style3
        {
            width: 90px;
        }
        .style5
        {
            width: 420px;
        }
        .style6
        {
            width: 45px;
        }
        .style7
        {
            width: 10px;
        }
        .style8
        {
            height: 28px;
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
<body style="background: url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080">
        <asp:Panel ID="pnlMain" runat="server">
      
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="PASE MÉDICO"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3" style="width: 60px" align="right">
                        Fecha:
                    </td>
                    <td class="style5" align="right">
                        <asp:TextBox ID="txtFechahoy" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White" Enabled="false"></asp:TextBox>
                    </td>
                    <td class="style1">
                    </td>
                    <td class="style3" style="width: 60px" align="right">
                        Siniestro:
                    </td>
                    <td class="style5" align="right">
                        <asp:TextBox ID="TextBox1" runat="server" Width="135px" ForeColor="#999999" MaxLength="5"
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
                        <asp:Label ID="Label90" runat="server" Font-Size="X-Large" Text="Datos del Asegurado"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3">
                        Asegurado:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox2" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td class="style6">
                        Teléfono:
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox3" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    <td class="style3">
                        Agente:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox4" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3">
                        Status de Póliza:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox26" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td class="style6">
                        Vigencia:
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox27" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    <td class="style3">
                        Placas:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox28" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Font-Size="X-Large" Text="Datos del Conductor"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3">
                        Nombre:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox29" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td class="style6">
                        Teléfono:
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox30" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style2" style="width: 150px">
                        Ubicación del siniestro:
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="TextBox5" runat="server" Width="400px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Font-Size="X-Large" Text="Hospital y/o clínica médica asignada"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style2" style="width: 150px">
                        Razón social:
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="TextBox31" runat="server" Width="400px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style2" style="width: 150px">
                        Responsable:
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="TextBox32" runat="server" Width="400px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3">
                        Ubicacíón:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox33" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td class="style6">
                        Colonia:
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox34" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3">
                        Entre las calles:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox35" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td class="style6">
                        C.P.:
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox36" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3">
                        Teléfono:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox37" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td class="style6">
                        Fax:
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox38" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Font-Size="X-Large" Text="Datos del lesionado(a)"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3">
                        Nombre:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox39" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td class="style6">
                        Teléfono:
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox40" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style2" style="width: 150px">
                        Dirección:
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="TextBox41" runat="server" Width="400px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style2" style="width: 150px">
                        Nombre del familiar responsable:
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="TextBox42" runat="server" Width="400px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td class="style3">
                        Parentesco y/o referencia:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox43" runat="server" Width="135px" ForeColor="#999999" MaxLength="45"
                            BackColor="White"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td class="style6">
                        Teléfono:
                    </td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox44" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"
                            BackColor="White"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">
                    </td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Font-Size="X-Large" Text="Diagnóstico"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style8">
                        <asp:TextBox ID="TextBox45" runat="server" Width="100%" ForeColor="#999999" MaxLength="45"
                            BackColor="White" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />
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
        </asp:Panel>
    </div>
    </form>
</body>
</html>
