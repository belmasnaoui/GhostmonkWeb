namespace GhostmonkLib.Logging
{
    public interface ILogger
    {
        void Log( string msg );

        void Log( string msg, object info );

        void Log( string msg, string category );

        void Log( LogLevel level, string msg );
        
        void Log( string msg, string category, object info );

        void Log( LogLevel level, string msg, object info );

        void Log( LogLevel level, string msg, string category );

        void Log( LogLevel level, string msg, string category, object info );
    }

    public enum LogLevel
    {
        Info, Warning, Error
    }
}