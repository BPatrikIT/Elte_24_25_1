using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Bartók Patrik Róbert - MNDJ3P - mndj3p@inf.elte.hu

namespace bigProject02
{
    internal class Program
    {

        class Tel
        {
            private string nev;
            private int lelek;
            private int jelentkezok;

            public string Nev
            {
                get { return nev; }
                set { nev = value; }
            }

            public int Lelek
            {
                get { return lelek; }
                set { lelek = value; }
            }

            public int Jelentkezok
            {
                get { return jelentkezok; }
                set { jelentkezok = value; }
            }
        }
        //Deklarálás
        static int n;
        static List<Tel> telepulesek = new List<Tel>();
        static int[] osszegzes = new int[7];

        static void read()
        {
            n = int.Parse(Console.ReadLine());
            for (int i = 0; i < n; i++)
            {
                Tel temp = new Tel();
                temp.Nev = Console.ReadLine();
                temp.Lelek = int.Parse(Console.ReadLine());
                temp.Jelentkezok = int.Parse(Console.ReadLine());
                telepulesek.Add(temp);
            }
        }

        static int csoport(int j)
        {
            int csoportsz;
            if (telepulesek[j].Lelek < 700)
            {
                csoportsz = 1;
            } else if (telepulesek[j].Lelek < 1500)
            {
                csoportsz = 2;
            }
            else if (telepulesek[j].Lelek < 3000)
            {
                csoportsz = 3;
            }
            else if (telepulesek[j].Lelek < 8000)
            {
                csoportsz = 4;
            }
            else if (telepulesek[j].Lelek < 25000)
            {
                csoportsz = 5;
            }
            else if (telepulesek[j].Lelek < 70000)
            {
                csoportsz = 6;
            }
            else
            {
                csoportsz = 7;
            }

            int csoport = csoportsz;
            return csoport;
        }

        static int sum(int i)
        {
            int s = 0;

            for (int j = 0; j < n; j++)
            {
                if (csoport(j) == i+1)
                {
                    s = s + telepulesek[j].Jelentkezok;
                }
            }

            int sum = s;
            return sum;
        }

        static void write()
        {
            Console.Write(osszegzes[0]);
            for (int i = 1; i < 7; i++)
            {
                Console.Write(" " + osszegzes[i]);
            }
        }

        static void Main(string[] args)
        {
            read();
            for (int i = 0; i < 7; i++)
            {
                osszegzes[i] = sum(i);
            }
            write();
        }
    }
}
