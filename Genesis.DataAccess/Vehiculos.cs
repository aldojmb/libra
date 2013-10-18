using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using Genesis.DataAccess;

namespace Genesis.DataAccess
{
    public class Vehiculos
    {
        public DataTable datControlesVehiculos(string sp)
        {
            DataTable dt = new DataTable();
            DBManager comm = new DBManager();
            try
            {
                if (comm.openConnection())
                {
                    comm.newCommandSP(sp);
                    using (DbDataReader dbr = comm.ExecuteReader())
                    {
                        dt.Load(dbr);
                    }            
                }
            }
            catch (Exception)
            {
                dt = null;
            }
            finally 
            {
                comm.closeConnection();
            }
            return dt;
        }
    }
}
