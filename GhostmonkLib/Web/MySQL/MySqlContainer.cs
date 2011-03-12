using System.Collections.Generic;
using System.Linq;
using GhostmonkLib.Logging;
using MySql.Data.MySqlClient;

namespace GhostmonkLib.Web.MySQL
{
    public static class MySqlContainer
    {
        public static MySqlConnection CreateConnection( string connectionString )
        {
            MySqlConnection connection = null;

            try
            {
                connection = new MySqlConnection( connectionString );
                connection.Open();
            }
            catch( MySqlException ex )
            {
                StaticLogger.Log( LogLevel.Error, "FAILED MySQL CONNECTION : " + ex.Message );
            }

            return connection;
        }

        public static List<Dictionary<string, object>> Execute( this MySqlConnection connection, string sqlCmd )
        {
            return connection.Execute( sqlCmd, 0, -1 );
        }

        public static List<Dictionary<string, object>> Execute( this MySqlConnection connection, string sqlCmd, int start, int limit )
        {
            Stack<Dictionary<string, object>> output = new Stack<Dictionary<string, object>>();
            MySqlDataReader reader = null;

            try
            {
                MySqlCommand cmd = new MySqlCommand( sqlCmd, connection );
                reader = cmd.ExecuteReader();

                while( reader.Read() )
                {
                    Dictionary<string, object> entry = new Dictionary<string, object>();
                    for( int i = 0; i < reader.FieldCount; i++ )
                    {
                        entry[ reader.GetDataTypeName( i )  ] = reader.GetValue( i );               
                    }
                    output.Push( entry );
                }
            }
            catch( MySqlException ex )
            {
                StaticLogger.Log( LogLevel.Error, "FAILED MySQL READ : " + ex.Message );
            }
            finally
            {
                if( reader != null )
                    reader.Close();
            }

            return output.ToList();
        }
    }
}
