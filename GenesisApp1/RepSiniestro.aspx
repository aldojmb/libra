<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepSiniestro.aspx.cs" Inherits="GenesisApp1.RepSiniestro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
        .tableSiniestro
        {
            margin-left: 100px;
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body style="background:url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:Panel ID="pnlMain" runat="server">
      <!--  <table style="width:100%">
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
        </table>-->
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Datos"></asp:Label>
                </td>
            </tr>
        </table>
             <table style="width:600px" class="tableSiniestro" border="1">
            <tr>
                <td class="style1"></td>
                <td class="style3">*Fotos:</td>
                <td class="style5">
                    <asp:CheckBox ID="chkFotos" runat="server" />
                </td>
                <td></td>
                <td class="style6">No. Declaración:</td>
                <td class="style7">
                    <asp:TextBox ID="txtDeclaracion" runat="server" Width="186px" MaxLength="15"></asp:TextBox>
                </td>
                <td>
                    <td class="style3">*Folio:</td>
                <td class="style5">
         <asp:Label ID="Label10" runat="server" Font-Size="X-Large" Text="----"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width:600px" class="tableSiniestro" border="1">
            <tr>
                <td class="style1"></td>
                <td class="style3">*Fecha:</td>
                <td class="style5">
                         <div >
                            <p style="width: 140px"> 
                                <input type="text" id="datepicker" runat="server" 
                                    style="width:115px; font-style: normal; color: #999999;" /></p>
                            </div>
                </td>
                <td></td>
                <td class="style6">Hora:</td>
                <td class="style7">
                    <asp:TextBox ID="txtHora" runat="server" Width="186px" MaxLength="15"></asp:TextBox>
                </td>
                <td>
                    <td class="style3">*Póliza:</td>
                <td class="style5">
                    <asp:TextBox ID="txtPoliza" runat="server" Width="135px" 
                         MaxLength="45" ></asp:TextBox><asp:ImageButton ID="btnFind" runat="server" ImageUrl="images/find.gif" 
                                onclick="btnFind_Click" />
                </td>
            </tr>
        </table>
           <table style="width:600px" class="tableSiniestro" border="1">
            <tr>
                <td class="style1"></td>
                <td class="style3">*Teléfono:</td>
                <td class="style5">
                    <asp:TextBox ID="txtTelefono" runat="server" Width="135px" 
                        MaxLength="45"></asp:TextBox>
                </td>
                <td></td>
                <td class="style6">Ruta:</td>
                <td class="style7">
                    <asp:TextBox ID="txtRuta" runat="server" Width="186px" MaxLength="15" 
                        ></asp:TextBox>
                </td>
                <td>
                    <td class="style3">*Placas:</td>
                <td class="style5">
                    <asp:TextBox ID="txtPlacas" runat="server" Width="135px" 
                        MaxLength="45"></asp:TextBox>
                </td>
            </tr>
        </table>
         <table style="width:600px" class="tableSiniestro" border="1">
            <tr>
                <td class="style2" style="width:150px">Nombre del conductor: </td>
                <td class="style8">
                     <asp:TextBox ID="txtNombreConductor" runat="server" Width="400px" 
                        MaxLength="45" ></asp:TextBox>
                </td>
                     </td>
                                        <td class="style20">
                                        Edad:
                                    </td>
                                    <td class="style8">
                                        <asp:TextBox ID="txtEdad" runat="server" Width="40px" MaxLength="45" Rows="5"></asp:TextBox>
                                    </td>
            </tr>
        </table>
                <table style="width:600px" class="tableSiniestro" border="1">
            <tr>
                <td class="style2" style="width:150px">Nombre del asegurado: </td>
                <td class="style8">
                     <asp:TextBox ID="txtNombreAsegurado" runat="server" Width="400px" 
                        MaxLength="45"></asp:TextBox>
                </td>
            </tr>
        </table>
         <table style="width:100%">
            <tr>
                <td class="style2" style="width:150px">Vehículo: </td>
                <td class="style8">
                     <asp:TextBox ID="txtVehiculo" runat="server" Width="100px" 
                        MaxLength="45" ></asp:TextBox>
                </td>
            </tr>
        </table>

        <br />
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Ubicación del siniestro"></asp:Label>
                </td>
            </tr>
        </table>
                 <table style="width:100%">
            <tr>
                <td class="style2" style="width:150px">Sobre Esq: </td>
                <td class="style8">
                     <asp:TextBox ID="txtEsquina" runat="server" Width="400px" 
                        MaxLength="45" ></asp:TextBox>
                </td>
            </tr>
        </table>
         <table style="width:100%">
            <tr>
                <td class="style2" style="width:150px">Col Delg: </td>
                <td class="style8">
                     <asp:TextBox ID="txtColDel" runat="server" Width="100px" 
                       MaxLength="45"></asp:TextBox>
                </td>
            </tr>
        </table>
                    <table style="width:100%">
            <tr>
                <td class="style2" style="width:150px">Rumbo: </td>
                <td class="style8">
                     <asp:TextBox ID="txtRumbo" runat="server" Width="400px" 
                        MaxLength="45" ></asp:TextBox>
                </td>
            </tr>
        </table>
         <table style="width:100%">
            <tr>
                <td class="style2" style="width:150px">Ref: </td>
                <td class="style8">
                     <asp:TextBox ID="txtRef" runat="server" Width="100px" 
                         MaxLength="45" ></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
             <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Font-Size="X-Large" Text="Relato de los hechos"></asp:Label>
                </td>
            </tr>
        </table>
              <table style="width:100%">
            <tr>
                <td class="style8">
                
                     <asp:TextBox ID="txtRelato" runat="server" Width="100%" 
                        MaxLength="45" Rows="5" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
         <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style3">Estado de la póliza:</td>
                <td class="style5">
                    <asp:TextBox ID="txtPolizastatus" runat="server" Width="135px" 
                        MaxLength="45" ></asp:TextBox>
                </td>
                <td></td>
                <td class="style6">Vigencia:</td>
                <td class="style7">
                    <asp:TextBox ID="txtPolizaVigencia" runat="server" Width="186px" MaxLength="15" 
                       ></asp:TextBox>
                </td>
            </tr>
        </table>
         <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style3">Agente vendedor:</td>
                <td class="style5">
                    <asp:TextBox ID="txtPolizaVendedor" runat="server" Width="135px" 
                       MaxLength="45" ></asp:TextBox>
                </td>
                              <td class="style1"></td>
                <td class="style3">Último pago:</td>
                <td class="style5">
                    <asp:TextBox ID="txtPolizaFechaUltimoPago" runat="server" Width="135px" 
                       MaxLength="45" ></asp:TextBox>
                </td>
            </tr>
        </table>
                 <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style3">Asesoría:</td>
                <td class="style5">
                    <asp:TextBox ID="txtAsesoria" runat="server" Width="135px" 
                        MaxLength="45"></asp:TextBox>
                </td>

            </tr>
        </table>
        <br />
        <table style="width:100%">
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Datos del tercero"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style3">Tipo:</td>
                <td class="style5">
                    <asp:TextBox ID="txtTerceroTipo" runat="server" Width="135px" 
                        MaxLength="45" ></asp:TextBox>
                </td>
                <td></td>
                <td class="style6">Uso:</td>
                <td class="style7">
                    <asp:TextBox ID="txtTerceroUso" runat="server" Width="186px" MaxLength="15" 
                        ></asp:TextBox>
                </td>
                <td>
                    <td class="style3">Color:</td>
                <td class="style5">
                    <asp:TextBox ID="txtTerceroColor" runat="server" Width="135px" 
                       MaxLength="45" ></asp:TextBox>
                </td>
            </tr>
        </table>
           <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style3">Modelo:</td>
                <td class="style5">
                    <asp:TextBox ID="txtTerceroModelo" runat="server" Width="135px" 
                       MaxLength="45" ></asp:TextBox>
                </td>
                <td></td>
                <td class="style6">Placas:</td>
                <td class="style7">
                    <asp:TextBox ID="txtTerceroPlacas" runat="server" Width="186px" MaxLength="15" 
                      ></asp:TextBox>
                </td>
                <td>
                    <td class="style3">Lesionados:</td>
                <td class="style5">
                    <asp:TextBox ID="txtTerceroLesionados" runat="server" Width="135px" 
                        MaxLength="45" ></asp:TextBox>
                </td>
            </tr>
        </table>
                   <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style3">Seg 3o:</td>
                <td class="style5">
                    <asp:TextBox ID="txtTerceroSeguro" runat="server" Width="135px" 
                       MaxLength="45" ></asp:TextBox>
                </td>
                <td> 
                    <asp:Button ID="BotonNotas" runat="server" Text="Notas" OnClick="BotonNotas_Click"/> </td>
                <td class="style6">Averig.Prev.:</td>
                <td class="style7">
                    <asp:TextBox ID="txtTerceroAveriguacion" runat="server" Width="186px" MaxLength="15" 
                       ></asp:TextBox>
                </td>
            </tr>
        </table>
        <table style="width:100%">
         <tr>
                <td class="style1"></td>
                <td class="style20"></td>
                 <td class="style1"></td>
                <td class="style13">
                    AM
                </td>
                 <td class="style1"></td>
                <td class="style25">
                   PM
                </td>
                <td class="style1"></td>
                <td class="style25">
                    ARRIBO
                </td>
                 <td class="style1"></td>
                <td class="style25">
                    TERMINO
                </td>
                 <td class="style1"></td>
                <td class="style25">
                    AJUSTADOR
                </td>
            </tr>
            <tr>
                <td class="style1"></td>
                <td class="style20">Hora Asignación:</td>
                 <td class="style1"></td>
                <td class="style13">
                    <asp:TextBox ID="txtAM" runat="server" Width="30px"
                        MaxLength="10" ></asp:TextBox>
                </td>
                 <td class="style1"></td>
                <td class="style25">
                    <asp:TextBox ID="txtPM" runat="server" Width="30px"
                        MaxLength="10" ></asp:TextBox>
                </td>
                <td class="style1"></td>
                <td class="style25">
                    <asp:TextBox ID="txtArribo" runat="server" Width="30px"
                        MaxLength="10" ></asp:TextBox>
                </td>
                 <td class="style1"></td>
                <td class="style25">
                    <asp:TextBox ID="txtTermino" runat="server" Width="30px"
                        MaxLength="10" ></asp:TextBox>
                </td>
                 <td class="style1"></td>
                <td class="style25">
                    <asp:TextBox ID="txtAjustador" runat="server" Width="30px"
                        MaxLength="10" ></asp:TextBox>
                </td>
            </tr>
        </table>
        <table style="width:100%">
            <tr>
            <td class="style20">Conclusión:</td>
                <td class="style8">
                
                     <asp:TextBox ID="txtConclusion" runat="server" Width="100%" 
                        MaxLength="45" Rows="5" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
                   <table style="width:100%">
            <tr>
                <td class="style1"></td>
                <td class="style3">Deducible:</td>
                <td class="style5">
                    <asp:TextBox ID="txtDeducible" runat="server" Width="135px" 
                       MaxLength="45" ></asp:TextBox>
                </td>
                <td></td>
                <td class="style6">A/Cuenta:</td>
                <td class="style7">
                    <asp:TextBox ID="txtACuenta" runat="server" Width="186px" MaxLength="15" 
                        ></asp:TextBox>
                </td>
                <td>
                    <td class="style3">Debe:</td>
                <td class="style5">
                    <asp:TextBox ID="txtDebe" runat="server" Width="135px" 
                        MaxLength="45" ></asp:TextBox>
                </td>
            </tr>
        </table>
                <table style="width:100%">
            <tr>
            <td class="style20">Capturó:</td>
                <td class="style8">
                
                     <asp:TextBox ID="txtCapturo" runat="server" Width="350px" 
                       MaxLength="45" Rows="5"></asp:TextBox>
                </td>
                       <td class="style20">Recibo:</td>
                <td class="style8">
                
                     <asp:TextBox ID="txtRecibo" runat="server" Width="100px" 
                     MaxLength="45" Rows="5"></asp:TextBox>
                </td>
                       <td class="style20">Pagaré:</td>
                <td class="style8">
                
                     <asp:TextBox ID="txtPagare" runat="server" Width="100px" 
                      MaxLength="45" Rows="5"></asp:TextBox>
                </td>
            </tr>
        </table>
   <!--     <table>
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
        -->
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
            </ContentTemplate>
        </asp:UpdatePanel>
        
        
    
    </div>
    </form>
</body>
</html>
