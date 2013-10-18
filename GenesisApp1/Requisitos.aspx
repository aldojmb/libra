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
            cargaCombos();
        }

        cargaValidaciones();
    }

    #region Validaciones

    protected void cargaValidaciones()
    {
        txtNombre.Attributes.Add("onkeypress", "Validkey('nombres')");
        txtCP.Attributes.Add("onkeypress", "Validkey('numerico')");
        txtTel.Attributes.Add("onkeypress", "Validkey('numerico')");
        txtMail.Attributes.Add("onkeypress", "Validkey('email')");
        txtObservaciones.Attributes.Add("onkeypress", "Validkey('textarea')");
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
        txtNombre.Text = "";
        txtCP.Text = "";
        txtTel.Text = "";
        txtMail.Text = "";
        txtObservaciones.Text = "";
        lblError.Text = "";
        cargaCombos();
    }

    #endregion

    #region Combos

    protected void cargaCombos()
    {
        templateCombo(cmbVehiculos, "Vehiculos", "");
        templateCombo(cmbEstados, "Estados", "");
        templateCombo(cmbAseguradoras, "Aseguradoras", "");
    }

    protected void templateCombo(DropDownList cmbCatalogo, string sQuery, string variable)
    {
        dtRequerimientos = new System.Data.DataTable();
        cmbCatalogo.Items.Clear();
        dtRequerimientos = AsignToTable(obten_Query(sQuery, variable, "", "", "", ""));

        if (dtRequerimientos.Rows[0][0].ToString() != "-1")
        {
            cmbCatalogo.DataSource = dtRequerimientos;
            cmbCatalogo.DataValueField = "ID";
            cmbCatalogo.DataTextField = "Descripcion";
            cmbCatalogo.DataBind();

            if (sQuery == "Aseguradoras")
            {
                templateCombo(cmbCoberturas, "Coberturas", cmbAseguradoras.SelectedValue.ToString());
            }
        }
    }

    protected void cmbAseguradoras_SelectedIndexChanged(object sender, EventArgs e)
    {
        templateCombo(cmbCoberturas, "Coberturas", cmbAseguradoras.SelectedValue.ToString());
    }

    #endregion

    #region Botones

    protected void imgAdd_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Vehiculos.aspx");
    }

    protected void btnClean_Click(object sender, ImageClickEventArgs e)
    {
        limpiaCampos();
    }

    protected void btnNew_Click(object sender, ImageClickEventArgs e)
    {
        string preQuery;
        dtRequerimientos = new System.Data.DataTable();

        preQuery = "@cNombreReq = '" + txtNombre.Text + "', " +
        "@iVehiculoID = '" + cmbVehiculos.SelectedValue.ToString() + "', " +
        "@iAseguradoraID = '" + cmbAseguradoras.SelectedValue.ToString() + "', " +
        "@iCoberturaID = '" + cmbCoberturas.SelectedValue.ToString() + "', " +
        "@iEstadoID = '" + cmbEstados.SelectedValue.ToString() + "', " +
        "@telContacto = '" + txtTel.Text + "', " +
        "@emailContacto = '" + txtMail.Text + "', " +
        "@cCPReq = '" + txtCP.Text + "', " +
        "@cObservaciones_ReqBasicos = '" + txtObservaciones.Text + "', " +
        "@iEmpleadoID = '" + _UserID + "'";

        dtRequerimientos = AsignToTable(obten_Query("GuardaReq", preQuery, "", "", "", ""));
        lblError.Text = dtRequerimientos.Rows[0][1].ToString();
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

            case "Estados":
                return "exec sp_GEN_Cat_Estado;";

            case "Vehiculos":
                if (variable1.Length <= 0)
                {
                    variable1 = "0";
                }
                return "exec sp_GEN_Vehiculo null, 2, " + variable1;

            case "Coberturas":
                return "exec sp_GEN_Cat_Cobertura";
                
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
        .style1
        {
            width: 25px;
        }
        .style2
        {
            width: 90px;
        }
        .style6
        {
            width: 160px;
        }
        .style7
        {
            width: 75px;
        }
        .style12
        {
            width: 110px;
        }
        .style13
        {
            width: 130px;
        }
        .style14
        {
            width: 480px;
        }
        .style15
        {
            width: 70px;
        }
    </style>
</head>
<body style="background:url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080">
    <asp:Panel ID="pnlReq" runat="server">
        <table style="width:100%; height:100%;">
            <tr>
                <td>
                    <asp:Panel ID="pblRequerimientos" runat="server" Visible="true">
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td class="style1"></td>
                            <td class="style2">*Nombre:</td>
                            <td class="style6">
                                <asp:TextBox ID="txtNombre" runat="server" ForeColor="#999999" MaxLength="90" 
                                    Width="120px"></asp:TextBox>
                            </td>
                            <td class="style7">*Vehículo:</td>
                            <td class="style13">
                                <asp:DropDownList ID="cmbVehiculos" runat="server" ForeColor="#999999" 
                                    Width="125px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:ImageButton ID="imgAdd" runat="server" ImageUrl="images/vehiculo.png" 
                                    onclick="imgAdd_Click" Height="25px" Width="25px" />
                            </td>
                            <td></td>
                        </tr>
                    </table>
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td class="style1"></td>
                            <td class="style2">*Aseguradora:</td>
                            <td class="style6">
                                <asp:DropDownList ID="cmbAseguradoras" runat="server" ForeColor="#999999" 
                                    Width="125px" AutoPostBack="True" 
                                    onselectedindexchanged="cmbAseguradoras_SelectedIndexChanged" >
                                </asp:DropDownList>
                            </td>
                            <td class="style7">*Cobertura:</td>
                            <td class="style6">
                                <asp:DropDownList ID="cmbCoberturas" runat="server" ForeColor="#999999" 
                                    Width="125px">
                                </asp:DropDownList>
                            </td>
                            <td class="style12">*Estado (circula):</td>
                            <td>
                                <asp:DropDownList ID="cmbEstados" runat="server" ForeColor="#999999" 
                                    Width="125px">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td class="style1"></td>
                            <td class="style2">Teléfono:</td>
                            <td class="style6">
                                <asp:TextBox ID="txtTel" runat="server" ForeColor="#999999" MaxLength="19" 
                                    Width="120px"></asp:TextBox>
                            </td>
                            <td class="style7">Email:</td>
                            <td class="style6">
                                <asp:TextBox ID="txtMail" runat="server" ForeColor="#999999" MaxLength="35" 
                                    Width="120px"></asp:TextBox>
                            </td>
                            <td class="style12">*Código Postal:</td>
                            <td>
                                <asp:TextBox ID="txtCP" runat="server" ForeColor="#999999" MaxLength="5" 
                                    Width="120px"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td class="style1"></td>
                            <td>Observaciones:</td>
                        </tr>
                        <tr>
                            <td class="style1"></td>
                            <td>
                                <asp:TextBox ID="txtObservaciones" runat="server" ForeColor="#999999" 
                                    Height="140px" TextMode="MultiLine" Width="732px" MaxLength="999"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table style="width:100%">
                        <tr>
                            <td class="style30">
                                <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                            </td>
                            <td class="style14" style="text-align: right">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/clean.gif" 
                                    onclick="btnClean_Click" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
                                    ImageUrl="images/add.gif" onclick="btnNew_Click" />
                            </td>
                            <td class="style15"></td>
                        </tr>
                    </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
