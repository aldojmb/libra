<%@ Page Language="C#" AutoEventWireup="true"
    Inherits="GenesisApp1.OrdenAdmision" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ORDEN DE ADMISION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080">
        <asp:Panel ID="pnlMain" runat="server">
            <table style="width: 100%">
                <tr>
                    <td align="right">
                        <asp:TextBox ID="TextBox1" runat="server">FOLIO</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:TextBox ID="TextBox2" runat="server">NO. REPORTE</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:TextBox ID="TextBox3" runat="server">NO. SINIESTRO</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="ORDEN DE ADMISION"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 880px; background: url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Mexico D.F. a:"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox4" runat="server" Width="20px">Dia</asp:TextBox>
                        <asp:TextBox ID="TextBox5" runat="server" Width="20px">Mes</asp:TextBox>
                        <asp:TextBox ID="TextBox6" runat="server" Width="30px">Ano</asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Hora:"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Endoso:"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Tercero:"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Periodo de Gracia:"></asp:Label>
                        <br />
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>SI</asp:ListItem>
                            <asp:ListItem>NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Nombre del Asegurado :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox10" runat="server" Width="504px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Telefono :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Deducible :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Lugar de Nacimiento :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox13" runat="server" Width="504px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Poliza :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="Placas :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Nombre(s) y Apellidos / Denominacion o Razon Social :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox16" runat="server" Width="626px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="Telefono :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="Razon Social donde se enviara el vehiculo :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox17" runat="server" Width="504px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="Responsable :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text="Telefono :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text="Calle :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox21" runat="server" Width="504px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text="Colonia :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="Delegacion :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text="Marca :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox24" runat="server" Width="237px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text="Tipo :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label23" runat="server" Text="Modelo :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label24" runat="server" Text="No. Motor :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label25" runat="server" Text="Cobertura :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label26" runat="server" Text="No. Serie :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox29" runat="server" Width="237px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label27" runat="server" Text="Color :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label28" runat="server" Text="Placas :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label29" runat="server" Text="T. Automatica :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label30" runat="server" Text="T. Manual :"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label31" runat="server" Text="Descripcion de Daños a Reparar :"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox34" runat="server" Width="406px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox35" runat="server" Width="410px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox36" runat="server" Width="406px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox37" runat="server" Width="410px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox38" runat="server" Width="406px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox39" runat="server" Width="410px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox40" runat="server" Width="406px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox41" runat="server" Width="410px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
                <tr>
                    <td>
                        <asp:Label ID="Label32" runat="server" Text="Daños preexistentes :"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>SI</asp:ListItem>
                            <asp:ListItem>NO</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox42" runat="server" Width="406px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox43" runat="server" Width="410px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox44" runat="server" Width="406px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox45" runat="server" Width="410px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox46" runat="server" Width="406px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox47" runat="server" Width="410px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table style="width: 880px;">
            </table>
            <table style="width: 880px;">
                <tr>
                    <td class="style30">
                        <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                    </td>
                    <td class="style27" style="text-align: right">
                        <asp:ImageButton ID="btnRefresh" runat="server" ImageUrl="images/refresh.gif" />
                        &nbsp;<asp:ImageButton ID="btnClean" runat="server" ImageUrl="images/clean.gif"  />
                        &nbsp;<asp:ImageButton ID="btnTrash" runat="server" ImageUrl="images/trash.gif"/>
                        &nbsp;<asp:ImageButton ID="btnSave" runat="server" ImageUrl="images/save.gif" />
                        &nbsp;<asp:ImageButton ID="btnNew" runat="server" ImageUrl="images/add.gif"  />
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
