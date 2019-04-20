let test1question1 x =
  let everyNth n seq =
    seq |> Seq.mapi (fun i el -> el, i)              // Add index to element
        |> Seq.filter (fun (el, i) -> i % n = 0)     // Take every nth element
        |> Seq.map fst                               // Drop index from the result

  let primes =
    let rec isPrime (n:bigint) =
      let rec prime (n) (i:bigint) =
        match n with
          | n when n <= 1I    -> false
          | n when n = 2I     -> true
          | n when n % i = 0I -> false
          | n when n < i * i  -> true
          | _                 -> prime n (i + 1I)

      prime n 2I

    Seq.initInfinite (fun x -> x + 2)
    |> Seq.map (fun i -> bigint(i))
    |> Seq.filter isPrime
    |> Seq.map (fun i -> int(i))

  Seq.take (x*2) primes |> everyNth 2 |> Seq.toList

let test1question3 n =
  let multipleOfFive n = n % 5 = 0
  let factors n = [for i in 1..n do if n % i = 0 then yield i]
  let exactlyThreeFactors n = (Seq.length(factors n)) = 3

  [for i in 1..n do if multipleOfFive i || exactlyThreeFactors i then yield i]


let projectEuler1 n = 
    let multof5 n = n % 5 = 0 
    let multof3 n = n % 3 = 0
    
    [for i in 1..n do if (multof3 i || multof5 i) then yield i] |> List.sum


// fib generator. use Seq.take to take a number of fib numbers
let fibSeq = Seq.unfold (fun (a, b) -> Some(a + b, (b, a + b))) (0, 1)

let test1question2 n =
  let fibSeq = Seq.unfold (fun (a, b) -> Some(a + b, (b, a + b))) (0, 1)

  let rec filter f list =
      match list with
      | x::xs when f x -> x::(filter f xs)
      | _::xs -> filter f xs
      | [] -> []

  Seq.takeWhile (fun x -> x <= n) fibSeq
  |> Seq.toList
  |> filter (fun n -> n % 10 = 3)


let everyNth n seq = 
    seq |> Seq.mapi (fun i el -> el, i)              // Add index to element
        |> Seq.filter (fun (el, i) -> i % n = n - 1) // Take every nth element
        |> Seq.map fst                               // Drop index from the result

// Helpful utility function(s) to check if a number is a Fibonacci number:
let is_perfect_square n =
    let rec binary_search low high =
        let mid = low + ((high - low) / 2)
        let midSquare = mid * mid
        if low > high then false
        elif n = midSquare then true
        else if n < midSquare then binary_search low (mid - 1)
        else binary_search (mid + 1) high

    binary_search 1 n

let primeGenerator =
    let rec isPrime (n:bigint) =
      let rec prime (n) (i:bigint) =
        match n with
          | n when n <= 1I    -> false
          | n when n = 2I     -> true
          | n when n % i = 0I -> false
          | n when n < i * i  -> true
          | _                 -> prime n (i + 1I)

      // isPrime code (starts prime check)
      prime n 2I

    // primeGenerator code (generates an infinite number of primes)
    Seq.initInfinite (fun x -> bigint(x + 2))
    |> Seq.filter isPrime
    |> Seq.map (fun i -> int(i))

//change the number on = to change 1 digit value 
//another way of doing problem 2 
let exampleProblem n =    
    let rec fib n =
        match n with
        | 0 -> 0 
        | 1 | 2 -> 1 
        | _ -> fib(n-1) + fib(n-2)
    
    
    Seq.init n (fun i -> fib(i))
    |> Seq.takeWhile (fun x -> x <= n) 
    |> Seq.filter(fun i -> i % 10 = 3) 
    |> Seq.toList

let rec TowerOfHanoi fromPole destPole tempPole disks =
    if disks > 0 then
        TowerOfHanoi fromPole tempPole destPole (disks - 1)
        printf "Moving from %c to %c" fromPole destPole
        TowerOfHanoi tempPole destPole fromPole (disks - 1)
        
TowerOfHanoi '1' '2' '3' 4




//project euler 2 idk why it makes me do it like this 
let fibonacciSeq = Seq.unfold (fun (current, next) -> Some(current, (next, current + next))) (0, 1)
 
let fibTotal =
    fibonacciSeq
    |> Seq.takeWhile (fun n -> n < 4000000)
    |> Seq.filter (fun n -> n % 2 = 0)
    |> Seq.sum


//dont matter whatu call lmao 
open System.Linq
 
 
let projectEuler4  =
    let isPalindromic n =
        let charArray = n.ToString().ToCharArray()
        let revCharArray = Array.rev charArray
        charArray.SequenceEqual(revCharArray)
 
    let numbers = [100..999]
    let products = numbers |> List.collect (fun x -> numbers |> List.map (fun y -> x * y))
    products |> Seq.filter isPalindromic |> Seq.max


// Helpful utility function(s) to check if a number is a Fibonacci number:
let isFib n =
    if is_perfect_square(5*n*n + 4) then true
    elif is_perfect_square(5*n*n - 4) then true
    else
        false


open System
open System.Collections

let primes max = 
    let array = new BitArray(max, true);
    let lastp = Math.Sqrt(float max) |> int
    for p in 2..lastp+1 do
        if array.Get(p) then
            for pm in p*2..p..max-1 do
                array.Set(pm, false);
    seq { for i in 2..max-1 do if array.Get(i) then yield i }
    |> Seq.toList  