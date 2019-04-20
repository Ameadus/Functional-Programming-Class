using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

class MultithreadHW{
    static Thread[] thrd = new Thread[4];
    static int[] data = new int [10000000];
    static int enableMulti; //var to choose multithreading 0 is off 1 is on 

    static void Main(string[] args){
        DateTime dt = DateTime.Now;
        enableMulti = 0;
        if(enableMulti == 0){
          calcProc(0, data.Length);
          TimeSpan ss = DateTime.Now - dt;  
          Console.WriteLine("Sequentially, calc takes " + ss.TotalMilliseconds + " milliseconds to run.");
        }
        enableMulti = 1;
        if(enableMulti == 1){
        calcProc(0, data.Length);
        #if NOP //no idea i guess we need a wrapper but it doesnt need to do anything 
            int steps = data.Length / thrd.Length;
            for( int i=0; i<thrd.Length; i++ ){
              thrd[i] = new Thread(() => calcProc(i * steps, steps));
              thrd[i].Start();
             }
             for (int i = 0; i < thrd.Length; i++){
              thrd[i].Join();
             }
            #endif
            TimeSpan ts = DateTime.Now - dt;
            Console.WriteLine("Multithreaded, calc takes " + ts.TotalMilliseconds + " milliseconds to run.");
            }
        }

    static void calcProc(int index, int reps){
     for( int i=index; i<index+reps; i++ ){
        data[i] = (int)(Math.Cos(i)*Math.Sin(i)*Math.Tan(i)*Math.Asin(i)*Math.Acos(i)*Math.Atan(i));
        }
    }

}