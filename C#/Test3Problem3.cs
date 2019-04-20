using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exam3part3
{
    class Program
    {
        static double[] data = new double[10000000];
        static int ran = 0;

        static public void calc(int startingIndex, int reps)
        {
            var watch = System.Diagnostics.Stopwatch.StartNew();
            if (ran == 0)
            {
                for (int i = startingIndex; i < (startingIndex + reps); i++)
                {
                    data[i] = Math.Atan(i) * Math.Acos(i) * Math.Cos(i) * Math.Sin(i);
                }
                watch.Stop();
                var time = watch.ElapsedMilliseconds;
                Console.WriteLine("Sequentially, calc takes " + time + " milliseconds to run.");
            }
            else if (ran == 1)
            {
                Parallel.For(startingIndex, startingIndex + reps, i =>
                {
                    data[i] = Math.Atan(i) * Math.Acos(i) * Math.Cos(i) * Math.Sin(i);
                });
                watch.Stop();
                var time = watch.ElapsedMilliseconds;
                Console.WriteLine("Multithreaded, calc takes " + time + " milliseconds to run.");
            }
        }

        static void Main(string[] args)
        {
            calc(0, data.Length);
            ran = 1;
            calc(0, data.Length);
            Console.ReadLine();
        }
    }
}
