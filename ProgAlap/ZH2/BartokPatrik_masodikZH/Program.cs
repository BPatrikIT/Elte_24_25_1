//Bartók Patrik - MNDJ3P - mndj3p@inf.elte.hu

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BartokPatrik_masodikZH
{
    internal class Program
    {
        static int meretBeolvas()
        {
            int n = 0;
            bool correntInput = false;

            do
            {
                Console.Write("\nKérem adje meg a tömb méretét: ");
                if (int.TryParse(Console.ReadLine(), out n))
                {
                    correntInput = true;
                    if (n <= 0)
                    {
                        correntInput = false;
                    }
                }
                else
                {
                    Console.WriteLine("Nem megfgelelő érték, kérem adjon meg egy pozitív egész számot.");
                }
            }
            while (!correntInput);

            return n;
        }

        static int[] tombBeolvas(int n)
        {
            int[] tomb = new int[n];

            int i = 0;
            int temp = -20;
            while (i < n)
            {
                Console.Write("\nAdja meg a(z) " + (i+1) + ". értéket: ");
                if (int.TryParse(Console.ReadLine(), out temp))
                {
                    if (temp >= -10 && temp <= 10)
                    {
                        tomb[i] = temp;
                        i++;
                        temp = -20;
                    }
                    else
                    {
                        Console.WriteLine("hibás bemente. Kérem aadjon meg egy értéket -10 és 10 között.");
                    }
                }                
            }

            return tomb;
        }

        static bool vanalatta(int i, int n, int[] x)
        {
            bool van = false;

            int j = i + 1;

            while (j <= n-1 && x[i] != x[j])
            {
                j++;
            }
            van = j <= n - 1;

            bool vanalatta = van;
            return vanalatta;
        } 

        static bool vanegyforma(int n, int[] x)
        {
            bool vanegyforma = false;

            int i = 0;

            while (i <= n-1 && vanalatta(i, n, x) == false)
            {
                i = i + 1;
            }
            vanegyforma = i <= n-1;

            return vanegyforma;
        }

        static void kiir(bool vanEgyforma)
        {
            if (vanEgyforma)
            {
                Console.WriteLine("\nVan két egyforma érték a listában");
            }
            else
            {
                Console.WriteLine("\nNincs két egyforma érték a listában");
            }
            Console.ReadKey();
        }


        static void Main(string[] args)
        {
            int n;
            int[] x; 
            bool vanEgyforma = false;

            n = meretBeolvas();
            x = tombBeolvas(n);

            vanEgyforma = vanegyforma(n, x);

            kiir(vanEgyforma);
        }
    }
}
