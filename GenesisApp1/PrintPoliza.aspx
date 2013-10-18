<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    
    public string DesencriptaConnString()
    {
        string constrFinal = Session["_app_418498_connX_7858"].ToString();
        return constrFinal;
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
    
    protected void Page_Load(object sender, EventArgs e)
    {

        System.Data.DataTable dtPolizas;       
        dtPolizas = new System.Data.DataTable();
        dtPolizas = AsignToTable(obten_Query("BuscaPoliza", Request.QueryString["idPoliza"], "", "", "", ""));

        var script = "alert($('.vigenciaini').text());";
        //script += "$('.nombre').html('" + dtPolizas.Rows[0][""] + "');";
        //script += "$('.domicilio').html('" + dtPolizas.Rows[0][""] + "');";
        //script += "$('.delegacion').html('" + dtPolizas.Rows[0][""] + "');";
      //  script += "$('.vigenciaini').html('" + dtPolizas.Rows[0][""] + "');";
        
        /*
                $('.vigenciafin').html('hijo');
                $('.nombre').html('de');
                $('.domicilio').html('tu');
                $('.delegacion').html('puta');
                $('.cp').html('madre');
                $('.tel').html('no');
                $('.rfc').html('te');
                $('.marca').html('pases');
                $('.tipo').html('de');
                $('.modelo').html('verga');
                $('.motor').html('porque');
                $('.serie').html('te');
                $('.servicio').html('parto');
                $('.uso').html('tu ');
                $('.capacidad').html('madre');
                $('.placa').html('no ');
                $('.ruta').html('mames');
                $('.eco').html('pinchi');
                $('.capacidad1').html('puto');
                $('.ramal').html('me');
                $('.pasajeros').html('dijo');
                $('.deducible').html('que');
                $('.aportacion').html('no');
                $('.totalap').html('nel');
                $('.gastos').html('ni');
                $('.total').html('madre');
                $('.claveagente').html('bu');
                */
     

       // ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
        ClientScript.RegisterClientScriptBlock(typeof(Page), "myscript", script, true);
    }

    public string obten_Query(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
    {
        switch (Concepto)
        {
            case "BuscaPoliza":
                return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=5;";

            case "CargaPoliza":
                return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=1;";

            case "GuardaPoliza":
                return "exec sp_GEN_InsertaPoliza " + variable1;

            case "FormaPago":
                return "exec sp_GEN_Cat_FormaPago;";

            case "catBeneficios":
                return "exec pr_GEN_Poliza_Buscar @valor='" + variable1 + "', @type=2;";

            case "Aseguradoras":
                return "exec sp_GEN_Aseguradoras";

            case "Coberturas":
                return "exec sp_GEN_Cat_Cobertura @iAseguradoraID = '" + variable1 + "'";

            default:
                return "";
        }
    }
</script>
<html>
	<head runat="server">
		<title>Print</title>
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/normalize.css">
		<script type="text/javascript">
			$(document).ready(function(){
				alert('algo');

				$('#print').click(function() {
					//alert('algo');
					$('.vigenciaini').text('2');
					/*$('.vigenciafin').html('hijo');
					$('.nombre').html('de');
					$('.domicilio').html('tu');
					$('.delegacion').html('puta');
					$('.cp').html('madre');
					$('.tel').html('no');
					$('.rfc').html('te');
					$('.marca').html('pases');
					$('.tipo').html('de');
					$('.modelo').html('verga');
					$('.motor').html('porque');
					$('.serie').html('te');
					$('.servicio').html('parto');
					$('.uso').html('tu ');
					$('.capacidad').html('madre');
					$('.placa').html('no ');
					$('.ruta').html('mames');
					$('.eco').html('pinchi');
					$('.capacidad1').html('puto');
					$('.ramal').html('me');
					$('.pasajeros').html('dijo');
					$('.deducible').html('que');
					$('.aportacion').html('no');
					$('.totalap').html('nel');
					$('.gastos').html('ni');
					$('.total').html('madre');
					$('.claveagente').html('bu');
					*/
					window.print();
				});
			})
		</script>
	</head>
	<body>
	<form id="frmIndex" runat="server">
		<header></header>
			<div id="container">
				<div class="formato">
					<div id="linea1" class="linea">
						<span class="vigenciaini">vigenciaini</span>
						<span class="vigenciafin">vigenciafin</span>
					</div>
					<div id="linea2" class="linea">
						<span class="nombre">nombre</span>
					</div>
					<div id="linea3" class="linea">
						<span class="domicilio">domicilio</span>
					</div>
					<div id="linea4" class="linea">
						<span class="delegacion">delegacion</span>
						<span class="cp">cp</span>
						<span class="tel">tel</span>
						<span class="rfc">rfc</span>
					</div>
					<div id="linea5" class="linea">
						<span class="marca">marca</span>
						<span class="tipo">tipo</span>
						<span class="modelo">modelo</span>
						<span class="motor">motor</span>
						<span class="serie">serie</span>
					</div>
					<div id="linea6" class="linea">
						<span class="servicio">servicio</span>
						<span class="uso">uso</span>
						<span class="capacidad">capacidad</span>
						<span class="placa">placa</span>
						<span class="ruta">ruta</span>
						<span class="eco">eco</span>
					</div>
					<div id="linea7" class="linea">
						<span class="capacidad1">capacidad1</span>
						<span class="ramal">ramal</span>
					</div>
					<div id="linea7_1" class="linea"><span>1</span></div>
					<div id="linea7_2" class="linea"><span>2</span></div>
					<div id="linea7_3" class="linea"><span>3</span></div>
					<div id="linea8" class="linea">
						<span class="pasajeros">pasajeros</span>
					</div>
					<div id="linea9" class="linea">
						<span class="deducible">deducible</span>
						<span class="aportacion">aportacion</span>
						<span class="totalap">totalap</span>
					</div>
					<div id="linea10" class="linea">
						<span class="gastos">gastos</span>
					</div>
					<div id="linea11" class="linea">
						<span class="total">total</span>
					</div>
					<div id="linea12" class="linea">
						<span class="claveagente">claveagente</span>
						<span class="formapago">formapago</span>
					</div>
				</div>
				<button id="print" onclick="">PRINT</button>
			</div>
		<footer></footer>
		</form>
	</body>
</html>
