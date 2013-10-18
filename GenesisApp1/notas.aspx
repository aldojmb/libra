<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notas.aspx.cs" Inherits="GenesisApp1.notas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <table>
        <tr>
            <td>
                Notas: 
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtNotas" runat="server" TextMode="MultiLine" Rows="4" Width="650px" Height="300"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:Button ID="BotonNotas" runat="server" Text="Guardar" OnClick="BotonNotas_Click"/> 
        </tr>
       </table>
    </div>
    </form>
</body>
</html>
