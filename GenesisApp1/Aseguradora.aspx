<%@ Page Language="C#" AutoEventWireup="True" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    string _UserApp;
    string _UserID;

    System.Data.DataTable dtAseguradoras = new System.Data.DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        validaSession();

        if (!IsPostBack)
        {
            cargaCombos();
            cargaInfo(cmbAseguradoras.SelectedValue);
        }

        cargaValidaciones();
    }

    #region Validaciones

    protected void cargaValidaciones()
    {
        txtRazonSocial.Attributes.Add("onkeypress", "Validkey('textarea')");
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
        txtRazonSocial.Text = "";
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
            txtRazonSocial.Text = dtAseguradoras.Rows[0][1].ToString();
            txtRFC.Text = dtAseguradoras.Rows[0][2].ToString();
            txtCalle.Text = dtAseguradoras.Rows[0][3].ToString();
            txtNE.Text = dtAseguradoras.Rows[0][4].ToString();
            txtNI.Text = dtAseguradoras.Rows[0][5].ToString();
            txtColonia.Text = dtAseguradoras.Rows[0][6].ToString();
            txtCP.Text = dtAseguradoras.Rows[0][7].ToString();
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

    protected void ActualizaInfo(string Aseguradora)
    {
        dtAseguradoras = new System.Data.DataTable();
        string preQuery;

        preQuery = "@iAseguradoraID = '" + Aseguradora + "', " +
            "@cRazonSocial = '" + txtRazonSocial.Text + "', " +
            "@cRFC_Aseguradora = '" + txtRFC.Text.ToUpper() + "', " +
            "@cCalle_Aseguradora = '" + txtCalle.Text + "', " +
            "@cNoExt_Aseguradora = '" + txtNE.Text + "', " +
            "@cNoInt_Aseguradora = '" + txtNI.Text + "', " +
            "@cColonia_Aseguradora = '" + txtColonia.Text + "', " +
            "@cCP_Aseguradora = '" + txtCP.Text + "', " +
            "@iEstadoID_Aseguradora = '" + cmbEstado.SelectedValue.ToString() + "', " +
            "@cDelMun_Aseguradora = '" + txtMpio.Text + "', " +
            "@cCiudad_Aseguradora = '" + txtCiudad.Text + "', " +
            "@cTelefono1_Aseguradora = '" + txtTel1.Text + "', " +
            "@cTelefono2_Aseguradora = '" + txtTel2.Text + "', " +
            "@cTelefono3_Aseguradora = '" + txtTel3.Text + "', " +
            "@cMail_Aseguradora = '" + txtMail.Text + "', " +
            "@cNombre_Representante = '" + txtNomRep.Text + "', " +
            "@cPaterno_Representante = '" + txtAPRep.Text + "', " +
            "@cMaterno_Representante = '" + txtAMRep.Text + "', " +
            "@bStatus_Aseguradora = '1', " +
            "@iEmpleadoID = '" + _UserID + "'";

        dtAseguradoras = AsignToTable("exec sp_GEN_ABC_Aseguradora " + preQuery);
        lblError.Text = "";

        if (dtAseguradoras.Rows[0][0].ToString() == "-1")
        {
            lblError.Text = "*Error: " + dtAseguradoras.Rows[0][1].ToString();
        }

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

</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
<body style="background:url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080">
    <asp:Panel ID="pnlMain" runat="server">
        <table style="width:100%">
            <tr>
                <td class="style2">Aseguradoras: </td>
                <td class="style8">
                    <asp:DropDownList ID="cmbAseguradoras" runat="server" Width="160px" 
                        AutoPostBack="True" 
                        onselectedindexchanged="cmbAseguradoras_SelectedIndexChanged" 
                        ForeColor="#999999" BackColor="White">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Datos"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style3">*Razon Social:</td>
                <td class="style5">
                    <asp:TextBox ID="txtRazonSocial" runat="server" Width="410px" 
                        ForeColor="#999999" MaxLength="45" BackColor="White"></asp:TextBox>
                </td>
                <td></td>
                <td class="style6">RFC:</td>
                <td class="style7">
                    <asp:TextBox ID="txtRFC" runat="server" Width="186px" MaxLength="15" 
                        ForeColor="#999999" BackColor="White"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td></td>
            </tr>
        </table>
        <br />
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Dirección"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style20">*Calle:</td>
                <td class="style26">
                    <asp:TextBox ID="txtCalle" runat="server" Width="195px" ForeColor="#999999" 
                        MaxLength="30" BackColor="White"></asp:TextBox>
                </td>
                <td class="style21">*No. Ext:</td>
                <td class="style13">
                    <asp:TextBox ID="txtNE" runat="server" Width="30px" ForeColor="#999999" 
                        MaxLength="10" BackColor="White"></asp:TextBox>
                </td>
                <td class="style20">No. Int:</td>
                <td class="style25">
                    <asp:TextBox ID="txtNI" runat="server" Width="30px" ForeColor="#999999" 
                        MaxLength="10" BackColor="White"></asp:TextBox>
                </td>
                <td class="style19">*Colonia:</td>
                <td class="style17">
                    <asp:TextBox ID="txtColonia" runat="server" Width="118px" ForeColor="#999999" 
                        MaxLength="15" BackColor="White"></asp:TextBox>
                </td>
                <td class="style18">*CP:</td>
                <td>
                    <asp:TextBox ID="txtCP" runat="server" Width="60px" MaxLength="5" 
                        ForeColor="#999999" BackColor="White"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td class="style1"></td>
                <td class="style20">*Estado:</td>
                <td class="style23">
                    <asp:DropDownList ID="cmbEstado" runat="server" Width="200px" 
                        ForeColor="#999999" BackColor="White">
                    </asp:DropDownList>
                </td>
                <td class="style20">Ciudad:</td>
                <td class="style24">
                    <asp:TextBox ID="txtCiudad" runat="server" Width="170px" ForeColor="#999999" 
                        MaxLength="25" BackColor="White"></asp:TextBox>
                </td>
                <td class="style10">Municipio/Delegación:</td>
                <td>
                    <asp:TextBox ID="txtMpio" runat="server" Width="124px" ForeColor="#999999" 
                        MaxLength="25" BackColor="White"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="Label3" runat="server" Font-Size="X-Large" 
                        Text="Datos del Representante"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td>*Nombre:</td>
                <td class="style29">
                    <asp:TextBox ID="txtNomRep" runat="server" Width="90px" ForeColor="#999999" 
                        MaxLength="35" BackColor="White"></asp:TextBox>
                </td>
                <td>A. Paterno:</td>
                <td>
                    <asp:TextBox ID="txtAPRep" runat="server" Width="90px" ForeColor="#999999" 
                        MaxLength="25" BackColor="White"></asp:TextBox>
                </td>
                <td>A. Materno:</td>
                <td>
                    <asp:TextBox ID="txtAMRep" runat="server" Width="90px" ForeColor="#999999" 
                        MaxLength="25" BackColor="White"></asp:TextBox>
                </td>
                <td></td>
                <td class="style28"></td>
            </tr>
            <tr>
                <td class="style1"></td>
                <td>*Teléfono 1:</td>
                <td class="style29">
                    <asp:TextBox ID="txtTel1" runat="server" Width="90px" ForeColor="#999999" 
                        MaxLength="20" BackColor="White"></asp:TextBox>
                </td>
                <td>Teléfono 2:</td>
                <td>
                    <asp:TextBox ID="txtTel2" runat="server" Width="90px" ForeColor="#999999" 
                        MaxLength="20" BackColor="White"></asp:TextBox>
                </td>
                <td>Teléfono 3:</td>
                <td>
                    <asp:TextBox ID="txtTel3" runat="server" Width="90px" ForeColor="#999999" 
                        MaxLength="20" BackColor="White"></asp:TextBox>
                </td>
                <td>Mail:</td>
                <td class="style28">
                    <asp:TextBox ID="txtMail" runat="server" Width="84px" ForeColor="#999999" 
                        MaxLength="30" BackColor="White"></asp:TextBox>
                </td>
                <td></td>
            </tr>
        </table>
        <br />
        <br />
        <table style="width:100%">
            <tr>
                <td class="style30">
                    <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                </td>
                <td class="style27" style="text-align: right">
                    <asp:ImageButton ID="btnRefresh" runat="server" ImageUrl="images/refresh.gif" onclick="btnRefresh_Click" 
                        />
                    &nbsp;<asp:ImageButton ID="btnClean" runat="server" ImageUrl="images/clean.gif" 
                        onclick="btnClean_Click" />
                    &nbsp;<asp:ImageButton ID="btnTrash" runat="server" 
                        ImageUrl="images/trash.gif" onclick="btnTrash_Click" />
                    &nbsp;<asp:ImageButton ID="btnSave" runat="server" 
                        ImageUrl="images/save.gif" onclick="btnSave_Click" />
                    &nbsp;<asp:ImageButton ID="btnNew" runat="server" 
                        ImageUrl="images/add.gif" onclick="btnNew_Click" />
                </td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
