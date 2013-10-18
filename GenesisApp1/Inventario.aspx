<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="GenesisApp1.Inventario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aseguradora GENESIS I</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: medium; color: #808080">
        <table style="width: 100%">
            <tr>
                <td class="style1">
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="INVENTARIO DEL VEHICULO"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width: 880px; height: 450px; background: url(images/box_bgBACK.gif) #ffffff no-repeat top center;">
            <tr>
                <td>
                    Amortiguadores
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="NO" />
                </td>
                <td>
                    Extinguidor
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox3" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox4" runat="server" Text="NO" />
                </td>
                <td>
                    Palanca de Velocidad
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox5" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox6" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Antena
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox7" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox8" runat="server" Text="NO" />
                </td>
                <td>
                    Facia Trasera
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox9" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox10" runat="server" Text="NO" />
                </td>
                <td>
                    Parabrisas
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox11" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox12" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Asiento Delantero Der.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox13" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox14" runat="server" Text="NO" />
                </td>
                <td>
                    Faros Delanteros Der.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox15" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox16" runat="server" Text="NO" />
                </td>
                <td>
                    Parrilla
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox17" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox18" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Asiento Delantero Izq.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox19" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox20" runat="server" Text="NO" />
                </td>
                <td>
                    Faros Delanteros Izq.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox21" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox22" runat="server" Text="NO" />
                </td>
                <td>
                    Portezuelas
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox23" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox24" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Asientos Traseros
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox25" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox26" runat="server" Text="NO" />
                </td>
                <td>
                    Frenos de Mano
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox27" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox28" runat="server" Text="NO" />
                </td>
                <td>
                    Puerta Izquierda No.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox29" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox30" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Cables para Coerriente
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox31" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox32" runat="server" Text="NO" />
                </td>
                <td>
                    Gato
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox33" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox34" runat="server" Text="NO" />
                </td>
                <td>
                    Puerta Derecha No.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox35" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox36" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Cajuela
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox37" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox38" runat="server" Text="NO" />
                </td>
                <td>
                    Guantera
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox39" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox40" runat="server" Text="NO" />
                </td>
                <td>
                    Rhin derecho delantera
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox41" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox42" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Calaveras Traseras Der.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox43" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox44" runat="server" Text="NO" />
                </td>
                <td>
                    Intermitentes No.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox45" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox46" runat="server" Text="NO" />
                </td>
                <td>
                    Rhin Derecho Trasero
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox47" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox48" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Calaveras Traseras Izq.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox49" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox50" runat="server" Text="NO" />
                </td>
                <td>
                    Limpiador Derecho
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox51" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox52" runat="server" Text="NO" />
                </td>
                <td>
                    Rhin Delantero Izq.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox53" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox54" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Cenicero No.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox55" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox56" runat="server" Text="NO" />
                </td>
                <td>
                    Limpiador Izq.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox57" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox58" runat="server" Text="NO" />
                </td>
                <td>
                    Rhin Izquierdo Trasero
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox59" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox60" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Cinturones de Seguridad No.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox61" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox62" runat="server" Text="NO" />
                </td>
                <td>
                    Limpiador Trasero
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox63" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox64" runat="server" Text="NO" />
                </td>
                <td>
                    Salpicadera
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox65" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox66" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Coderas Laterales
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox67" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox68" runat="server" Text="NO" />
                </td>
                <td>
                    Llanta de refaccion
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox69" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox70" runat="server" Text="NO" />
                </td>
                <td>
                    Tapa Cajuela
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox71" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox72" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Cofre
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox73" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox74" runat="server" Text="NO" />
                </td>
                <td>
                    Llanta Delantera Der.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox75" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox76" runat="server" Text="NO" />
                </td>
                <td>
                    Tapetes No.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox77" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox78" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Cristales No.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox79" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox80" runat="server" Text="NO" />
                </td>
                <td>
                    Llanta Delantera Izq.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox81" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox82" runat="server" Text="NO" />
                </td>
                <td>
                    Tapiceria
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox83" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox84" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Defensa Delantera
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox85" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox86" runat="server" Text="NO" />
                </td>
                <td>
                    Llanta Trasera Der.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox87" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox88" runat="server" Text="NO" />
                </td>
                <td>
                    Tapon de Gasolina
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox89" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox90" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Direccion
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox91" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox92" runat="server" Text="NO" />
                </td>
                <td>
                    Llanta Trasera Izq.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox93" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox94" runat="server" Text="NO" />
                </td>
                <td>
                    Tapones No.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox95" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox96" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Direcciones Integradas
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox97" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox98" runat="server" Text="NO" />
                </td>
                <td>
                    Llave
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox99" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox100" runat="server" Text="NO" />
                </td>
                <td>
                    Transmision
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox101" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox102" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Espejo Lateral Der.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox103" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox104" runat="server" Text="NO" />
                </td>
                <td>
                    Medallon
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox105" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox106" runat="server" Text="NO" />
                </td>
                <td>
                    Vestidura
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox107" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox108" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Espejo Lateral Izq.
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox109" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox110" runat="server" Text="NO" />
                </td>
                <td>
                    Molduras
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox111" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox112" runat="server" Text="NO" />
                </td>
                <td>
                    Volante
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox113" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox114" runat="server" Text="NO" />
                </td>
            </tr>
            <tr>
                <td>
                    Espejo Retrovisor
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox115" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox116" runat="server" Text="NO" />
                </td>
                <td>
                    Motor
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox117" runat="server" Text="SI" />
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox118" runat="server" Text="NO" />
                </td>
                <td>
                    Otros
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table style="width: 880px">

        </table>
        <table style="width: 880px">
            <tr>
                <td class="style14">
                </td>
                <td>
                    <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="#D50000"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:ImageButton ID="btnRefresh" runat="server" ImageUrl="images/refresh.gif" OnClick="btnRefresh_Click" />
                    &nbsp;<asp:ImageButton ID="btnClean" runat="server" ImageUrl="images/clean.gif" OnClick="btnClean_Click" />
                    &nbsp;<asp:ImageButton ID="btnTrash" runat="server" ImageUrl="images/trash.gif" OnClick="btnTrash_Click" />
                    &nbsp;<asp:ImageButton ID="btnSave" runat="server" ImageUrl="images/save.gif" OnClick="btnSave_Click" />
                    &nbsp;<asp:ImageButton ID="btnNew" runat="server" ImageUrl="images/add.gif" OnClick="btnNew_Click" />
                </td>
                <td class="style15">
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
