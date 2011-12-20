structure Type :> Type =
struct

(* Use "raise Error (message,position)" for error messages *)
exception Error of string*(int*int)
                   
type pos = int*int

datatype Type = Int
              | Char
              | Ref of Type
(* testing functions*)
(*---------------------------------------------------------------------------------------------------------*)
(*
fun printC [] = "\n"
  | printC (t::ts) = "  " ^ Int.toString(t) ^ (printC ts) 
                     
(*fun pr l = (TextIO.output(TextIO.stdOut, "  Returns: \n" ^ (printC l)))*)
fun pr l = (TextIO.output(TextIO.stdOut, "  Returns: \n" ^ "  " ^ (printC l)))

fun printV [] = (TextIO.output(TextIO.stdOut, "    *\n") ; ()) 
  | printV ((s, t)::ds) = case t of
                            Int => ((TextIO.output(TextIO.stdOut, "    vtable: " ^ s ^ " : of Int\n") ; ()) ; printV ds)
                          | Char => ((TextIO.output(TextIO.stdOut,  "    vtable: " ^ s ^ " : of Char\n") ; ()) ; printV ds)
                          | Ref Int => ((TextIO.output(TextIO.stdOut,  "    vtable: " ^ s ^ " : of Ref Int\n") ; ()) ; printV ds)
                          | Ref Char => ((TextIO.output(TextIO.stdOut,  "    vtable: " ^ s ^ " : of Ref Char\n") ; ()) ; printV ds)

fun getPos (p1, p2) = "(" ^ (Int.toString p1) ^ ", " ^ (Int.toString p2) ^ ")"

*)
(*---------------------------------------------------------------------------------------------------------*)
fun printV [] = (TextIO.output(TextIO.stdOut, "    *\n") ; ()) 
  | printV ((s, t)::ds) = case t of
                            Int => ((TextIO.output(TextIO.stdOut, "    vtable: " ^ s ^ " : of Int\n") ; ()) ; printV ds)
                          | Char => ((TextIO.output(TextIO.stdOut,  "    vtable: " ^ s ^ " : of Char\n") ; ()) ; printV ds)
                          | Ref Int => ((TextIO.output(TextIO.stdOut,  "    vtable: " ^ s ^ " : of Ref Int\n") ; ()) ; printV ds)
                          | Ref Char => ((TextIO.output(TextIO.stdOut,  "    vtable: " ^ s ^ " : of Ref Char\n") ; ()) ; printV ds)

fun convertType (S100.Int _) = Int
  | convertType (S100.Char _) = Char

fun promoteType (Int) = Int
  | promoteType (Char) = Int

fun getName (S100.Val (f,p)) = f
  | getName (S100.Ref (f, p)) = f

fun getType t (S100.Val (f,p)) = convertType t
  | getType t (S100.Ref (f, p)) = Ref (convertType t)

(* lookup function for symbol table as list of (name,value) pairs *)
fun lookup x []
  = NONE
  | lookup x ((y,v)::table)
    = if x=y then SOME v else lookup x table

fun checkExp e vtable ftable =
    case e of
      S100.NumConst _ => Int
    | S100.CharConst _ => Char
    | S100.StringConst _ => Ref Char
    | S100.LV lv => checkLval lv vtable ftable
    | S100.Assign (lv,e1,p) =>
      let
	val t1 = checkLval lv vtable ftable
	val t2 = promoteType (checkExp e1 vtable ftable)
      in 
        case (t1, t2) of
          (Int, Int) => Int
        | (Char, Int) => Int
        | (Int, Char) => Int
        | (Char, Char) => Int
        | (Ref Char, Ref Char) => Ref Char
        | (Ref Int, Ref Int) => Ref Int
        | (_, _) => raise Error ("Type mismatch in assignment",p)
      end
         
    | S100.Plus (e1,e2,p) =>
      (case (checkExp e1 vtable ftable,
	     checkExp e2 vtable ftable) of
	 (Int, Int) => Int
       | (Char, Int) => Int
       | (Int, Char) => Int
       | (Char, Char) => Int
       | (Int, Ref Char) => Ref Char
       | (Ref Char, Int) => Ref Char
       | (Int, Ref Int) =>  Ref Int
       | (Ref Int, Int) => Ref Int
       | (_, _) => raise Error ("Type error",p)
      )
    | S100.Minus (e1,e2,p) =>
      (case (checkExp e1 vtable ftable,
	     checkExp e2 vtable ftable) of
	 (Int, Int) => Int
       | (Ref Int, Int) => Ref Int
       | (Ref Char, Int) => Ref Char
       | (Ref Int, Ref Int) => Int
       | (Ref Char, Ref Char) => Int
       | (Int, Ref Char) => raise Error ("Type error",p)
       | (Int, Ref Int) => raise Error ("Type error",p)
       | (_, _) => raise Error ("Type error",p)
      )

    | S100.Less (e1,e2,p) =>
      if checkExp e1 vtable ftable = checkExp e2 vtable ftable
      then Int else raise Error ("Can't compare different types",p)
    | S100.Equal (e1, e2, p) => 
       if checkExp e1 vtable ftable = checkExp e2 vtable ftable
      then Int else raise Error ("Can't compare different types",p)
    | S100.Call (f,es,p) =>
      (case lookup f ftable of
	 NONE => raise Error ("Unknown function: "^f,p)
       | SOME (parT,resultT) =>
	 let
	   val argT = List.map (fn e => checkExp e vtable ftable) es
	 in
	   if parT = argT then resultT
	   else raise Error ("Arguments don't match declaration of "^f, p)
	 end)

and checkLval lv vtable ftable =    
    case lv of
      S100.Var (x,p) =>
      (case lookup x vtable of
	 SOME t => t
       | NONE => raise Error ("Unknown variable: "^x,p))
    | S100.Deref (x, p) => 
      (case lookup x vtable of
	 SOME (Ref t) => t
       | SOME t =>  raise Error ("Not a reference type: "^x,p)
       | NONE => raise Error ("Unknown variable: "^x,p))
    | S100.Lookup (x, e, p) =>
      if checkExp e vtable ftable = Int then
        (case lookup x vtable of
	 SOME (Ref t) => t
       | SOME t => raise Error ("Not a reference type: "^x,p)
       | NONE => raise Error ("Unknown variable: "^x,p))
       else raise Error ("Index not int", p)

fun extend [] _ vtable =  (printV vtable ; vtable)                    
  | extend (S100.Val (x,p)::sids) t vtable =
    (case lookup x vtable of
       NONE => extend sids t ((x,t)::vtable)
     | SOME _ => raise Error ("Double declaration of "^x,p))
  | extend (S100.Ref (x,p)::sids) t vtable =
     (case lookup x vtable of
        NONE => extend sids (Ref t) ((x, Ref t)::vtable)
      | SOME _ => raise Error ("Double declaration of "^x,p))


fun checkDecs [] = []
  | checkDecs ((t,sids)::ds) =
    extend (List.rev sids) (convertType t) (checkDecs ds)


fun checkStat s _ _ _ [] p =  raise Error ("Unreachable code in block", p)
  | checkStat s vtable ftable t (m::ms) p =
    case s of
      S100.EX e => (checkExp e vtable ftable; (m::ms))
    | S100.If (e,s1,p) =>
      if checkExp e vtable ftable = Int
      then 
        let 
          val mTable = (0::m::ms)
          val eval = checkStat s1 vtable ftable t mTable p
        in
          if eval = mTable then (m::ms) else eval
        end

      else raise Error ("Condition should be integer", p)
    | S100.IfElse (e,s1,s2,p) =>
      if checkExp e vtable ftable = Int
      then
        let
          val mTable = (0::m::ms)
          val eval =  checkStat s2 vtable ftable t (checkStat s1 vtable ftable t mTable p) p
        in
          if eval = mTable then (m::ms) else eval
         
        end
      else raise Error ("Condition should be integer", p)
    | S100.While (e, s, p) =>  
      if checkExp e vtable ftable = Int
      then checkStat s vtable ftable t (m::ms) p 
      else raise Error ("Condition should be integer", p)
    | S100.Return (e,p) => 
      let 
        val et = checkExp e vtable ftable
      in 
        if t et 
        then  ms  
        else raise Error ("Return type mismatch", p)
      end
    | S100.Block (ds, ss, p) => 
      let 
        val vtable' = (checkDecs ds) @ vtable 
        fun check [] m _ = m 
          | check (s::ss) m p = check ss ((checkStat s vtable' ftable t m p)) p
      in
        check ss (m::ms) p
      end
           
fun checkReturn [] _ _ = ()
  | checkReturn _ sf p = raise Error ("Function '" ^ (getName sf) ^  "' should always return a value" , p)
                             
fun checkFunDec (t,sf,decs,body,p) ftable =
    let val rl = checkStat body (checkDecs decs) ftable ((fn ft => fn rt => ft = rt ) (getType t sf)) [0] p
    in
      checkReturn rl sf p
    (*(pr (a) ; ())*)
    end

    
fun getFuns [] ftable = ftable
  | getFuns ((t,sf,decs,_,p)::fs) ftable =
    case lookup (getName sf) ftable of
      NONE =>
      let
        val parT = (List.map (#2) (checkDecs decs))
	val resultT = getType t sf
      in
        getFuns fs ((getName sf, (parT,resultT)) :: ftable)
      end
    | SOME _ => raise Error ("Redeclaration of "^ getName sf,p)
 
                      
fun checkProg fs =
    let
      val ftable = getFuns fs [("getint",([],Int)),
			       ("putint",([Int],Int))]
    in
      List.app (fn f => checkFunDec f ftable) fs;
      case lookup "main" ftable of
	NONE => raise Error ("No main function found",(0,0))
      | SOME ([],Int) => ()
      | _ => raise Error ("main function has illegal type",(0,0))
    end

end
