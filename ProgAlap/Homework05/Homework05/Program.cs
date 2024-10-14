using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework05
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int n;
            Console.Write("Nevsor hossz: ");
            int.TryParse(Console.ReadLine(), out n);
            string[] nevek = new string[n];
            int[] magassagok = new int[n];
            for (int i = 0; i < n; i++)
            {
                Console.Write("\nNev: ");
                nevek[i] = Console.ReadLine();
            }
            for (int i = 0; i < n; i++)
            {
                Console.Write("\nMagassag: ");
                int.TryParse(Console.ReadLine(), out magassagok[i]);
            }

            bool sorban = true;
            for (int i = 0; i < n-1; i++)
            {
                if (magassagok[i] > magassagok[i+1])
                {
                    sorban = false;
                }
            }
            if (sorban)
            {
                Console.WriteLine("Sorban állnak");
            }
            else
            {
                Console.WriteLine("Nem sorban állnak");
            }
        }
    }
}