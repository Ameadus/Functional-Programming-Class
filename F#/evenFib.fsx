let rec fib n = 
    match n with
    | 0 -> 0
    | n when n = 1 -> 1
    | n when n = 2 -> 1
    | _ -> fib (n-1) + fib (n-2)

let makeEvenList n = 
    Seq.initInfinite (fun i -> fib i)
        |> Seq.filter(fun i -> i % 2 = 0)
        |> Seq.take n

let getSumFibonacci n =
    Seq.sum (makeEvenList n)
    