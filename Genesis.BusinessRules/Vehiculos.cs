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

namespace Genesis.BusinessRules
{
    public class Vehiculos
    {
        public DataTable datControlesVehiculos(string sp)
        {
            DataTable dtr = new DataTable();
            dtr = new Genesis.DataAccess.Vehiculos().datControlesVehiculos(sp);
            return dtr;
        }
    }
}
