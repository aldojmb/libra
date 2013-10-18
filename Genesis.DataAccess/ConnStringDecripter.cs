using Microsoft.VisualBasic;
using System;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Configuration;
using System.Text;
using System.Data.SqlClient;

public class ConnStringDecripter
{
    public string DesencriptaConnString()
    {
        string constrFinal = "";
        //Microsoft.Win32.RegistryKey regKey = Microsoft.Win32.Registry.LocalMachine;
        //regKey = regKey.OpenSubKey("SOFTWARE\\\\ShieldSystems\\\\GENESIS");

        //System.Data.SqlClient.SqlConnectionStringBuilder builder = new System.Data.SqlClient.SqlConnectionStringBuilder();
        //builder["Initial Catalog"] = regKey.GetValue("DataBase");
        //builder["Data Source"] = regKey.GetValue("Server");
        //builder["User Id"] = regKey.GetValue("User");
        //builder["Password"] = regKey.GetValue("PassWord");
        //builder.ApplicationName = "GENESIS";
        //builder.IntegratedSecurity = false;
        //builder.Pooling = true;
        //builder.MinPoolSize = 0;
        //builder.MaxPoolSize = 25;
        //constrFinal = builder.ConnectionString;
        
        constrFinal = "Data Source=mssql.genseguros.com.mx;Initial Catalog=genseguros_GENESIS_2punto0;Integrated Security=False;User ID=genseguros_genesis;Password=adventur3;Pooling=True;Min Pool Size=0;Max Pool Size=25;Application Name=webPage";
        return constrFinal;
    }

    public DataTable AsignToTable(string queryString)
    {
        DataTable dataTable = new DataTable();

        using (SqlConnection connection = new SqlConnection(DesencriptaConnString()))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(queryString, connection);
            adapter.Fill(dataTable);
            return dataTable;
        }
    }

    public DataTable EjecutaAdapter(string queryString)
    {
        DataTable dt = new DataTable();
        using (SqlConnection connection = new SqlConnection(DesencriptaConnString()))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(queryString, connection);
            adapter.Fill(dt);
            return dt;
        }
    }

    public SqlDataSource cSqlDataSource(string Alimentador)
    {
        SqlDataSource sSqlDataSource = new SqlDataSource();
        sSqlDataSource.ProviderName = "System.Data.SqlClient";
        sSqlDataSource.SelectCommand = Alimentador;
        sSqlDataSource.ConnectionString = DesencriptaConnString();
        return sSqlDataSource;
    }
}
