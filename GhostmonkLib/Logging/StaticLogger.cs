namespace GhostmonkLib.Logging
{
    /// <summary>
    /// Instantiate this at the start of the application and set an
    /// instance of ILogger before calling Log anywhere. This is a wrapper 
    /// meant to encapsulate logging funtionality for easy swapping.
    /// </summary>
    public static class StaticLogger 
    {
        public static ILogger Instance { set; private get; }

        public static void Log( string msg )
        {
            if( Instance != null )
                Instance.Log( msg );
        }

        public static void Log( string msg, object info )
        {
            if( Instance != null )
                Instance.Log( msg, info );
        }

        public static void Log( string msg, string category )
        {
            if( Instance != null )
                Instance.Log( msg, category );
        }

        public static void Log( LogLevel level, string msg )
        {
            if( Instance != null )
                Instance.Log( level, msg );
        }
        
        public static void Log( string msg, string category, object info )
        {
            if( Instance != null )
                Instance.Log( msg, category, info );
        }

        public static void Log( LogLevel level, string msg, object info )
        {
            if( Instance != null )
                Instance.Log( level, msg, info );
        }

        public static void Log( LogLevel level, string msg, string category )
        {
            if( Instance != null )
                Instance.Log( level, msg, category );
        }

        public static void Log( LogLevel level, string msg, string category, object info )
        {
            if( Instance != null )
                Instance.Log( level, msg, category, info );
        }
    }
}
