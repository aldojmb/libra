<%@ Page Language="C#" AutoEventWireup="True" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    System.Data.DataTable dtAsegurados = new System.Data.DataTable();

    string _UserApp;
    string _UserID;

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

        dtAsegurados = AsignToTable("exec sp_GEN_DatosTercero '0'");
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

        dtAsegurados = new System.Data.DataTable();
        dtAsegurados = AsignToTable("exec sp_GEN_Cat_TipoTercero;");
        if (dtAsegurados.Rows[0][0].ToString() != "-1")
        {
            cmbTipoTercero.DataSource = dtAsegurados;
            cmbTipoTercero.DataValueField = "ID";
            cmbTipoTercero.DataTextField = "Descripcion";
            cmbTipoTercero.DataBind();
        }
    }

    protected void cargaInfo(string Asegurados)
    {
        dtAsegurados = new System.Data.DataTable();
        dtAsegurados = AsignToTable("exec sp_GEN_DatosTercero '" + Asegurados + "'");

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

            lblError.Text = "";
        }
    }

    protected void ActualizaInfo(string Asegurados)
    {
        dtAsegurados = new System.Data.DataTable();
        string preQuery;

        preQuery = " @iDatosTerceroID = '" + Asegurados + "', " +
            "@cNombre_DatosTercero = '" + txtNomRep.Text + "', " +
            "@cPaterno_DatosTercero = '" + txtAPRep.Text + "', " +
            "@cMaterno_DatosTercero = '" + txtAMRep.Text + "', " +
            "@cRFC_DatosTercero = '" + txtRFC.Text.ToUpper() + "', " +
            "@cCalle_DatosTercero = '" + txtCalle.Text + "', " +
            "@cNoExt_DatosTercero = '" + txtNE.Text + "', " +
            "@cNoInt_DatosTercero = '" + txtNI.Text + "', " +
            "@cColonia_DatosTercero = '" + txtColonia.Text + "', " +
            "@cCP_DatosTercero = '" + txtCP.Text + "', " +
            "@iEstadoID = '" + cmbEstado.SelectedValue.ToString() + "', " +
            "@cDelMun_DatosTercero = '" + txtMpio.Text + "', " +
            "@cCiudad_DatosTercero = '" + txtCiudad.Text + "', " +
            "@cTelefono1_DatosTercero = '" + txtTel1.Text + "', " +
            "@cTelefono2_DatosTercero = '" + txtTel2.Text + "', " +
            "@cTelefono3_DatosTercero = '" + txtTel3.Text + "', " +
            "@iEmpleadoID = '" + _UserID + "', " +
            "@iTipoTerceroID = '" + cmbTipoTercero.SelectedValue.ToString() + "'";
        
        dtAsegurados = AsignToTable("exec sp_GEN_InsertaPersonas " + preQuery);
        lblError.Text = "";

        if (dtAsegurados.Rows[0][0].ToString() == "-1")
        {
            lblError.Text = "*Error: " + dtAsegurados.Rows[0][1].ToString();
        }

        cmbAsegurados.Items.Clear(); ;
        dtAsegurados = new System.Data.DataTable();

        dtAsegurados = AsignToTable("exec sp_GEN_DatosTercero '0'");
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
        dtAsegurados = AsignToTable("exec sp_GEN_ABC_DatosTercero @iType=0, @iDatosTerceroID='" + Asegurados + "'");

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

    protected void cmbTipoTercero_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
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
<body >
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080;" >
    <table style="width:850px; height:400px; background:url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
        <tr>
            <td style="width:100%; height:100%; text-align:center;">
                <asp:Panel ID="pnlMain" runat="server">
                    <table style="width:100%">
                        <tr>
                            <td class="style2">
                                <br />
                                Personas: </td>
                            <td class="style8">
                                <br />
                                <asp:DropDownList ID="cmbAsegurados" runat="server" Width="160px" 
                                    AutoPostBack="True" 
                                    onselectedindexchanged="cmbAsegurados_SelectedIndexChanged" 
                                    ForeColor="#999999" BackColor="White">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                            <table style="width:100%">
                        <tr>
                            <td class="style1"></td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Font-Size="X-Large" 
                                    Text="Datos de la Persona"></asp:Label>
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
                            <td>RFC:</td>
                            <td class="style28">
                                <asp:TextBox ID="txtRFC" runat="server" BackColor="White" ForeColor="#999999" 
                                    MaxLength="15" Width="84px"></asp:TextBox>
                            </td>
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
                            <td>Tipo:</td>
                            <td class="style28">
                                <asp:DropDownList ID="cmbTipoTercero" runat="server" AutoPostBack="True" 
                                    BackColor="White" ForeColor="#999999" 
                                    onselectedindexchanged="cmbTipoTercero_SelectedIndexChanged" Width="86px">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                    <br />
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
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
