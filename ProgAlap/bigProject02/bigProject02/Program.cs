using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace bigProject02
{
    class Tel
    {
        string nev;
        int lelek;
        int jelentkezok;


    }
    internal class Program
    {
        static int n;
        List<Tel> telepulesek;

        static void read()
        {
            n = int.Parse(Console.ReadLine());
            for (int i = 0; i < n; i++)
            {
                Tel temp = new Tel();
                
            }
        }

        static void Main(string[] args)
        {
            read();
        }
    }
}
