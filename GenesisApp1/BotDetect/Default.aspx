<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>BotDetect ASP.NET CAPTCHA Features Demo</title>
    <link type="text/css" rel="Stylesheet" href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <h1>BotDetect ASP.NET CAPTCHA Features Demo</h1>
    <fieldset id="Preview">
        <legend>CAPTCHA Preview</legend>
        <p class="prompt"><label for="CaptchaCodeTextBox">Retype the characters from the picture:</label></p>
        <BotDetect:Captcha ID="SampleCaptcha" runat="server" />
        <div class="validationDiv">
            <asp:TextBox ID="CaptchaCodeTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="ValidateCaptchaButton" runat="server" OnClick="ValidateCaptchaButton_Click" />
            <asp:Label ID="CaptchaCorrectLabel" runat="server" CssClass="correct"></asp:Label>
            <asp:Label ID="CaptchaIncorrectLabel" runat="server" CssClass="incorrect"></asp:Label>
        </div>
    </fieldset>
    <fieldset id="CodeProperties">
        <legend>CAPTCHA Code Properties</legend>
        <table cellpadding="5" cellspacing="0" summary="CAPTCHA Properties layout table">
            <tr>
                <td class="left">
                    <label for="LocaleDropDown"><span>Locale:</span></label>
                </td>
                <td>
                    <asp:DropDownList ID="LocaleDropDown" runat="server">
                        <asp:ListItem Value="">[Default]</asp:ListItem>
                        <asp:ListItem Value="en-US">en-US</asp:ListItem>
                        <asp:ListItem Value="en-CA">en-CA</asp:ListItem>
                        <asp:ListItem Value="fr-CA">fr-CA</asp:ListItem>
                        <asp:ListItem Value="es-MX">es-MX</asp:ListItem>
                    </asp:DropDownList>
                    <!-- Add additional languages above (based on http://captcha.biz/captcha-localizations.html), e.g.:
                        <asp:ListItem Value="en-GB">en-GB</asp:ListItem>
                        <asp:ListItem Value="es-ES">es-ES</asp:ListItem>
                        <asp:ListItem Value="fr-FR">fr-FR</asp:ListItem>
                    -->
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="left">
                    <label for="CodeLengthTextBox"><span>Code Length:</span></label>
                </td>
                <td>
                    <asp:TextBox ID="CodeLengthTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CodeLengthRequiredValidator" runat="server"
                        ControlToValidate="CodeLengthTextBox"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="CodeLengthRangeValidator" runat="server"
                        ControlToValidate="CodeLengthTextBox"></asp:RangeValidator>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="left">
                    <label for="CodeStyleDropDown"><span>Code Style:</span></label>
                </td>
                <td>
                    <asp:DropDownList ID="CodeStyleDropDown" runat="server"></asp:DropDownList>
                </td>
                <td></td>
            </tr>
        </table>
        </fieldset>
        <fieldset id="ImageProperties">
        <legend>CAPTCHA Image Properties</legend>
        <table cellpadding="5" cellspacing="0" summary="CAPTCHA Properties layout table">
            <tr>
                <td class="left">
                    <label for="ImageStyleDropDown"><span>Image Style:</span></label>
                </td>
                <td>
                    <asp:DropDownList ID="ImageStyleDropDown" runat="server"></asp:DropDownList>
                </td>
                <td></td>
            </tr>
            <tr>
                 <td class="left">
                    <label for="CustomLightColorDropDown"><span>Custom Light Color:</span></label>
                </td>
                <td>
                    <asp:DropDownList ID="CustomLightColorDropDown" runat="server">
                        <asp:ListItem Value="Default">[Default]</asp:ListItem>
                        <asp:ListItem Value="AliceBlue">AliceBlue</asp:ListItem>
                        <asp:ListItem Value="AntiqueWhite">AntiqueWhite</asp:ListItem>
                        <asp:ListItem Value="Aqua">Aqua</asp:ListItem>
                        <asp:ListItem Value="Aquamarine">Aquamarine</asp:ListItem>
                        <asp:ListItem Value="Azure">Azure</asp:ListItem>
                        <asp:ListItem Value="Beige">Beige</asp:ListItem>
                        <asp:ListItem Value="Bisque">Bisque</asp:ListItem>
                        <asp:ListItem Value="Black">Black</asp:ListItem>
                        <asp:ListItem Value="BlanchedAlmond">BlanchedAlmond</asp:ListItem>
                        <asp:ListItem Value="Blue">Blue</asp:ListItem>
                        <asp:ListItem Value="BlueViolet">BlueViolet</asp:ListItem>
                        <asp:ListItem Value="Brown">Brown</asp:ListItem>
                        <asp:ListItem Value="BurlyWood">BurlyWood</asp:ListItem>
                        <asp:ListItem Value="CadetBlue">CadetBlue</asp:ListItem>
                        <asp:ListItem Value="Chartreuse">Chartreuse</asp:ListItem>
                        <asp:ListItem Value="Chocolate">Chocolate</asp:ListItem>
                        <asp:ListItem Value="Coral">Coral</asp:ListItem>
                        <asp:ListItem Value="CornflowerBlue">CornflowerBlue</asp:ListItem>
                        <asp:ListItem Value="Cornsilk">Cornsilk</asp:ListItem>
                        <asp:ListItem Value="Crimson">Crimson</asp:ListItem>
                        <asp:ListItem Value="Cyan">Cyan</asp:ListItem>
                        <asp:ListItem Value="DarkBlue">DarkBlue</asp:ListItem>
                        <asp:ListItem Value="DarkCyan">DarkCyan</asp:ListItem>
                        <asp:ListItem Value="DarkGoldenrod">DarkGoldenrod</asp:ListItem>
                        <asp:ListItem Value="DarkGrey">DarkGrey</asp:ListItem>
                        <asp:ListItem Value="DarkGreen">DarkGreen</asp:ListItem>
                        <asp:ListItem Value="DarkKhaki">DarkKhaki</asp:ListItem>
                        <asp:ListItem Value="DarkMagenta">DarkMagenta</asp:ListItem>
                        <asp:ListItem Value="DarkOliveGreen">DarkOliveGreen</asp:ListItem>
                        <asp:ListItem Value="DarkOrange">DarkOrange</asp:ListItem>
                        <asp:ListItem Value="DarkOrchid">DarkOrchid</asp:ListItem>
                        <asp:ListItem Value="DarkRed">DarkRed</asp:ListItem>
                        <asp:ListItem Value="DarkSalmon">DarkSalmon</asp:ListItem>
                        <asp:ListItem Value="DarkSeaGreen">DarkSeaGreen</asp:ListItem>
                        <asp:ListItem Value="DarkSlateBlue">DarkSlateBlue</asp:ListItem>
                        <asp:ListItem Value="DarkSlateGrey">DarkSlateGrey</asp:ListItem>
                        <asp:ListItem Value="DarkTurquoise">DarkTurquoise</asp:ListItem>
                        <asp:ListItem Value="DarkViolet">DarkViolet</asp:ListItem>
                        <asp:ListItem Value="DeepPink">DeepPink</asp:ListItem>
                        <asp:ListItem Value="DeepSkyBlue">DeepSkyBlue</asp:ListItem>
                        <asp:ListItem Value="DimGrey">DimGrey</asp:ListItem>
                        <asp:ListItem Value="DodgerBlue">DodgerBlue</asp:ListItem>
                        <asp:ListItem Value="Firebrick">Firebrick</asp:ListItem>
                        <asp:ListItem Value="FloralWhite">FloralWhite</asp:ListItem>
                        <asp:ListItem Value="ForestGreen">ForestGreen</asp:ListItem>
                        <asp:ListItem Value="Fuchsia">Fuchsia</asp:ListItem>
                        <asp:ListItem Value="Gainsboro">Gainsboro</asp:ListItem>
                        <asp:ListItem Value="GhostWhite">GhostWhite</asp:ListItem>
                        <asp:ListItem Value="Gold">Gold</asp:ListItem>
                        <asp:ListItem Value="Goldenrod">Goldenrod</asp:ListItem>
                        <asp:ListItem Value="Grey">Grey</asp:ListItem>
                        <asp:ListItem Value="Green">Green</asp:ListItem>
                        <asp:ListItem Value="GreenYellow">GreenYellow</asp:ListItem>
                        <asp:ListItem Value="Honeydew">Honeydew</asp:ListItem>
                        <asp:ListItem Value="HotPink">HotPink</asp:ListItem>
                        <asp:ListItem Value="IndianRed">IndianRed</asp:ListItem>
                        <asp:ListItem Value="Indigo">Indigo</asp:ListItem>
                        <asp:ListItem Value="Ivory">Ivory</asp:ListItem>
                        <asp:ListItem Value="Khaki">Khaki</asp:ListItem>
                        <asp:ListItem Value="Lavender">Lavender</asp:ListItem>
                        <asp:ListItem Value="LavenderBlush">LavenderBlush</asp:ListItem>
                        <asp:ListItem Value="LawnGreen">LawnGreen</asp:ListItem>
                        <asp:ListItem Value="LemonChiffon">LemonChiffon</asp:ListItem>
                        <asp:ListItem Value="LightBlue">LightBlue</asp:ListItem>
                        <asp:ListItem Value="LightCoral">LightCoral</asp:ListItem>
                        <asp:ListItem Value="LightCyan">LightCyan</asp:ListItem>
                        <asp:ListItem Value="LightGoldenrodYellow">LightGoldenrodYellow</asp:ListItem>
                        <asp:ListItem Value="LightGrey">LightGrey</asp:ListItem>
                        <asp:ListItem Value="LightGreen">LightGreen</asp:ListItem>
                        <asp:ListItem Value="LightPink">LightPink</asp:ListItem>
                        <asp:ListItem Value="LightSalmon">LightSalmon</asp:ListItem>
                        <asp:ListItem Value="LightSeaGreen">LightSeaGreen</asp:ListItem>
                        <asp:ListItem Value="LightSkyBlue">LightSkyBlue</asp:ListItem>
                        <asp:ListItem Value="LightSlateGrey">LightSlateGrey</asp:ListItem>
                        <asp:ListItem Value="LightSteelBlue">LightSteelBlue</asp:ListItem>
                        <asp:ListItem Value="LightYellow">LightYellow</asp:ListItem>
                        <asp:ListItem Value="Lime">Lime</asp:ListItem>
                        <asp:ListItem Value="LimeGreen">LimeGreen</asp:ListItem>
                        <asp:ListItem Value="Linen">Linen</asp:ListItem>
                        <asp:ListItem Value="Magenta">Magenta</asp:ListItem>
                        <asp:ListItem Value="Maroon">Maroon</asp:ListItem>
                        <asp:ListItem Value="MediumAquamarine">MediumAquamarine</asp:ListItem>
                        <asp:ListItem Value="MediumBlue">MediumBlue</asp:ListItem>
                        <asp:ListItem Value="MediumOrchid">MediumOrchid</asp:ListItem>
                        <asp:ListItem Value="MediumPurple">MediumPurple</asp:ListItem>
                        <asp:ListItem Value="MediumSeaGreen">MediumSeaGreen</asp:ListItem>
                        <asp:ListItem Value="MediumSlateBlue">MediumSlateBlue</asp:ListItem>
                        <asp:ListItem Value="MediumSpringGreen">MediumSpringGreen</asp:ListItem>
                        <asp:ListItem Value="MediumTurquoise">MediumTurquoise</asp:ListItem>
                        <asp:ListItem Value="MediumVioletRed">MediumVioletRed</asp:ListItem>
                        <asp:ListItem Value="MidnightBlue">MidnightBlue</asp:ListItem>
                        <asp:ListItem Value="MintCream">MintCream</asp:ListItem>
                        <asp:ListItem Value="MistyRose">MistyRose</asp:ListItem>
                        <asp:ListItem Value="Moccasin">Moccasin</asp:ListItem>
                        <asp:ListItem Value="NavajoWhite">NavajoWhite</asp:ListItem>
                        <asp:ListItem Value="Navy">Navy</asp:ListItem>
                        <asp:ListItem Value="OldLace">OldLace</asp:ListItem>
                        <asp:ListItem Value="Olive">Olive</asp:ListItem>
                        <asp:ListItem Value="OliveDrab">OliveDrab</asp:ListItem>
                        <asp:ListItem Value="Orange">Orange</asp:ListItem>
                        <asp:ListItem Value="OrangeRed">OrangeRed</asp:ListItem>
                        <asp:ListItem Value="Orchid">Orchid</asp:ListItem>
                        <asp:ListItem Value="PaleGoldenrod">PaleGoldenrod</asp:ListItem>
                        <asp:ListItem Value="PaleGreen">PaleGreen</asp:ListItem>
                        <asp:ListItem Value="PaleTurquoise">PaleTurquoise</asp:ListItem>
                        <asp:ListItem Value="PaleVioletRed">PaleVioletRed</asp:ListItem>
                        <asp:ListItem Value="PapayaWhip">PapayaWhip</asp:ListItem>
                        <asp:ListItem Value="PeachPuff">PeachPuff</asp:ListItem>
                        <asp:ListItem Value="Peru">Peru</asp:ListItem>
                        <asp:ListItem Value="Pink">Pink</asp:ListItem>
                        <asp:ListItem Value="Plum">Plum</asp:ListItem>
                        <asp:ListItem Value="PowderBlue">PowderBlue</asp:ListItem>
                        <asp:ListItem Value="Purple">Purple</asp:ListItem>
                        <asp:ListItem Value="Red">Red</asp:ListItem>
                        <asp:ListItem Value="RosyBrown">RosyBrown</asp:ListItem>
                        <asp:ListItem Value="RoyalBlue">RoyalBlue</asp:ListItem>
                        <asp:ListItem Value="SaddleBrown">SaddleBrown</asp:ListItem>
                        <asp:ListItem Value="Salmon">Salmon</asp:ListItem>
                        <asp:ListItem Value="SandyBrown">SandyBrown</asp:ListItem>
                        <asp:ListItem Value="SeaGreen">SeaGreen</asp:ListItem>
                        <asp:ListItem Value="SeaShell">SeaShell</asp:ListItem>
                        <asp:ListItem Value="Sienna">Sienna</asp:ListItem>
                        <asp:ListItem Value="Silver">Silver</asp:ListItem>
                        <asp:ListItem Value="SkyBlue">SkyBlue</asp:ListItem>
                        <asp:ListItem Value="SlateBlue">SlateBlue</asp:ListItem>
                        <asp:ListItem Value="SlateGrey">SlateGrey</asp:ListItem>
                        <asp:ListItem Value="Snow">Snow</asp:ListItem>
                        <asp:ListItem Value="SpringGreen">SpringGreen</asp:ListItem>
                        <asp:ListItem Value="SteelBlue">SteelBlue</asp:ListItem>
                        <asp:ListItem Value="Tan">Tan</asp:ListItem>
                        <asp:ListItem Value="Teal">Teal</asp:ListItem>
                        <asp:ListItem Value="Thistle">Thistle</asp:ListItem>
                        <asp:ListItem Value="Tomato">Tomato</asp:ListItem>
                        <asp:ListItem Value="Turquoise">Turquoise</asp:ListItem>
                        <asp:ListItem Value="Violet">Violet</asp:ListItem>
                        <asp:ListItem Value="Wheat">Wheat</asp:ListItem>
                        <asp:ListItem Value="White">White</asp:ListItem>
                        <asp:ListItem Value="WhiteSmoke">WhiteSmoke</asp:ListItem>
                        <asp:ListItem Value="Yellow">Yellow</asp:ListItem>
                        <asp:ListItem Value="YellowGreen">YellowGreen</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="left">
                    <label for="CustomDarkColorDropDown"><span>Custom Dark Color:</span></label>
                </td>
                <td>
                    <asp:DropDownList ID="CustomDarkColorDropDown" runat="server">
                        <asp:ListItem Value="Default">[Default]</asp:ListItem>
                        <asp:ListItem Value="AliceBlue">AliceBlue</asp:ListItem>
                        <asp:ListItem Value="AntiqueWhite">AntiqueWhite</asp:ListItem>
                        <asp:ListItem Value="Aqua">Aqua</asp:ListItem>
                        <asp:ListItem Value="Aquamarine">Aquamarine</asp:ListItem>
                        <asp:ListItem Value="Azure">Azure</asp:ListItem>
                        <asp:ListItem Value="Beige">Beige</asp:ListItem>
                        <asp:ListItem Value="Bisque">Bisque</asp:ListItem>
                        <asp:ListItem Value="Black">Black</asp:ListItem>
                        <asp:ListItem Value="BlanchedAlmond">BlanchedAlmond</asp:ListItem>
                        <asp:ListItem Value="Blue">Blue</asp:ListItem>
                        <asp:ListItem Value="BlueViolet">BlueViolet</asp:ListItem>
                        <asp:ListItem Value="Brown">Brown</asp:ListItem>
                        <asp:ListItem Value="BurlyWood">BurlyWood</asp:ListItem>
                        <asp:ListItem Value="CadetBlue">CadetBlue</asp:ListItem>
                        <asp:ListItem Value="Chartreuse">Chartreuse</asp:ListItem>
                        <asp:ListItem Value="Chocolate">Chocolate</asp:ListItem>
                        <asp:ListItem Value="Coral">Coral</asp:ListItem>
                        <asp:ListItem Value="CornflowerBlue">CornflowerBlue</asp:ListItem>
                        <asp:ListItem Value="Cornsilk">Cornsilk</asp:ListItem>
                        <asp:ListItem Value="Crimson">Crimson</asp:ListItem>
                        <asp:ListItem Value="Cyan">Cyan</asp:ListItem>
                        <asp:ListItem Value="DarkBlue">DarkBlue</asp:ListItem>
                        <asp:ListItem Value="DarkCyan">DarkCyan</asp:ListItem>
                        <asp:ListItem Value="DarkGoldenrod">DarkGoldenrod</asp:ListItem>
                        <asp:ListItem Value="DarkGrey">DarkGrey</asp:ListItem>
                        <asp:ListItem Value="DarkGreen">DarkGreen</asp:ListItem>
                        <asp:ListItem Value="DarkKhaki">DarkKhaki</asp:ListItem>
                        <asp:ListItem Value="DarkMagenta">DarkMagenta</asp:ListItem>
                        <asp:ListItem Value="DarkOliveGreen">DarkOliveGreen</asp:ListItem>
                        <asp:ListItem Value="DarkOrange">DarkOrange</asp:ListItem>
                        <asp:ListItem Value="DarkOrchid">DarkOrchid</asp:ListItem>
                        <asp:ListItem Value="DarkRed">DarkRed</asp:ListItem>
                        <asp:ListItem Value="DarkSalmon">DarkSalmon</asp:ListItem>
                        <asp:ListItem Value="DarkSeaGreen">DarkSeaGreen</asp:ListItem>
                        <asp:ListItem Value="DarkSlateBlue">DarkSlateBlue</asp:ListItem>
                        <asp:ListItem Value="DarkSlateGrey">DarkSlateGrey</asp:ListItem>
                        <asp:ListItem Value="DarkTurquoise">DarkTurquoise</asp:ListItem>
                        <asp:ListItem Value="DarkViolet">DarkViolet</asp:ListItem>
                        <asp:ListItem Value="DeepPink">DeepPink</asp:ListItem>
                        <asp:ListItem Value="DeepSkyBlue">DeepSkyBlue</asp:ListItem>
                        <asp:ListItem Value="DimGrey">DimGrey</asp:ListItem>
                        <asp:ListItem Value="DodgerBlue">DodgerBlue</asp:ListItem>
                        <asp:ListItem Value="Firebrick">Firebrick</asp:ListItem>
                        <asp:ListItem Value="FloralWhite">FloralWhite</asp:ListItem>
                        <asp:ListItem Value="ForestGreen">ForestGreen</asp:ListItem>
                        <asp:ListItem Value="Fuchsia">Fuchsia</asp:ListItem>
                        <asp:ListItem Value="Gainsboro">Gainsboro</asp:ListItem>
                        <asp:ListItem Value="GhostWhite">GhostWhite</asp:ListItem>
                        <asp:ListItem Value="Gold">Gold</asp:ListItem>
                        <asp:ListItem Value="Goldenrod">Goldenrod</asp:ListItem>
                        <asp:ListItem Value="Grey">Grey</asp:ListItem>
                        <asp:ListItem Value="Green">Green</asp:ListItem>
                        <asp:ListItem Value="GreenYellow">GreenYellow</asp:ListItem>
                        <asp:ListItem Value="Honeydew">Honeydew</asp:ListItem>
                        <asp:ListItem Value="HotPink">HotPink</asp:ListItem>
                        <asp:ListItem Value="IndianRed">IndianRed</asp:ListItem>
                        <asp:ListItem Value="Indigo">Indigo</asp:ListItem>
                        <asp:ListItem Value="Ivory">Ivory</asp:ListItem>
                        <asp:ListItem Value="Khaki">Khaki</asp:ListItem>
                        <asp:ListItem Value="Lavender">Lavender</asp:ListItem>
                        <asp:ListItem Value="LavenderBlush">LavenderBlush</asp:ListItem>
                        <asp:ListItem Value="LawnGreen">LawnGreen</asp:ListItem>
                        <asp:ListItem Value="LemonChiffon">LemonChiffon</asp:ListItem>
                        <asp:ListItem Value="LightBlue">LightBlue</asp:ListItem>
                        <asp:ListItem Value="LightCoral">LightCoral</asp:ListItem>
                        <asp:ListItem Value="LightCyan">LightCyan</asp:ListItem>
                        <asp:ListItem Value="LightGoldenrodYellow">LightGoldenrodYellow</asp:ListItem>
                        <asp:ListItem Value="LightGrey">LightGrey</asp:ListItem>
                        <asp:ListItem Value="LightGreen">LightGreen</asp:ListItem>
                        <asp:ListItem Value="LightPink">LightPink</asp:ListItem>
                        <asp:ListItem Value="LightSalmon">LightSalmon</asp:ListItem>
                        <asp:ListItem Value="LightSeaGreen">LightSeaGreen</asp:ListItem>
                        <asp:ListItem Value="LightSkyBlue">LightSkyBlue</asp:ListItem>
                        <asp:ListItem Value="LightSlateGrey">LightSlateGrey</asp:ListItem>
                        <asp:ListItem Value="LightSteelBlue">LightSteelBlue</asp:ListItem>
                        <asp:ListItem Value="LightYellow">LightYellow</asp:ListItem>
                        <asp:ListItem Value="Lime">Lime</asp:ListItem>
                        <asp:ListItem Value="LimeGreen">LimeGreen</asp:ListItem>
                        <asp:ListItem Value="Linen">Linen</asp:ListItem>
                        <asp:ListItem Value="Magenta">Magenta</asp:ListItem>
                        <asp:ListItem Value="Maroon">Maroon</asp:ListItem>
                        <asp:ListItem Value="MediumAquamarine">MediumAquamarine</asp:ListItem>
                        <asp:ListItem Value="MediumBlue">MediumBlue</asp:ListItem>
                        <asp:ListItem Value="MediumOrchid">MediumOrchid</asp:ListItem>
                        <asp:ListItem Value="MediumPurple">MediumPurple</asp:ListItem>
                        <asp:ListItem Value="MediumSeaGreen">MediumSeaGreen</asp:ListItem>
                        <asp:ListItem Value="MediumSlateBlue">MediumSlateBlue</asp:ListItem>
                        <asp:ListItem Value="MediumSpringGreen">MediumSpringGreen</asp:ListItem>
                        <asp:ListItem Value="MediumTurquoise">MediumTurquoise</asp:ListItem>
                        <asp:ListItem Value="MediumVioletRed">MediumVioletRed</asp:ListItem>
                        <asp:ListItem Value="MidnightBlue">MidnightBlue</asp:ListItem>
                        <asp:ListItem Value="MintCream">MintCream</asp:ListItem>
                        <asp:ListItem Value="MistyRose">MistyRose</asp:ListItem>
                        <asp:ListItem Value="Moccasin">Moccasin</asp:ListItem>
                        <asp:ListItem Value="NavajoWhite">NavajoWhite</asp:ListItem>
                        <asp:ListItem Value="Navy">Navy</asp:ListItem>
                        <asp:ListItem Value="OldLace">OldLace</asp:ListItem>
                        <asp:ListItem Value="Olive">Olive</asp:ListItem>
                        <asp:ListItem Value="OliveDrab">OliveDrab</asp:ListItem>
                        <asp:ListItem Value="Orange">Orange</asp:ListItem>
                        <asp:ListItem Value="OrangeRed">OrangeRed</asp:ListItem>
                        <asp:ListItem Value="Orchid">Orchid</asp:ListItem>
                        <asp:ListItem Value="PaleGoldenrod">PaleGoldenrod</asp:ListItem>
                        <asp:ListItem Value="PaleGreen">PaleGreen</asp:ListItem>
                        <asp:ListItem Value="PaleTurquoise">PaleTurquoise</asp:ListItem>
                        <asp:ListItem Value="PaleVioletRed">PaleVioletRed</asp:ListItem>
                        <asp:ListItem Value="PapayaWhip">PapayaWhip</asp:ListItem>
                        <asp:ListItem Value="PeachPuff">PeachPuff</asp:ListItem>
                        <asp:ListItem Value="Peru">Peru</asp:ListItem>
                        <asp:ListItem Value="Pink">Pink</asp:ListItem>
                        <asp:ListItem Value="Plum">Plum</asp:ListItem>
                        <asp:ListItem Value="PowderBlue">PowderBlue</asp:ListItem>
                        <asp:ListItem Value="Purple">Purple</asp:ListItem>
                        <asp:ListItem Value="Red">Red</asp:ListItem>
                        <asp:ListItem Value="RosyBrown">RosyBrown</asp:ListItem>
                        <asp:ListItem Value="RoyalBlue">RoyalBlue</asp:ListItem>
                        <asp:ListItem Value="SaddleBrown">SaddleBrown</asp:ListItem>
                        <asp:ListItem Value="Salmon">Salmon</asp:ListItem>
                        <asp:ListItem Value="SandyBrown">SandyBrown</asp:ListItem>
                        <asp:ListItem Value="SeaGreen">SeaGreen</asp:ListItem>
                        <asp:ListItem Value="SeaShell">SeaShell</asp:ListItem>
                        <asp:ListItem Value="Sienna">Sienna</asp:ListItem>
                        <asp:ListItem Value="Silver">Silver</asp:ListItem>
                        <asp:ListItem Value="SkyBlue">SkyBlue</asp:ListItem>
                        <asp:ListItem Value="SlateBlue">SlateBlue</asp:ListItem>
                        <asp:ListItem Value="SlateGrey">SlateGrey</asp:ListItem>
                        <asp:ListItem Value="Snow">Snow</asp:ListItem>
                        <asp:ListItem Value="SpringGreen">SpringGreen</asp:ListItem>
                        <asp:ListItem Value="SteelBlue">SteelBlue</asp:ListItem>
                        <asp:ListItem Value="Tan">Tan</asp:ListItem>
                        <asp:ListItem Value="Teal">Teal</asp:ListItem>
                        <asp:ListItem Value="Thistle">Thistle</asp:ListItem>
                        <asp:ListItem Value="Tomato">Tomato</asp:ListItem>
                        <asp:ListItem Value="Turquoise">Turquoise</asp:ListItem>
                        <asp:ListItem Value="Violet">Violet</asp:ListItem>
                        <asp:ListItem Value="Wheat">Wheat</asp:ListItem>
                        <asp:ListItem Value="White">White</asp:ListItem>
                        <asp:ListItem Value="WhiteSmoke">WhiteSmoke</asp:ListItem>
                        <asp:ListItem Value="Yellow">Yellow</asp:ListItem>
                        <asp:ListItem Value="YellowGreen">YellowGreen</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="left">
                    <label for="ImageFormatDropDown"><span>Image Format:</span></label>
                </td>
                <td>
                    <asp:DropDownList ID="ImageFormatDropDown" runat="server"></asp:DropDownList>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="left">
                    <label for="WidthTextBox"><span>Image Width:</span></label>
                </td>
                <td>
                    <asp:TextBox ID="WidthTextBox" runat="server"></asp:TextBox>&nbsp;px
                    <asp:RequiredFieldValidator ID="WidthRequiredValidator" runat="server"
                        ControlToValidate="WidthTextBox"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="WidthRangeValidator" runat="server"
                        ControlToValidate="WidthTextBox"></asp:RangeValidator>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="left">
                    <label for="HeightTextBox"><span>Image Height:</span></label>
                </td>
                <td>
                    <asp:TextBox ID="HeightTextBox" runat="server"></asp:TextBox>&nbsp;px
                    <asp:RequiredFieldValidator ID="HeightRequiredValidator" runat="server"
                        ControlToValidate="HeightTextBox"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="HeightRangeValidator" runat="server"
                        ControlToValidate="HeightTextBox"></asp:RangeValidator>
                </td>
                <td></td>
            </tr>
            </table>
        </fieldset>
        <fieldset id="AudioProperties">
        <legend>CAPTCHA Audio Properties</legend>
        <table cellpadding="5" cellspacing="0" summary="CAPTCHA Properties layout table">
            <tr>
                <td class="left">
                    <label for="SoundStyleDropDown"><span>Sound Style:</span></label>
                </td>
                <td>
                    <asp:DropDownList ID="SoundStyleDropDown" runat="server"></asp:DropDownList>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="left">
                    <label for="SoundFormatDropDown"><span>Sound Format:</span></label>
                </td>
                <td>
                    <asp:DropDownList ID="SoundFormatDropDown" runat="server"></asp:DropDownList>
                </td>
                <td></td>
            </tr>
        </table>
    </fieldset>
    <asp:ValidationSummary ID="PageValidationSummary" runat="server" />
    <div class="submit">
        <asp:Button ID="ApplyButton" runat="server" OnClick="ApplyButton_Click" />
    </div>
    <div id="systeminfo">
        <p>Visual Studio 2008 / .NET 3.5 demo.</p>
        <p><%= Captcha.ControlInfo %></p>
    </div>
    <div id="notes">
        <div class="note">
            <h3>Description</h3>
            <p>This demo allows you to easily experiment with various BotDetect parameters and their combinations, so you can determine the best CAPTCHA settings for your needs.</p>
            <p>Please note that values in brackets (such as <code>[Default]</code> and <code>[Random]</code>) are not actual parameter values you can use directly in your code.</p>
        </div>
        <div class="note" id="localization">
            <h3>Localization</h3>
            <p>BotDetect installations include pronunciation sound packages (required for localized Captcha sounds) only for North-American locales by deafult. The <code>Locale</code> drop-down list values relect this fact.</p>
            <p>You can specify any other locale string for the <code>Locale</code> parameter value (e.g. <code>"en-GB"</code>, <code>"ru"</code>, <code>"zh-Hans"</code>). However, not all character sets might be supported yet, and you will have to download the pronunciation sound package separately from our site when it's available.</p>
            <p>You can always see the full list of locales for which we support both Captcha images and Captcha sounds &ndash; and download the required pronunciation sound packages &ndash; at the <a href="http://captcha.biz/captcha-localizations.html" title="BotDetect 3.0 CAPTCHA Localizations">BotDetect 3.0 CAPTCHA localizations</a> page.</p>
        </div>
        <% if (Captcha.IsFree) { %>
        <div class="note warning">
            <h3>Free Version Limitations</h3>
            <p>The free version of BotDetect includes a randomized <code>BotDetect™</code> trademark in the background of 50% of all Captcha images generated.</p>   
            <p>It also has limited sound functionality, replacing the CAPTCHA sound with "SOUND DEMO" for randomly selected 50% of all CAPTCHA codes.</p>   
            <p>Lastly, the bottom 15 px of the CAPTCHA image are reserved for a link to the BotDetect website.</p>
            <p>All of these limitations are removed if you <a href="http://captcha.biz/shop.html" title="BotDetect CAPTCHA online store, pricing information, payment options, licensing &amp; upgrading">upgrade</a> your BotDetect license.</p>
        </div>
        <% } %>
    </div>
    </form>
</body>
</html>
