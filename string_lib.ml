include Base
include Core
include Core_kernel

let o = Fn.compose
let getc = fun s -> try Some ((String.get s 0), (String.drop_prefix s 1))
  with Invalid_argument _ -> None

let member l s = List.mem l s ~equal:String.equal

let isGraph c = Char.is_print(c) && (not (Char.is_whitespace(c)))

let isPunct c = isGraph(c) && (not (Char.is_alphanum c))

(*
PRE: s = front ++ back where front is the largest prefix st for all c in front, f c = true
  POST: returns (front, back)*)
let split_while f s = let (front, back) = List.split_while ~f:f (String.to_list s) in
  ((String.of_char_list front), (String.of_char_list back))

(*PRE: s = front ++ c1 ++ back for nonempty front 
POST: returns back*)
let dropl_char s c1 error = let optpair = String.lsplit2 s ~on:c1 in
  match optpair with None -> (raise (Failure error))
                      | Some (_, back) -> back

(*let sub_opt = fun s pos len -> try Some (sub s pos len) with
      Invalid_argument _ -> None

let tail_opt = fun s ->  Some (sub s 1 ((length s) - 1))
*)
     

                                                                  

