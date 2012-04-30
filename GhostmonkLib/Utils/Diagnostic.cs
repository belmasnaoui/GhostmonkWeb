using System.Collections.Generic;
using System.Diagnostics;
using log4net;

namespace GhostmonkLib.Utils
{
    public class Diagnostic
    {
        private static readonly Dictionary<string, Stopwatch> runningTests = new Dictionary<string, Stopwatch>();
        
        public static ILog Logger { set; get; }

        public static void Start( string id )
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            runningTests.Add( id, stopwatch );
        }

        public static void Stop( string id )
        {
            Stopwatch stopwatch;
            runningTests.TryGetValue( id, out stopwatch );

            if( stopwatch == null ) return;

            Logger.InfoFormat( "{0}: Elapsed = {1}", id, stopwatch.Elapsed );
            stopwatch.Restart();
            stopwatch.Stop();

            runningTests.Remove( id );
        }
    }
}
