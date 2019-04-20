//Alexander Meade
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Takes three sequences of numbers from 1 to 15
//Merge the list with members that adhere to the following requirements
//1. Any multiple of 3
//2. Is a member of all three lists

    public class TestProblem2 {
        public static IEnumerable<int> merge(IEnumerable<int> input1, IEnumerable<int> input2, IEnumerable<int> input3) {
            input1 = input1.Where(x => x % 3 == 0).Distinct(); //Distinct removes any repeating multiples of 3 so that there will only be 1 value per multiple 
            input2 = input2.Where(x => x % 3 == 0).Distinct();
            input3 = input3.Where(x => x % 3 == 0).Distinct();
            //Intersect set intersection of the objects whats in both 3 and 2 into set A then whats in both set A and 1 into the final merged set 
            IEnumerable<int> mergedInput = input1.Intersect((input2.Intersect(input3))); 

            return mergedInput;
        }

        public static void Main(string[] args) {
            Random rnd = new Random(); //NOTE we are not guarnteed a mutiple of 3 each time and some executions may be blank
            var list1 = Enumerable.Range(1, 10).Select(i => (rnd.Next() % 15) + 1); //generate 0-14 shift up by 1 to make 1-15 the range 
            var list2 = Enumerable.Range(1, 10).Select(i => (rnd.Next() % 15) + 1);
            var list3 = Enumerable.Range(1, 10).Select(i => (rnd.Next() % 15) + 1);
            var answer = merge(list1, list2, list3);
            foreach (int i in answer) {
                Console.WriteLine(i);
            }
        }
    }
