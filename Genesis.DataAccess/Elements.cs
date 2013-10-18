using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Text;
using System.Data.SqlClient;

public sealed class Elementos
{
    public string obten_Query(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
    {
        switch (Concepto)
        {
            case "Aseguradoras":
                return "exec sp_GEN_Aseguradoras";

            case "Aseguradora":
                return "exec sp_GEN_Aseguradoras '" + variable1 + "'";

            case "AseguradoraDel":
                return "exec sp_GEN_ABC_Aseguradora @iAseguradoraID='" + variable1 + "', @bStatus_Aseguradora='0', @iEmpleadoID='" + variable2 + "'";

            case "AseguradoraUpd":
                    return "exec sp_GEN_ABC_Aseguradora " + variable1;

            case "DatosMuestra":
                return "exec sp_GEN_DatosMuestra 1, '" + variable1 + "';";

            case "ArmaMenu":
                return "exec sp_GEN_DatosMuestra 2, '" + variable1 + "';";

            case "Estados":
                return "exec sp_GEN_Cat_Estado;";

            case "imgVehiculos":
                return "exec sp_GEN_MuestraFoto 1, '" + variable1 + "', 1;";

            case "imgObtenID":
                return "exec sp_GEN_MuestraFoto 1, '" + variable1 + "', 2;";

            case "imgAsignID":
                return "exec sp_GEN_MuestraFoto 1, '" + variable2 + "', 3, " + variable1 + ";";

            case "imgDelID":
                return "exec sp_GEN_MuestraFoto 1, '" + variable1 + "', 4;";

            case "Marca":
                return "exec sp_GEN_Cat_Marca";

            case "Modelo":
                return "exec sp_GEN_Cat_Modelo @iMarcaID='" + variable1 + "'";

            case "TipoClase":
                return "exec sp_GEN_Cat_TipoClase";

            case "Servicio":
                return "exec sp_GEN_Cat_Servicio";

            case "TipoUso":
                return "exec sp_GEN_Cat_Uso";

            case "Ramal":
                return "exec sp_GEN_Cat_Ramal";

            case "Transmision":
                return "exec sp_GEN_Cat_Transmision";

            case "Vehiculos":
                if (variable1.Length <= 0)
                {
                    variable1 = "0";
                }
                return "exec sp_GEN_Vehiculo null, 2, " + variable1;

            case "DelVehiculos":
                return "exec sp_GEN_Vehiculo null, 3, '" + variable1 + "'";

            case "InsVehiculos":
                return "exec sp_GEN_InsertaVehiculo " + variable1;

            case "Equipamiento":
                return "exec sp_GEN_Relacion_Equipamiento " + variable1;

            case "Equipamiento_Del":
                return "exec sp_GEN_Relacion_Equipamiento " + variable1 + ", 1";

            case "Equipamiento_Ins":
                return "exec sp_GEN_InsertaRelacion_Equipamiento @iVehiculoID='" + variable1 + "', @iEquipamientoID='" + variable2 + "', @iEmpleadoID='" + variable3 + "'";

            case "Asegurados":
                return "exec sp_GEN_Asegurado '0'";

            case "Asegurado":
                return "exec sp_GEN_Asegurado '" + variable1 + "'";

            case "AseguradosDel":
                return "exec sp_GEN_ABC_Asegurado @iType=0, @iAseguradoID='" + variable1 + "'";

            case "AseguradosUpd":
                return "exec sp_GEN_InsertaAsegurado " + variable1;

            case "Coberturas":
                return "exec sp_GEN_Cat_Cobertura";

            case "GuardaReq":
                return "exec sp_GEN_InsertaReqBasicos " + variable1;

            case "Usuarios":
                return "exec sp_GEN_Cat_Menu_Usuario";

            case "CalculaCostoSol":
                return "exec pr_GEN_getCalculo '" + variable1 + "', 'Costo'";

            case "CalculaDeducibleSol":
                return "exec pr_GEN_getCalculo '" + variable1 + "', 'Deducible'";

            case "InsertaSolPoliza":
                return "exec sp_GEN_InsertaPoliza " + variable1;

                /////////////////////////////////////////////////////////////




            case "AdminCatalogos":
                return "sp_GEN_AdministraCatalogos 1";

            case "AdminSubCatalogos":
                return "exec sp_GEN_AdministraCatalogos @iOpc=4, @cSP='" + variable1 + "'";

            case "InsertaCatalogo":
                return "exec sp_GEN_AdministraCatalogos @iOpc=2, @cValueCatalogo='" + variable1 + "', @cSP='" + variable2 + "', @iEmpleadoID='" + variable3 + "'";

            case "ActualizaCatalogo":
                return "exec sp_GEN_AdministraCatalogos @iOpc=5, @iIDCatalogo='" + variable1 + "', @cValueCatalogo='" + variable2 + "', @cSP='" + variable3 + "', @iEmpleadoID='" + variable4 + "'";

            case "EliminaCatalogo":
                return "exec sp_GEN_AdministraCatalogos @iOpc=3, @iIDCatalogo='" + variable1 + "', @cSP='" + variable2 + "', @iEmpleadoID='" + variable3 + "'";



            case "MenusUser":
                return "exec sp_GEN_Cat_Menu_Usuario '" + variable1 + "';";

            case "Menus":
                return "sp_GEN_Cat_Menu_Usuario '-1'";

            case "Roles":
                return "exec sp_GEN_Cat_Rol";

            case "MenusRol":
                return "exec sp_GEN_Cat_Rol '" + variable1 + "';";

            case "ObtenRol":
                return "select dbo.fn_GEN_getRol('" + variable1 + "');";

            

            default:
                return "";
        }
    }

    public string obten_LstDataValueField(String Concepto, String variable1, String variable2, String variable3, String variable4, String variable5)
    {
        switch (Concepto)
        {
            case "AdminCatalogos":
                return "SP";

            case "AdminSubCatalogos":
                return "id";

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

            default:
                return "";
        }
    }
}