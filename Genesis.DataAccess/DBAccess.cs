using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace Genesis.DataAccess
{
    public sealed class DBManager
    {
        private SqlConnection m_connection;
        private SqlCommand m_command;
        private bool m_isOpen;
        private SqlTransaction m_currentTransaction;

        public DBManager()
        {
            m_connection = null;
            m_command = null;
            m_isOpen = false;
        }

        ~DBManager()
        {
            closeConnection();
        }

        public bool isOpen
        {
            get { return m_connection != null && m_connection.State == ConnectionState.Open; }
        }
        public bool openConnection()
        {
            ConnStringDecripter oConn = new ConnStringDecripter();
            //String connectionString = "Data Source=aldojmb-HP\\sqlexpress; Initial Catalog=Genesis; Trusted_Connection=Yes;User Id=pruebagenesis;Password=genesis;";
            //String connectionString = "Data Source=192.168.239.128;Initial Catalog=genesis;Integrated Security=False;User ID=genesis;Password=adventur3;Pooling=True;Min Pool Size=0;Max Pool Size=25;Application Name=GENESIS";
            String connectionString = oConn.DesencriptaConnString();
            return openConnection(connectionString);
        }

        public bool newCommand(string query)
        {
            m_command = new SqlCommand(query, m_connection, m_currentTransaction);

            return m_command != null;
        }

        public bool newCommandSP(string query)
        {
            m_command = new SqlCommand(query, m_connection, m_currentTransaction);
            m_command.CommandType = CommandType.StoredProcedure;

            return m_command != null;
        }

        public System.Data.Common.DbDataReader ExecuteReader()
        {
            return m_command.ExecuteReader();
        }

        public int ExecuteNonQuery()
        {
            return m_command.ExecuteNonQuery();
        }

        public object getLastId()
        {
            object lastId;

            SqlCommand cmd = new SqlCommand("SELECT @@IDENTITY", m_connection, m_currentTransaction);
            lastId = cmd.ExecuteScalar();

            return lastId;
        }

        public object ExecuteScalar()
        {
            return m_command.ExecuteScalar();
        }

        public void addParameterValue(string paramName, object paramValue)
        {
            m_command.Parameters.AddWithValue(paramName, paramValue);
        }

        public bool openConnection(string connectionString)
        {
            if (m_isOpen)
                closeConnection();
            if (m_connection == null)
            {
                m_connection = new SqlConnection(connectionString);
                m_connection.Open();
                m_isOpen = true;
            }

            return m_isOpen;
        }

        public void beginTransaction()
        {

            m_currentTransaction = m_connection.BeginTransaction();
        }

        public void commit()
        {
            if (m_currentTransaction != null)
                m_currentTransaction.Commit();
            m_currentTransaction = null;
        }

        public void rollback()
        {
            if (m_currentTransaction != null)
                m_currentTransaction.Rollback();
            m_currentTransaction = null;
        }

        public void closeConnection()
        {
            if (m_connection != null)
            {
                if (m_connection.State == ConnectionState.Open)
                    m_connection.Close();
                m_connection = null;
                m_isOpen = false;
            }
        }
    }
}
