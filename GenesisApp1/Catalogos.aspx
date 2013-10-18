<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    public static string[] valores = new string[2];
    static string iMarcaID;

    string _UserApp; 
    string _UserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        validaSession();

        if (!IsPostBack)
        {
            lstCatalogos.SelectedIndex = 0;
            CargaSubCatalogos();
        }

        cargaValidaciones();
    }

    protected void cargaValidaciones()
    {
        txtValor.Attributes.Add("onkeypress", "Validkey('domicilio')");
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

    public void CargaCatalogos(object sender, EventArgs e)
    {
        lstAsignacion(lstCatalogos, "AdminCatalogos", "", "", "", "", "");
    }
    
    protected void lstDepCatalogos_OnSelectedIndexChanged(Object sender, EventArgs e)
    {
        lstSubCatalogos.Visible = true;
        lstAsignacion(lstSubCatalogos, "AdminDepSubCatalogos", lstDepCatalogos.SelectedValue, valores[0], "", "", "");
        txtValor.Text = "";
        lstSubCatalogos.SelectedIndex = -1;
    }

    protected void lstSubCatalogos_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        if (lstSubCatalogos.SelectedValue.ToString() == "-1")
        {
            txtValor.Text = "";
        }

        else
        {

            txtValor.Text = lstSubCatalogos.SelectedItem.Text;
        }
    }

    protected void lstAsignacion(ListBox Lista, String concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
    {
        Lista.Items.Clear();
        Lista.DataSource = cSqlDataSrc(obten_Query(concepto, variable1, variable2, variable3, variable4, variable5));
        Lista.DataValueField = obten_LstDataValueField(concepto, variable1, variable2, variable3, variable4, variable5);
        Lista.DataTextField = obten_LstDataTextField(concepto, variable1, variable2, variable3, variable4, variable5);
        Lista.DataBind();
    }

    public string obten_LstDataValueField(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
    {
        switch (Concepto)
        {
            case "AdminCatalogos":
                return "SP";

            case "AdminSubCatalogos":
                return "ID";

            case "AdminDepSubCatalogos":
                return "ID";

            default:
                return "";
        }
    }

    public string obten_LstDataTextField(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
    {
        switch (Concepto)
        {
            case "AdminCatalogos":
                return "Concepto";

            case "AdminSubCatalogos":
                return "descripcion";

            case "AdminDepSubCatalogos":
                return "descripcion";

            default:
                return "";
        }
    }
    
    protected void CargaSubCatalogos()
    {
        if (lstCatalogos.SelectedItem.Text == "Modelo" || lstCatalogos.SelectedItem.Text == "ApoyoVial")
        {
            int sDepCat = lstDepCatalogos.SelectedIndex;
                
            valores = lstCatalogos.SelectedValue.Split('.');
            lstSubCatalogos.Items.Clear();
            lstDepCatalogos.Visible = true;
            lstSubCatalogos.Visible = false;
            lstAsignacion(lstDepCatalogos, "AdminSubCatalogos", valores[1], valores[0], "", "", "");
            txtValor.Text = "";
            lstDepCatalogos.SelectedIndex = -1;

            lstDepCatalogos.SelectedIndex = sDepCat;
            lstSubCatalogos.Visible = true;
            lstAsignacion(lstSubCatalogos, "AdminDepSubCatalogos", lstDepCatalogos.SelectedValue, valores[0], "", "", "");
            txtValor.Text = "";
            lstSubCatalogos.SelectedIndex = -1;
        }
        else
        {
            valores = lstCatalogos.SelectedValue.Split('.');
            lstDepCatalogos.Items.Clear();
            lstDepCatalogos.Visible = false;
            lstSubCatalogos.Visible = true;
            lstAsignacion(lstSubCatalogos, "AdminSubCatalogos", valores[0], "", "", "", "");
            txtValor.Text = "";
            lstSubCatalogos.SelectedIndex = -1;
        }
    }
        
    protected void  lstCatalogos_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargaSubCatalogos();
    }

    protected void LimpiaData()
    {
        lblError.Text = "";
        txtValor.Text = "";
        CargaSubCatalogos();
    }
    
    protected void btnTrash_Click(object sender, ImageClickEventArgs e)
    {
        if (lstSubCatalogos.SelectedValue.ToString() == "")
        {
            lblError.Text = "Error, no se selecciono el valor a eliminar";
        }

        else
        {
            System.Data.DataTable dtCancelar = new System.Data.DataTable();
            dtCancelar = AsignToTable(obten_Query("EliminaCatalogos", lstSubCatalogos.SelectedValue.ToString(), txtValor.Text, lstCatalogos.SelectedValue.ToString(), "", ""));
            LimpiaData();
            lblError.Text = "Registro Eliminado Correctamente";
        }
    }

    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        if (lstSubCatalogos.SelectedValue.ToString() == "")
        {
            lblError.Text = "Error, no se selecciono el valor a actualizar";
        }

        else
        {
            System.Data.DataTable dtCancelar = new System.Data.DataTable();
            if ((lstCatalogos.SelectedValue.ToString() == "sp_GEN_Cat_ApoyoVial.sp_GEN_Cat_ApoyoDependencia") || (lstCatalogos.SelectedValue.ToString() == "sp_GEN_Cat_Modelo.sp_GEN_Cat_Marca"))
            {
                dtCancelar = AsignToTable(obten_Query("ActualizaCatalogos2", lstSubCatalogos.SelectedValue.ToString(), txtValor.Text, lstCatalogos.SelectedValue.ToString(), lstDepCatalogos.SelectedValue.ToString(), ""));
            }            
            dtCancelar = AsignToTable(obten_Query("ActualizaCatalogos", lstSubCatalogos.SelectedValue.ToString(), txtValor.Text, lstCatalogos.SelectedValue.ToString(), "", ""));
            LimpiaData();
            lblError.Text = "Registro Actualizado Correctamente";
        }
    }

    protected void btnNew_Click(object sender, ImageClickEventArgs e)
    {
        System.Data.DataTable dtCancelar = new System.Data.DataTable();
        if ((lstCatalogos.SelectedValue.ToString() == "sp_GEN_Cat_ApoyoVial.sp_GEN_Cat_ApoyoDependencia") || (lstCatalogos.SelectedValue.ToString() == "sp_GEN_Cat_Modelo.sp_GEN_Cat_Marca"))
        {
            dtCancelar = AsignToTable(obten_Query("InsertaCatalogos2", lstSubCatalogos.SelectedValue.ToString(), txtValor.Text, lstCatalogos.SelectedValue.ToString(), lstDepCatalogos.SelectedValue.ToString(), ""));
        }            
        dtCancelar = AsignToTable(obten_Query("InsertaCatalogos", lstSubCatalogos.SelectedValue.ToString(), txtValor.Text, lstCatalogos.SelectedValue.ToString(), "", ""));
        LimpiaData();
        lblError.Text = "Registro Ingresado Correctamente";
    }

    public string DesencriptaConnString()
    {
        string constrFinal = Session["_app_418498_connX_7858"].ToString();
        return constrFinal;
    }

    public SqlDataSource cSqlDataSrc(string Alimentador)
    {
        SqlDataSource sSqlDataSource = new SqlDataSource();
        sSqlDataSource.ProviderName = "System.Data.SqlClient";
        sSqlDataSource.SelectCommand = Alimentador;
        sSqlDataSource.ConnectionString = DesencriptaConnString();
        return sSqlDataSource;
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

    public string obten_Query(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
    {
        switch (Concepto)
        {
            case "AdminCatalogos":
                return "sp_GEN_AdministraCatalogos 1";

            case "AdminSubCatalogos":
                return "exec sp_GEN_AdministraCatalogos @iOpc=4, @cSP='" + variable1 + "'";

            case "AdminDepSubCatalogos":
                return "exec sp_GEN_AdministraCatalogos @iOpc=4, @cSP='" + variable2 + "', @iIDCatalogo='" + variable1 + "'";

            case "InsertaCatalogos":
                return "exec sp_GEN_AdministraCatalogos 2, '" + variable1 + "', '" + variable2 + "', '" + variable3 + "', '" + _UserID + "';";

            case "EliminaCatalogos":
                return "exec sp_GEN_AdministraCatalogos 3, '" + variable1 + "', '" + variable2 + "', '" + variable3 + "', '" + _UserID + "';";

            case "ActualizaCatalogos":
                return "exec sp_GEN_AdministraCatalogos 5, '" + variable1 + "', '" + variable2 + "', '" + variable3 + "', '" + _UserID + "';";

            case "InsertaCatalogos2":
                return "exec sp_GEN_AdministraCatalogos 2, '" + variable1 + "', '" + variable2 + "', '" + variable3 + "', '" + _UserID + "', '" + variable4 + "';";

            case "ActualizaCatalogos2":
                return "exec sp_GEN_AdministraCatalogos 5, '" + variable1 + "', '" + variable2 + "', '" + variable3 + "', '" + _UserID + "', '" + variable4 + "';";

            default:
                return "";
        }
    }
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>GENESIS | Su Mejor Patrimonio en Riesgos</title>
    <style type="text/css">
        .style3
        {
            width: 50px;
        }
        .style4
        {
            width: 60px;
        }
        .style5
        {
            width: 40px;
        }
        .style6
        {
            width: 30px;
        }
        .style10
        {
            width: 210px;
        }
        .style11
        {
            width: 64px;
        }
        .style12
        {
            width: 60px;
            height: 28px;
        }
        .style13
        {
            height: 28px;
        }
        .style14
        {
            width: 50px;
            height: 28px;
        }
        .style15
        {
            width: 210px;
            text-align: left;
        }
        .style17
        {
            width: 262px;
            text-align: left;
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
            
                <table ID="table1" runat="server">
                    <tr>
                        <td class="style12">
                        </td>
                        <td class="style13">
                        </td>
                        <td class="style14">
                        </td>
                        <td class="style13">
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                        </td>
                        <td>
                            <asp:ListBox runat="server" ID="lstCatalogos" width="200px" Height="320px" 
                                AutoPostBack="true" OnInit="CargaCatalogos" 
                                onselectedindexchanged="lstCatalogos_SelectedIndexChanged">
                            </asp:ListBox>
                            
                        </td>
                        <td class="style3">
                        </td>
                        <td>
                            <table ID="modifica" runat="server">
                                <tr>
                                    <td class="style10">
                                        <asp:ListBox ID="lstDepCatalogos" runat="server" width="200px" Height="245px" AutoPostBack="true"
                                        OnSelectedIndexChanged="lstDepCatalogos_OnSelectedIndexChanged">
                                        </asp:ListBox>
                                    </td>
                                    <td class="style5">
                                    </td>
                                    <td class="style10">
                                        <asp:ListBox ID="lstSubCatalogos" runat="server" width="200px" Height="245px" AutoPostBack="true" 
                                            OnSelectedIndexChanged="lstSubCatalogos_OnSelectedIndexChanged" >

                                        </asp:ListBox>
                                    </td>
                                    <td class="style6"></td>
                                </tr> 
                            </table>
                            <br />
                            <table style="width:100%;">
                                <tr>
                                    <td class="style17">
                                        &nbsp;</td>
                                    <td class="style15">
                                        <asp:Label ID="Label3" runat="server" Text="Label">Descripción:</asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                            <table style="width:100%;">
                                <tr>
                                    <td class="style17">
                                        &nbsp;</td>
                                    <td class="style15">
                                        <asp:TextBox ID="txtValor" runat="server" width="200px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <br />

                <br />

                <table style="width:100%">
                    <tr>
                        <td>
                            <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                        </td>
                        <td style="text-align: right">
                            &nbsp;<asp:ImageButton ID="btnTrash" runat="server" ImageUrl="images/trash.gif" onclick="btnTrash_Click" 
                                />
                            &nbsp;<asp:ImageButton ID="btnSave" runat="server" 
                                ImageUrl="images/save.gif" onclick="btnSave_Click" />
                            &nbsp;<asp:ImageButton ID="btnNew" runat="server" 
                                ImageUrl="images/add.gif" onclick="btnNew_Click" style="height: 30px" />
                        </td>
                        <td class="style11"></td>
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