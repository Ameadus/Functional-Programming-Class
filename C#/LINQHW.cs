//Alexander Meade C# HW1 
using System;
using System.Collections.Generic;
using System.Linq;
// Implement a function called myFilter that does the following:
// * Takes a sequence of integers with values from 0 to 100
// * First remove all multiples of 5 greater than 50
// * Then cube each number
// * Finally, remove any resulting integer that is even

public class Problem1
{
  public static IEnumerable<int> myFilter(IEnumerable<int> input)
  {
      IEnumerable<int> enumArray = input.Where(x => !((x > 50) && (x % 5 == 0))); //seq of ints from input and removes mult of 5 AND greater than 50 
      int[] array = enumArray.ToArray(); 
      for(int i = 0 ; i < array.Length ; i++)
      {
          array[i] = (array[i] * array[i] * array[i] ); //cube each value in array 
      }

      enumArray = array.AsEnumerable();
      enumArray = enumArray.Where( x => (x % 2 == 1)); //filter the evens 
      return enumArray;
  }


    public static void Main(string[] args)
    {
    Random rnd = new Random(5); // Important to seed with 5 for repeatability.
    var listForProblem =
        Enumerable.Range(1,100).Select(i => rnd.Next() % 101);
    var answer = Problem1.myFilter( listForProblem );
    foreach( int i in answer )
        {
            Console.WriteLine(i);
        }
    }
}