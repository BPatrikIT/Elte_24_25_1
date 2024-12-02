using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace utlevelSzamok
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int n = 10;
            string[] utlevelek = new string[n];
            for (int i = 0; i < utlevelek.Length; i++)
            {
                utlevelek[i] = Console.ReadLine();
            }

            int min = utlevelek.Length + 1;
            int ind = 0;
            for (int i = 1; i < utlevelek.Length; i++)
            {
                for (int j = 0; j < i-1; j++)
                {
                    if (utlevelek[i] == utlevelek[j] && i-j-1 < min)
                    {
                        min = i - j - 1;
                        ind = j;
                    }
                }
            }

            if (ind == 0)
            {
                Console.WriteLine("\nNincs ilyen");
            }
            else
            {
                Console.WriteLine("\n" + utlevelek[ind] + ": " + min);
            }
            Console.ReadKey();
        }
    }
}
