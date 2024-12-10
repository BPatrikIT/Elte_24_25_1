using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace lotto
{
    internal class Program
    {
        static int[] playedNumbers = new int[5];
        static int price;
        static int[] rewards = new int[4];
        static int[,] winningNumbers = new int[52, 5];
        static void read()
        {
            string[] temp = (Console.ReadLine().Split(' '));
            for (int i = 0; i < 5; i++)
            {
                playedNumbers[i] = int.Parse(temp[i]);
            }
            price = int.Parse(Console.ReadLine());
            string[] temp2 = (Console.ReadLine().Split(' '));
            for (int i = 0; i < 4; i++)
            {
                rewards[i] = int.Parse(temp2[i]);
            }
            for (int i = 0; i < 52; i++)
            {
                string[] temp3 = (Console.ReadLine().Split(' '));
                for (int j = 0; j < 5; j++)
                {
                    winningNumbers[i, j] = int.Parse(temp3[j]);
                }
            }

        }

        static int counting(int i)
        {
            int counter = 0;
            for (int j = 0; j < 5; j++)
            {
                for (int k = 0; k < 5; k++)
                {
                    if (winningNumbers[i, j] == playedNumbers[k])
                    {
                        counter++;
                    }
                }
            }
            return counter;
        }

        static void task1()
        {
            int ind = 0;
            int count = 0;
            int counter = 0;

            count = counting(0);

            for (int i = 1; i < 52; i++)
            {
                counter = counting(i);
                if (counter > count)
                {
                    counter = count;
                    ind = i;
                }
            }
            Console.WriteLine("#");
            Console.WriteLine(ind + 1);
        }

        static void task2()
        {
            int counter = 0;
            int winningSum = 0;
            for (int i = 0; i < 52; i++)
            {
                counter = counting(i);
                if (counter != 0)
                {
                    winningSum += rewards[counter - 1];
                }
            }
            Console.WriteLine("#");
            Console.WriteLine(winningSum);
        }
        static void Main(string[] args)
        {
            read();
            task1();
            task2();
            Console.ReadKey();
        }
    }
}
