using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project01_szelcsendesNapok_BPatrik_5cs
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // deklarálás: spec be, ki
            int napSzam, vNapSzam, db;
            int[] szelErossegek;

            // beolvasás: spec be
            string sor = Console.ReadLine();
            string[] tomb = sor.Split(' ');
            napSzam = int.Parse(tomb[0]);
            vNapSzam = int.Parse(tomb[1]);
            szelErossegek = new int[napSzam];
            for (int i = 0; i < napSzam; i++)
            {
                szelErossegek[i] = int.Parse(Console.ReadLine());
            }

            // feldolgozás: alg, stuki
            db = 0;
            for (int i = 1; i <= napSzam; i++)
            {
                if (szelErossegek[i-1] == 0)
                {
                    db++;
                }
            }

            // kiírás: spec ki
            Console.WriteLine(db);
        }
    }
}
