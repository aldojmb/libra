<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    string _UserApp;
    string _UserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["_UserApp1135416"] = "elprimero";
        Session["_EmpID99874987"] = "2";
        Session["_app_418498_connX_7858"] = "Data Source=mssql.genseguros.com.mx;Initial Catalog=genseguros_GENESIS_2punto0;Integrated Security=False;User ID=genseguros_genesis;Password=adventur3;Pooling=True;Min Pool Size=0;Max Pool Size=25;Application Name=webPage";
        
        validaSession();
        cargaDatos();
        cargaMenus();

        string _Content = Request.QueryString["contenido"];
        if (_Content != null)
        {
            cargaPagina(_Content.Replace('#', ' '), Request.QueryString["title"]);
        }
    }

    protected void validaSession()
    {
        try
        {
            _UserApp = Session["_UserApp1135416"].ToString();
            _UserID = Session["_EmpID99874987"].ToString();

            if (_UserApp == null || _UserID == null)
            {
                Response.Redirect("http://www.genseguros.com.mx");
            }
        }
        catch
        {
            Response.Redirect("http://www.genseguros.com.mx");
        }
    }

    protected void cargaDatos()
    {
        string sQuery = "exec sp_GEN_DatosMuestra 1, '" + _UserApp + "';";
        System.Data.DataTable Table = new System.Data.DataTable();
        Table = AsignToTable(sQuery);
        lblDatos.Text = Table.Rows[0][0].ToString();
    }

    protected void cargaMenus()
    {
        string sQuery = "exec sp_GEN_DatosMuestra 2, '" + _UserApp + "';";
        System.Data.DataTable Table = new System.Data.DataTable();
        Table = AsignToTable(sQuery);
        lblMenus.Text = Table.Rows[0][0].ToString();
    }

    protected void cargaPagina(string content, string title)
    {
        lblTitle.Text = title.ToUpper();
        if (validaAccesoMenu(content) == "1")
        {
            _contenido.Attributes["src"] = content + ".aspx";
        }

        else
        {
            _contenido.Attributes["src"] = "Template.aspx";
        }
    }

    protected string validaAccesoMenu(string content)
    {
        System.Data.DataTable dtMenu = new System.Data.DataTable();
        dtMenu = AsignToTable("exec sp_GEN_ValidaMenuUsuario " + _UserID + ", '" + content + "'");
        return dtMenu.Rows[0][0].ToString();
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

</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Libra | Una compañía en equilibrio</title>
    <link rel="stylesheet" type="text/css" href="style.css" media="screen" />
    <link rel="stylesheet" href="Styles/style_menu.css" type="text/css" />
    <link rel="stylesheet" href="styles/reveal.css" type="text/css" />	
    <script type="text/javascript" src="Scripts/js/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="Scripts/js/jquery.reveal.js"></script>
    <script type="text/javascript" src="Scripts/js/script_menu.js"></script>
    <script type="text/javascript" src="Scripts/js/Funciones.js"></script>
</head>

<body style="background:url(images/bg.jpg) no-repeat top center #97a5f0; margin:0px;
        padding:0px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color: #3b5564;" >
    <form id="frmIndex" runat="server"><br/>
        <div id="main_container">
            <div class="header">
                <table style="width:900px; height:100%;">
                    <tr>
                        <td style="width: 45px;"></td>
                        <td style="width: 200px;">
                             <img alt="" src="images/Logo.png" /> 
                        </td>
                        <td style="width: 60px;">&nbsp;</td>
                        <td style="width: 575px; text-align: center;">
                            <table style="width:100%; height:100%;">
                                <tr>
                                    <td style="text-align: right">
                                        <asp:Label ID="lblDatos" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMenus" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width:20px;"></td>
                    </tr>
                </table>
            </div>   
         
            <div class="pattern_bg">
            <table style="width:100%; height:100%;">
                <tr>
                    <td style="height:5px; width:20px;"></td>
                    <td style="height:5px;"></td>
                    <td style="height:5px; width:20px;"></td>
                </tr>
                <tr>
                    <td style="width:20px;"></td>
                    <td><asp:Label ID="lblTitle" runat="server" Font-Size="X-Large" ForeColor="White">Libra | Una compañía en equilibrio</asp:Label></td>
                    <td style="width:20px;"></td>
                </tr>
            </table>
            </div>
            
            <div id="main_content" style="overflow:hidden">
                <iframe runat="server" id="_contenido" style="width:880px; height:450px; border:0px;" src="Template.aspx" />
            </div>  
            
            <div id="footer">
 	            <div class="copyright">
                <!--<img src="images/mini.png" alt="" title="" />-->
                </div>
                <div class="center_footer">
                 <%-- <p>&copy; GENESIS su mejor patrimonio en riesgos | By Shield Systems 2012. All Rights Reserved Reserved</p>--%>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
