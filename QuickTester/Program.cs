using System;

namespace QuickTester
{
    class Program
    {
        public Program()
        {
            Console.WriteLine( true );
            Console.WriteLine( Convert.ToBoolean( true.ToString() ) );
            Console.WriteLine( Convert.ToBoolean( 1 ) );
            Console.WriteLine( Convert.ToBoolean( "true" ) );
            Console.WriteLine( Convert.ToBoolean( "TRUE" ) );
            Console.WriteLine( Convert.ToBoolean( "True" ) );
            Console.WriteLine();
            Console.WriteLine( Convert.ToBoolean( false.ToString() ) );
            Console.WriteLine( Convert.ToBoolean( 0 ) );
            Console.WriteLine( Convert.ToBoolean( "false" ) );
            Console.WriteLine( Convert.ToBoolean( "FALSE" ) );
            Console.WriteLine( Convert.ToBoolean( "False" ) );
        }

        static void Main( string[] args )
        {
            new Program();
            Console.ReadLine();
        }
    }
}
