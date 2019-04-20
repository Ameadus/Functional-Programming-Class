//Alexander Meade F# Caeser Cipher 

//frequencies for the crack func 
let table = [8.2; 1.5; 2.8; 4.3; 12.7; 2.2; 2.0; 6.1; 7.0;
         0.2; 0.8; 4.0; 2.4; 6.7; 7.5; 1.9; 0.1; 6.0;
         6.3; 9.1; 2.8; 1.0; 2.4; 0.2; 2.0; 0.1]
//function and its helper for a drop operation
// -- | Auxiliary recursive drop function
let rec drop' i l1 p l2 =
    if List.length l2 = List.length l1 - 1 then l2
    else 
        let p = if p = i then p+1  else p 
        drop' i l1 (p+1) (List.append l2 [(List.nth l1 p)])

//function and helper for a take op from list 
let take n items =
    let rec take' acc = function
      | 0, _ -> List.rev acc
      | n, h::t -> take' (h::acc) (n-1, t)
    take' [] (n, items)

// -- | Removes the the nth element from list
let drop i l =
    drop' i l 0 [] 

//idk if this will prevent uppercase 
let let2nat (str:char) = str |> int 
//again idk if this will bound uppers 
let nat2let str = str |> char 

//shift operation 
let shift (x:int) str =
    if let2nat str > 25 || let2nat (str) < 0 then str
    else if let2nat (str) + x <= 25 then nat2let ((let2nat (str) + x) % 26)
    else (nat2let (let2nat str + x))
    
let encode shiftStr = shift shiftStr

let decode shiftStr = shift (-shiftStr)



// let lowers (str) = 
//     if (let2nat str <= 25) && (let2nat str >= 0) then String.length (str:string)
//     else 0 
    
// let count =

//percentage val 
let percent x y = (x/y) * 100.

let chisq [|x|] [|y|] = Array.sum[|( ( (x - y)**2.) / y) |] 
 //(os,es) <- List.zip x y

//@ means concat list 
let rotate (x:int) str = (drop x str) @ (take x str)

//let position [|x|] str = List.head(List.findIndex (x str))