// Exercise 4
using System;
using System.Linq;
using System.Collections.Generic;

// Calculates the n-th degree of the polynomial
//namespace LINQExercise4
{
    class LINQExercise4
    {
        public static int polySum(int x, IEnumerable<int> input) {

            int counter = 0;

            var result = input.Reverse().Aggregate(counter, (p, q)
            => p + q * (int)Math.Pow(x, counter++));

            return result;
        }
        static void Main(string[] args)
        {
            int exponentInput = 2;
            var input = new[] {3, 4, 5};

            int total = polySum(exponentInput, input);

            Console.WriteLine(total);
        }
    }
}
