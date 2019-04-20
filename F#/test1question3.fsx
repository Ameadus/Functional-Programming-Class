//write a function that takes a parameter n and makes a list of all numbers from one to n that are either
//divisble by 5 or divisible by exactly 3 numbers.
let findDiv n = 
    Seq.length(Seq.init n (fun i -> i+1)
    |> Seq.filter(fun i -> n % i = 0)
    )

let makeList n = 
    Seq.init n (fun i -> i+1)
    |> Seq.filter(fun x -> x % 5 = 0 || findDiv x = 3)

