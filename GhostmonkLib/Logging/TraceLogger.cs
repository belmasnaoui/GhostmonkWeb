using System;
using System.Diagnostics;

namespace GhostmonkLib.Logging
{
    public class TraceLogger : ILogger
    {
        public void Log( string msg )
        {
            Trace.WriteLine( Time + msg );
        }

        public void Log( string msg, object info )
        {
            Trace.WriteLine( Time + msg + ", info : " + info );
        }

        public void Log( string msg, string category )
        {
            Trace.WriteLine( Time + msg, category );
        }

        public void Log( LogLevel level, string msg )
        {
            Trace.WriteLine( Time + level + " : " + msg );
        }

        public void Log( string msg, string category, object info )
        {
            Trace.WriteLine( Time + msg + ", info : " + info, category );
        }

        public void Log( LogLevel level, string msg, object info )
        {
            Trace.WriteLine( Time + level + " : " + msg + ", info : " + info );
        }

        public void Log( LogLevel level, string msg, string category )
        {
            Trace.WriteLine( Time + level + " : " + msg, category );
        }

        public void Log( LogLevel level, string msg, string category, object info )
        {
            Trace.WriteLine( Time + level + " : " + msg + ", info : " + info, category );
        }

        private static string Time
        {
            get { return "[ " + DateTime.Now + " ] "; }
        }
    }
}
