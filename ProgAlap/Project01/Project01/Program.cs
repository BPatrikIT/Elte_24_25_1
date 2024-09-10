namespace Project01
{
    internal class Program
    {
        static void Main(string[] args)
        {
            double a;
            double b;
            double t;

            Console.WriteLine("Adja meg a négyzet két oldalát:");

            do
            {
                Console.Write("a: ");
                double.TryParse(Console.ReadLine(), out a);
                Console.Write("b: ");
                double.TryParse(Console.ReadLine(), out b);
                if (a <= 0 || b <= 0)
                {
                    Console.WriteLine("Az oldalaknak nullánál nagyobb számoknak kell lenniük!");
                }
            } while (a <= 0 || b <= 0);
            t = a * b;

            Console.WriteLine("A négyzet területe: " + t + " cm2");
        }
    }
}