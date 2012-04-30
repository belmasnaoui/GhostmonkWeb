using System;
using System.Configuration;
using System.Xml;
using System.Xml.Serialization;
using System.Xml.XPath;

namespace GhostmonkLib.Web.Utils
{
    public class XmlSerializerConfigSectionHandler : IConfigurationSectionHandler
    {
        private const string MISSING_TYPE_MSG = "The type attribute is not present on the root node of the <{0}> configuration section";
        private const string NULL_TYPE_MSG = "The type attribute \'{0}\' specified in the root node of the <{1}> configuration section is not a valid type.";
        private const string FAILED_DESERIALIZE_MSG = "Unable to deserialize an object of type \'{0}\' from the <{1}> configuration section: {2}";

        public object Create( object parent, object configContext, XmlNode section )
        {
            XPathNavigator navigator = section.CreateNavigator();
            string typeName = ( string )navigator.Evaluate( "string(@type)" );

            if( string.IsNullOrEmpty( typeName ) )
                throw new ConfigurationErrorsException( string.Format( MISSING_TYPE_MSG, section.Name ), section );

            Type type = Type.GetType( typeName );
            if( type == null )
                throw new ConfigurationErrorsException( string.Format( NULL_TYPE_MSG, typeName, section.Name ), section );

            XmlSerializer serializer = new XmlSerializer( type );
            XmlNodeReader reader = new XmlNodeReader( section );

            try
            {
                return serializer.Deserialize( reader );
            }
            catch( Exception ex )
            {
                throw new ConfigurationErrorsException(
                    string.Format( FAILED_DESERIALIZE_MSG, typeName, section.Name, FormattedInnerExceptions( ex ) ),
                    ex, section );
            }
        }

        private static string FormattedInnerExceptions( Exception ex )
        {
            string message = ex.Message;
            Exception inner = ex.InnerException;
            while( inner != null )
            {
                message += "; " + inner.Message;
                inner = inner.InnerException;
            }
            return message;
        }
    }
}
