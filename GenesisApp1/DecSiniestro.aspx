<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DecSiniestro.aspx.cs" Inherits="GenesisApp1.DecSiniestro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
        .style31
        {
            width: 70px;
        }
        .style32
        {
            width: 100px;
        }
        .tableSiniestro
        {
            margin-left: 100px;
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="font-size: medium; color: #808080;">
                <table style="width: 850px; height: 400px; background: url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
                    <tr>
                        <td style="width: 100%; height: 100%; text-align: center;">
                            <asp:Panel ID="pnlMain" runat="server">
                                <br />
                                <br />
                                <table style="width: 100%">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Font-Size="X-Large" Style="font-family: Arial;"
                                                Text="Datos del Asegurado"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 600px" class="tableSiniestro">
                                    <tr>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label3" runat="server" Text="Reporte :"></asp:Label>
                                            <asp:TextBox ID="txtReporteSearch" runat="server"></asp:TextBox>
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/find.gif" OnClick="btnFind_Click" />
                                        </td>
                                        <td class="style2" style="width: 150px" align="right">
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style32" style="text-align: left">
                                            *Nombre:<asp:TextBox ID="txtAseguradoNombre" runat="server" Width="323px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td class="style29">
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style20" style="text-align: left">
                                            *Dirección:
                                            <asp:TextBox ID="txtAseguradoDireccion" runat="server" Width="195px" MaxLength="30"></asp:TextBox>
                                        </td>
                                        <td class="style26">
                                        </td>
                                    </tr>
                                </table>
                                <table class="tableSiniestro" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td class="style20">
                                            Status de Póliza:
                                        </td>
                                        <td class="style23">
                                            <asp:TextBox ID="txtAseguradoPolizaStatus" runat="server" Width="195px" MaxLength="30"></asp:TextBox>
                                        </td>
                                        <td class="style20">
                                            Vigencia:
                                        </td>
                                        <td class="style24">
                                            <asp:TextBox ID="txtAseguradoPolizaVigencia" runat="server" Width="170px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td class="style10">
                                            Deducible:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAseguradoPolizaDedudible" runat="server" Width="124px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td class="style10">
                                            Teléfono:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAseguradoPolizaTelefono" runat="server" Width="124px" MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Datos del Conductor"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            *Nombre:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtConductorNombre" runat="server" Width="90px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td>
                                            Edad:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtConductorEdad" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            *Teléfono 1:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtConductorTelefono" runat="server" Width="90px" MaxLength="20"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td class="style20">
                                            *Calle:
                                        </td>
                                        <td class="style26">
                                            <asp:TextBox ID="txtConductorCalle" runat="server" Width="195px" MaxLength="30"></asp:TextBox>
                                        </td>
                                        <td class="style21">
                                            *No. Ext:
                                        </td>
                                        <td class="style13">
                                            <asp:TextBox ID="txtConductorNoExt" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="style20">
                                            No. Int:
                                        </td>
                                        <td class="style25">
                                            <asp:TextBox ID="txtConductorNoInt" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="style19">
                                            *Colonia:
                                        </td>
                                        <td class="style17">
                                            <asp:TextBox ID="txtConductorColonia" runat="server" Width="118px" MaxLength="15"></asp:TextBox>
                                        </td>
                                        <td class="style18">
                                            *CP:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtConductorCP" runat="server" Width="60px" MaxLength="5"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td class="style20">
                                            *Fecha Nac.:
                                        </td>
                                        <td class="style26">
                                            <asp:TextBox ID="txtConductorFechaNac" runat="server" Width="195px" MaxLength="30"></asp:TextBox>
                                        </td>
                                        <td class="style21">
                                            *Licencia:
                                        </td>
                                        <td class="style13">
                                            <asp:TextBox ID="txtConductorLicencia" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="style20">
                                            Vigencia:
                                        </td>
                                        <td class="style25">
                                            <asp:TextBox ID="txtConductorVigencia" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="Datos del Vehículo"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%; height: 100px;" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td class="style20">
                                            *Marca.:
                                        </td>
                                        <td class="style26">
                                            <asp:TextBox ID="txtVehiculoAseguradoMarca" runat="server" Width="195px" MaxLength="30"></asp:TextBox>
                                        </td>
                                        <td class="style21">
                                            *Tipo:
                                        </td>
                                        <td class="style13">
                                            <asp:TextBox ID="txtVehiculoAseguradoTipo" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="style20">
                                            Modelo:
                                        </td>
                                        <td class="style25">
                                            <asp:TextBox ID="txtVehiculoAseguradoModelo" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="style20">
                                            Color:
                                        </td>
                                        <td class="style25">
                                            <asp:TextBox ID="txtVehiculoAseguradoColor" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table style="width: 100%; height: 100px;" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td class="style20">
                                            *No.Serie:
                                        </td>
                                        <td class="style26">
                                            <asp:TextBox ID="txtVehiculoAseguradoNoSerie" runat="server" Width="195px" MaxLength="30"></asp:TextBox>
                                        </td>
                                        <td class="style21">
                                            *No.Motor:
                                        </td>
                                        <td class="style13">
                                            <asp:TextBox ID="txtVehiculoAseguradoNoMotor" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="style20">
                                            Placas:
                                        </td>
                                        <td class="style25">
                                            <asp:TextBox ID="txtVehiculoAseguradoPlacas" runat="server" Width="30px" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Font-Size="X-Large" Text="Información del siniestro"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            Hora Asignada:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtSiniestroHora" runat="server" Width="90px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td>
                                            Arribo:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSiniestroArribo" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td>
                                            Termino:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSiniestroTermino" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            Ubicación:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtSiniestroUbicacion" runat="server" Width="90px" MaxLength="20"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style20">
                                            Narración de los hechos:
                                        </td>
                                        <td class="style8">
                                            <asp:TextBox ID="txtSiniestroNarracion" runat="server" Width="100%" MaxLength="45"
                                                Rows="5" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Datos del vehículo tercero"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            Nombre del propietario:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtVehiculoTercerNombreProp" runat="server" Width="90px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td>
                                            Dirección:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerDireccion" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td>
                                            Teléfono:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerTelefono" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            Nombre del conductor:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtVehiculoTercerConductorNombre" runat="server" Width="90px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td>
                                            Licencia:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerConductorLicencia" runat="server" Width="90px"
                                                MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td>
                                            Teléfono:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerConductorTelefono" runat="server" Width="90px"
                                                MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            Marca:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtVehiculoTercerMarca" runat="server" Width="90px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td>
                                            Tipo:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerTipo" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td>
                                            Modelo:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerModelo" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td>
                                            Color:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerColor" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            No. Serie:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtVehiculoTercerNoSerie" runat="server" Width="90px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td>
                                            No. Motor:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerNoMotor" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td>
                                            Placas:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerPlacas" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            Cia. de seguros:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtVehiculoTercerCiaSeguros" runat="server" Width="90px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td>
                                            Póliza:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerPoliza" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td>
                                            Vigencia:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerVigencia" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            Cobertura:
                                        </td>
                                        <td class="style29">
                                            <asp:TextBox ID="txtVehiculoTercerCobertura" runat="server" Width="90px" MaxLength="35"></asp:TextBox>
                                        </td>
                                        <td>
                                            Siniestro:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerSiniestro" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                        <td>
                                            Ajustador:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehiculoTercerAjustador" runat="server" Width="90px" MaxLength="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style20">
                                            Daños:
                                        </td>
                                        <td class="style8">
                                            <asp:TextBox ID="txtVehiculoTercerDanos" runat="server" Width="100%" MaxLength="45"
                                                Rows="5" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style20">
                                            Apoyo:
                                        </td>
                                        <td class="style8" align="left">
                                            <asp:RadioButtonList ID="rdbtnlApoyo" runat="server" RepeatDirection="Horizontal"
                                                OnSelectedIndexChanged="Apoyo_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td>
                                    </tr>
                                </table>
                                <asp:Panel ID="pnlDatosApoyo" runat="server" Visible="false">
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style1">
                                            </td>
                                            <td class="style3">
                                                Transito:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox40" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td class="style6">
                                                Seguridad Pública:
                                            </td>
                                            <td class="style7">
                                                <asp:TextBox ID="TextBox41" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"></asp:TextBox>
                                            </td>
                                            <td>
                                            <td class="style3">
                                                INVEA:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox42" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style1">
                                                AMBULANCIA
                                            </td>
                                            <td class="style3">
                                                Dependencia:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox43" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td class="style6">
                                                Placas:
                                            </td>
                                            <td class="style7">
                                                <asp:TextBox ID="TextBox44" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"></asp:TextBox>
                                            </td>
                                            <td>
                                            <td class="style3">
                                                No.:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox45" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style1">
                                                PATRULLA
                                            </td>
                                            <td class="style3">
                                                Dependencia:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox46" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td class="style6">
                                                Placas:
                                            </td>
                                            <td class="style7">
                                                <asp:TextBox ID="TextBox47" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"></asp:TextBox>
                                            </td>
                                            <td>
                                            <td class="style3">
                                                No.:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox48" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style1">
                                                OFICIAL
                                            </td>
                                            <td class="style3">
                                                Dependencia:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox49" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td class="style6">
                                                Placas:
                                            </td>
                                            <td class="style7">
                                                <asp:TextBox ID="TextBox50" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"></asp:TextBox>
                                            </td>
                                            <td>
                                            <td class="style3">
                                                No.:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox51" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style1">
                                                Protec.Civil:
                                            </td>
                                            <td class="style3">
                                                Dependencia:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox52" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td class="style6">
                                                Placas:
                                            </td>
                                            <td class="style7">
                                                <asp:TextBox ID="TextBox53" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"></asp:TextBox>
                                            </td>
                                            <td>
                                            <td class="style3">
                                                Organo Normativo:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox54" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                                <br />
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style20">
                                            Viajero 3o:
                                        </td>
                                        <td class="style8" align="left">
                                            <asp:RadioButtonList ID="rdbtnlLesionados" runat="server" RepeatDirection="Horizontal"
                                                OnSelectedIndexChanged="Lesionados_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td class="style20" style="width: 120px">
                                            Pase Médico:
                                        </td>
                                        <td class="style8" align="left">
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td>
                                    </tr>
                                </table>
                                <asp:Panel ID="pnlLesionados" runat="server" Visible="false">
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style3">
                                                Viajero:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox55" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td class="style6">
                                                3o:
                                            </td>
                                            <td class="style7">
                                                <asp:TextBox ID="TextBox56" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"></asp:TextBox>
                                            </td>
                                            <td>
                                            <td class="style3">
                                                Nombre:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox57" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td class="style3">
                                                Teléfono:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox58" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style20">
                                                Dirección:
                                            </td>
                                            <td class="style8">
                                                <asp:TextBox ID="TextBox59" runat="server" Width="250px" MaxLength="45" Rows="5"></asp:TextBox>
                                            </td>
                                            <td class="style20">
                                                Edad:
                                            </td>
                                            <td class="style8">
                                                <asp:TextBox ID="TextBox69" runat="server" Width="40px" MaxLength="45" Rows="5"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style20">
                                                Observaciones:
                                            </td>
                                            <td class="style8">
                                                <asp:TextBox ID="TextBox60" runat="server" Width="100%" MaxLength="45" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style3">
                                                Viajero:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox61" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td class="style6">
                                                3o:
                                            </td>
                                            <td class="style7">
                                                <asp:TextBox ID="TextBox62" runat="server" Width="186px" MaxLength="15" ForeColor="#999999"></asp:TextBox>
                                            </td>
                                            <td>
                                            <td class="style3">
                                                Nombre:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox63" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                            <td class="style3">
                                                Teléfono:
                                            </td>
                                            <td class="style5">
                                                <asp:TextBox ID="TextBox64" runat="server" Width="135px" MaxLength="45"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style20">
                                                Dirección:
                                            </td>
                                            <td class="style8">
                                                <asp:TextBox ID="TextBox65" runat="server" Width="250px" MaxLength="45" Rows="5"></asp:TextBox>
                                            </td>
                                            <td class="style20">
                                                Edad:
                                            </td>
                                            <td class="style8">
                                                <asp:TextBox ID="TextBox70" runat="server" Width="40px" MaxLength="45" Rows="5"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%" class="tableSiniestro">
                                        <tr>
                                            <td class="style20">
                                                Observaciones:
                                            </td>
                                            <td class="style8">
                                                <asp:TextBox ID="TextBox66" runat="server" Width="100%" MaxLength="45" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                                <br />
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Font-Size="X-Large" Text="Informe Ajustador"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style20">
                                            RESPONSABILIDAD:
                                        </td>
                                        <td class="style8" align="left">
                                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Asegurado" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Tercero" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style8">
                                            <asp:TextBox ID="TextBox67" runat="server" Width="100%" MaxLength="45" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Font-Size="X-Large" Text="Croquis"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel runat="server" ID="pnl1">

                                    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyBNYMw_NXIyFSUxAHtXTdcYBYuN5kM4Xrs"
                                        type="text/javascript"></script>

                                    <script type="text/javascript">
                                var polygon;
                                function load() {
                                    if (GBrowserIsCompatible()) {
                                        var map = new GMap2(document.getElementById("map"));
                                        map.setCenter(new GLatLng(-99.220118, 19.429979), 13);
                                        map.openInfoWindowHtml(new GLatLng(19.398800, -99.261069), "<h3>Atendido por Libra: </h1>");

                                        map.addControl(new GMapTypeControl());
                                        map.addControl(new GSmallZoomControl());
                                        map.addControl(new GLargeMapControl);
                                        map.setMapType(G_NORMAL_MAP);


                                        //DEFINO EL ICONO
                                        var iconoMarca = new GIcon(G_DEFAULT_ICON);


                                        function createMarker(point, nombre, ruta, VMU, VMV, Grw, Cove) {

                                            //CREO LA MARCA EN EL PUNTO Y CON EL ICONO DESEADO
                                            var marker = new GMarker(point, iconoMarca);

                                            GEvent.addListener(marker, 'click', function () {
                                                marker.openInfoWindowHtml("<span style='font-size: 8pt; font-family: verdana'>" + nombre + "</span>");
                                            });
                                            return marker;
                                        }

                                        // Punto Rojo
                                        var point = new GPoint(-99.250924, 19.386437);
                                        var nombre = 'Lugar del Accidente';
                                        var ruta = "";
                                        var VMU = '';
                                        var VMV = '';
                                        var Grw = '';
                                        var Cove = ''
                                        var marker = createMarker(point, nombre, ruta, VMU, VMV, Grw, Cove);
                                        map.addOverlay(marker);

                                    }
                                }

                                window.onload = load

                                //]]>


                                    </script>

                                    <div id="map" style="width: 90%; height: 300px">
                                    </div>
                                </asp:Panel>
                                <br />
                                <br />
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style1">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Font-Size="X-Large" Text="Cierre"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%" class="tableSiniestro">
                                    <tr>
                                        <td class="style2" style="width: 150px" align="right">
                                            <br />
                                            Indique el tipo de cierre:
                                        </td>
                                        <td class="style8" align="left" style="width: 200px">
                                            <br />
                                            <asp:DropDownList ID="cmbCierres" runat="server" Width="160px" AutoPostBack="True"
                                                OnSelectedIndexChanged="Cierres_SelectedIndexChanged">
                                                <asp:ListItem Text="Seleccione" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="No localizado" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Cancelado" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Convenio" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Pase a cobro" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="Orden de admisión" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="Pase Médico" Value="6"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:Button ID="BotonNotas" runat="server" Text="Notas" OnClick="BotonNotas_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
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
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
