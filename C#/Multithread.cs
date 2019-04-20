//Alexander Meade Multithreading HW using parallel for loop 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

class MultithreadHW{
    static double[] data = new double[10000000]; //cant work as int got typecasting error
    static int enableMulti; //var to choose multithreading 0 is off 1 is on 

    static public void calc(int startingIndex, int reps){
        var sysTime = System.Diagnostics.Stopwatch.StartNew(); // start a system timer 

        if(enableMulti == 0){
            for( int i = startingIndex; i < (startingIndex + reps); i++ ){
                data[i] =Math.Atan(i) * Math.Acos(i) * Math.Cos(i) * Math.Sin(i);
            }
            sysTime.Stop(); //stop counting after last iteration 
            var timeMS = sysTime.ElapsedMilliseconds; //convert to miliseconds
            Console.WriteLine("Sequentially, calc takes " + timeMS + " milliseconds to run.");
        }

        else if(enableMulti == 1){
            Parallel.For(startingIndex, startingIndex + reps, i => 
            {data[i] =Math.Atan(i) * Math.Acos(i) * Math.Cos(i) * Math.Sin(i);}); //use parallel for to divide across multi threads 
            sysTime.Stop(); //stop counting after last iteration 
            var timeMS = sysTime.ElapsedMilliseconds; //convert to miliseconds
            Console.WriteLine("Multithreaded, calc takes " + timeMS + " milliseconds to run.");
        }
    }

    static void Main(string[] args){
        enableMulti = 0; 
        calc(0,data.Length);//without multithread
        enableMulti = 1; 
        calc(0,data.Length);//with multithread
    }




}