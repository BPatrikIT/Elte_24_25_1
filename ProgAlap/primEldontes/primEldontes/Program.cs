using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace primEldontes
{
    internal class Program
    {
        static bool primEldontes(int n)
        {
            if (n < 2)
            {
                return false;
            }
            for (int i = 2; i <= Math.Sqrt(n); i++)
            {
                if (n % i == 0)
                {
                    return false;
                }
            }
            return true;
        }
        static void Main(string[] args)
        {
            int n, db;
            int[] szn;
            Console.WriteLine("Adja meg a tömb méretét: ");
            int.TryParse(Console.ReadLine(), out n);
            szn = new int[n];
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine("Adja meg a tömb {0}. elemét: ", i + 1);
                int.TryParse(Console.ReadLine(), out szn[i]);
            }
            db = 0;
            for (int i = 1; i <= n; i++)
            {
                if (primEldontes(szn[i-1]))
                {
                    db++;
                }
            }
            Console.WriteLine(db);
        }
    }
}
