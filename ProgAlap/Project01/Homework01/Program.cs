using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework01
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int secondsBase;
            int hours;
            int minutes;
            int seconds;
            string output;
            int days = 0;
            do
            {
                Console.Write("Give the seconds since midnight: ");
                int.TryParse(Console.ReadLine(), out secondsBase);
            }
            while (secondsBase <= 1);

            if (secondsBase > 3600 *24)
            {
                days = secondsBase / (3600 * 24);
                secondsBase = secondsBase - days * (3600 * 24);
            }

            if (secondsBase >= 3600)
            {
                hours = secondsBase / 3600;
            }
            else
            {
                hours = 0;
            }
            seconds = secondsBase - hours * 3600;
            if (seconds >= 60)
            {
                minutes = seconds / 60;
            }
            else
            {
                minutes = 0;
            }
            seconds = seconds - minutes * 60;

            output = hours + ":";
            if (minutes < 10)
            {
                output = output + "0" + minutes + ":";
            }
            else
            {
                output = output + minutes + ":";
            }
            if (seconds <10)
            {
                output = output + "0" + seconds;
            }
            else
            {
                output = output + seconds;
            }

            Console.WriteLine("The exact time is: " + output);
            if (days > 0)
            {
                Console.WriteLine("The number of days are: " + days);
            }
            Console.ReadKey();
        }
    }
}