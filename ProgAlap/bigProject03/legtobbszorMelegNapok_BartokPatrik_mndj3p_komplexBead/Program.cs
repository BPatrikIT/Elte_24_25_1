using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace legtobbszorMelegNapok_BartokPatrik_mndj3p_komplexBead
{
    internal class Program
    {
        static int settlementCount, dayCount;
        static int[,] tempForecast;
        static int[] maxTempDays;

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

        static void maxTempDay(int j) 
        {
            List<int> maxTempDaysIndex = new List<int>();
            int maxTempDay = tempForecast[0, j];
            maxTempDaysIndex.Add(0);
            for (int i = 1; i < settlementCount; i++)
            {
                if (tempForecast[i, j] > maxTempDay)
                {
                    maxTempDaysIndex.Clear();
                    maxTempDay = tempForecast[i, j];
                    maxTempDaysIndex.Add(i);
                }
                else if (tempForecast[i, j] == maxTempDay)
                {
                    maxTempDaysIndex.Add(i);
                }
            }

            for (int i = 0; i < maxTempDaysIndex.Count(); i++)
            {
                maxTempDays[maxTempDaysIndex[i]]++;
            }
        }

        static void maxTempDayAll()
        {
            maxTempDays = new int[settlementCount];

            for (int j = 0; j < dayCount; j++)
            {
                maxTempDay(j);
            }
        }

        static void findMaxSettlement()
        {
            int max = maxTempDays[0];
            for (int i = 1; i < maxTempDays.Length; i++)
            {
                if (maxTempDays[i] > max)
                {
                    max = maxTempDays[i];
                }
            }
            List<int> hottestSettlement = new List<int>();
            for (int i = 0; i < maxTempDays.Length; i++)
            {
                if (maxTempDays[i] == max)
                {
                    hottestSettlement.Add(i + 1);
                }
            }
            PrintResult(hottestSettlement);
        }

        static void PrintResult(List<int> hottestSettlement)
        {
            int hottestSettlementLength = hottestSettlement.Count();
            Console.Write(hottestSettlementLength);
            foreach (int i in hottestSettlement)
            {
                Console.Write(" " + i);
            }
        }
        static void Main(string[] args)
        {
            ReadData();
            maxTempDayAll();
            findMaxSettlement();
        }
    }
}