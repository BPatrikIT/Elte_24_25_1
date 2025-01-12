using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace legtobbszorMelegNapok_BartokPatrik_mndj3p_komplexBeadV2
{
    internal class Program
    {
        static int settlementCount, dayCount;
        static int[,] tempForecast;
        static int[] maxTempDays;
        static int hottestSettlementLength;
        static List<int> hottestSettlement;

        static void ReadData()
        {
            string[] line = Console.ReadLine().Split(' ');
            settlementCount = int.Parse(line[0]);
            dayCount = int.Parse(line[1]);
            tempForecast = new int[settlementCount, dayCount];
            for (int i = 0; i < settlementCount; i++)
            {
                line = Console.ReadLine().Split(' ');
                for (int j = 0; j < dayCount; j++)
                {
                    tempForecast[i, j] = int.Parse(line[j]);
                }
            }
        } 
        static int maxTempForDay(int j)
        {
            int maxert = tempForecast[0, j];
            int maxind = 0;
            for (int i = 1; i < settlementCount; i++)
            {
                if (tempForecast[i, j] > maxert)
                {
                    maxert = tempForecast[i, j];
                    maxind = i;
                }
            }
            return maxert;
        }

        static bool isMaxTempForDays(int i, int j)
        {
            if (tempForecast[i, j] == maxTempForDay(j))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        static int countMaxTempDays(int i)
        {
            int db = 0;
            for (int j = 0; j < dayCount; j++)
            {
                if (isMaxTempForDays(i, j))
                {
                    db++;
                }
            }
            return db;
        }

        static int maxHottestSettlement()
        {
            int maxert = countMaxTempDays(0);
            int maxind = 0;
            for (int i = 1; i < settlementCount; i++)
            {
                if (countMaxTempDays(i) > maxert)
                {
                    maxert = countMaxTempDays(i);
                    maxind = i;
                }
            }
            return maxert;
        }

        static void kivalogat(out int hottestSettlementLength, out List <int> hottestSettlement)
        {
            hottestSettlementLength = 0;
            hottestSettlement = new List<int>();

            for (int i = 0; i < settlementCount; i++)
            {
                if (maxHottestSettlement() == countMaxTempDays(i))
                {
                    hottestSettlement.Add(i+1);
                    hottestSettlementLength++;
                }
            }
        }

        static void Main(string[] args)
        {
            ReadData();
            kivalogat(out hottestSettlementLength, out hottestSettlement);
            Console.Write(hottestSettlementLength);
            for (int i = 0; i < hottestSettlementLength; i++)
            {
                Console.Write(" " + hottestSettlement[i]);
            }
        }
    }
}
