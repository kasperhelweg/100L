(* Compiler for 100 *)
(* Compile by mosmlc -c Compiler.sml *)

structure Compiler :> Compiler =
struct

(* Use "raise Error (message,position)" for error messages *)
exception Error of string*(int*int)
		   
(* Name generator.  Call with, e.g., t1 = "tmp"^newName () *)
val counter = ref 0
	      
fun newName () = (counter := !counter + 1;
                  "_" ^ Int.toString (!counter)^ "_")
		 
(* Number to text with spim-compatible sign symbol *)
fun makeConst n = if n>=0 then Int.toString n
                  else "-" ^ Int.toString (~n)
		       
fun lookup x [] = NONE
  | lookup x ((y,v)::table) = if x=y then SOME v else lookup x table
						      
fun isIn x [] = false
  | isIn x (y::ys) = x=y orelse isIn x ys
				
fun convertType (S100.Int _) = Type.Int
  | convertType (S100.Char _) = Type.Char
				
				

fun extend [] _ vtable = vtable
  | extend (S100.Val (x,p)::sids) t vtable = let
	val y = newName ()
    in
	(case lookup x vtable of
	     NONE => extend sids t ((x,(t,y^x))::vtable)
	   | SOME _ => raise Error ("Double declaration of "^x,p))
    end
  | extend (S100.Ref (x,p)::sids) t vtable =
    let
	val y = newName ()
    in
	(case lookup x vtable of
	     NONE => extend sids t ((x,(t,y^x))::vtable)
	   | SOME _ => raise Error ("Double declaration of "^x,p))
    end
    
fun extendDecs [] = []
  | extendDecs ((t,sids)::ds) =
    extend (List.rev sids) (convertType t) (extendDecs ds)
    
(* link register *)
val RA = "31"
(* Register for stack pointer *)
val SP = "29"
(* Register for heap pointer *)
val HP = "28"
(* Register for frame pointer *)
val FP = "25"
	 
	 



(* Suggested register division *)
val maxCaller = 15   (* highest caller-saves register *)
val maxReg = 24      (* highest allocatable register *)
	     
datatype Location = Reg of string (* value is in register *)
		  | Mem of string * string
(* Value is in memory. value * register where offset is*)
			   
(* compile expression *)
fun compileExp e vtable ftable place =
    case e of
	S100.NumConst (n,pos) =>
        if n<32768 then
	    (Type.Int,[Mips.LI (place, makeConst n)])
	else
	    (Type.Int,
	     [Mips.LUI (place, makeConst (n div 65536)),
	      Mips.ORI (place, place, makeConst (n mod 65536))])
      | S100.CharConst (c, pos) =>
	(Type.Char,[Mips.LI (place, Int.toString(ord(c)))])	

	
      | S100.StringConst (s, pos) =>
	let
	    val CharList = String.explode(s)
	    val l = length(CharList)
	    val t1 = "_string_"^newName() 
	    fun insertString [] t = []
	      | insertString (c::cs) t = 
		[Mips.ADDI(t1,"0",makeConst(ord(c))),
		 Mips.SB(t1,t,"0"), 
		 Mips.ADDI(t,t,makeConst(1))] 
		@ (insertString cs t)
		
	in
	    (Type.Ref (Type.Char), [Mips.LI("2", makeConst(l)),
				    Mips.JAL("balloc", ["2"]),
				    Mips.MOVE(place, "2")]
				   @ (insertString CharList "2"))
	end
        
        
      | S100.LV lval =>
        let
	    val (code,ty,loc) = compileLval lval vtable ftable
	in
	    case (ty,loc) of
		(Type.Int, Reg x) =>
		(Type.Int,
		 code @ [Mips.MOVE (place,x)])
	      | (Type.Char, Reg x) =>
		(Type.Char,
		 code @ [Mips.MOVE (place,x)])
	      | (Type.Ref (Type.Int) , Mem(y,i)) =>
		let
		    val t1 = "_lookup1_"^newName()
		    val t2 = "_lookup2_"^newName()
		in
		    (Type.Ref (Type.Int) , 
		     code @ [Mips.LI(t1, y),
			     Mips.ADD(t2,t1,i),
			     Mips.ADD(t2,t2,i),
			     Mips.ADD(t2,t2,i),
			     Mips.ADD(t2,t2,i),
			     Mips.LW(place,t2,"0")])
		end
	      | (Type.Ref (Type.Char), Mem(y,i)) =>
		let
		    val t1 = "_lookup1_"^newName()
		    val t2 = "_lookup2_"^newName()
		in
		    (Type.Ref (Type.Char), 
		     code @ [Mips.LI(t1, y),
			     Mips.ADD(t2,t1,i),
			     Mips.LW(place,t2,"0")])
		end
	      | (_, _) =>
		raise Error ("SOMETHING WENT WRONG!",(0,0))

	end

      (* GAMMEL LVAL
		let
		    val (code,ty,loc) = compileLval lval vtable ftable
		in
		    case (ty,loc) of
			(Type.Int, Reg x) =>
			(Type.Int,
			 code @ [Mips.MOVE (place,x)])
		end*)
      | S100.Assign (lval,e,p) =>
	let
            val t = "_assign_"^newName()
	    val (code0,ty,loc) = compileLval lval vtable ftable
	    val (_,code1) = compileExp e vtable ftable t
	in
	    case (ty,loc) of
		(Type.Int, Reg x) =>
		(Type.Int,
		 code0 @ code1 @ [Mips.MOVE (x,t), Mips.MOVE (place,t)])
	      | (Type.Char, Reg x) =>
		(Type.Char,
		 code0 @ code1 @ [Mips.MOVE (x,t), Mips.MOVE (place,t)])
	      | (Type.Ref (Type.Int), Mem(y,i)) =>
		let
		    val t1 = "_lookup1_"^newName()
		    val t2 = "_lookup2_"^newName()
		in
		    (Type.Ref (Type.Int), 
		     code0 @ code1 @ [Mips.LI(t1, y),
				      Mips.ADD(t2,t1,i),
				      Mips.ADD(t2,t2,i),
				      Mips.ADD(t2,t2,i),
				      Mips.ADD(t2,t2,i),
				      Mips.SW(t,t2,"0")])
		end
	      | (Type.Ref (Type.Char), Mem(y,i)) =>
		let
		    val t1 = "_lookup1_"^newName()
		    val t2 = "_lookup2_"^newName()
		in
		    (Type.Ref (Type.Char), 
		     code0 @ code1 @ [Mips.LI(t1, y),
				      Mips.ADD(t2,t1,i),
				      Mips.SB(t,t2,"0")])
		end
	      | _ => raise Error ("Bad Expression",p)
	end  

      (* GAMMEL ASSIGN
		let
		    val t = "_assign_"^newName()
		    val (code0,ty,loc) = compileLval lval vtable ftable
		    val (_,code1) = compileExp e vtable ftable t
		in
		    case (ty,loc) of
			(Type.Int, Reg x) =>
			(Type.Int,
			 code0 @ code1 @ [Mips.MOVE (x,t), Mips.MOVE (place,t)])
		end*)
      | S100.Plus (e1,e2,pos) =>
        let
	    val t1 = "_plus1_"^newName()
	    val t2 = "_plus2_"^newName()
            val (ty1,code1) = compileExp e1 vtable ftable t1
            val (ty2,code2) = compileExp e2 vtable ftable t2
	in
	    case (ty1,ty2) of
		(Type.Int, Type.Int) =>
		(Type.Int,
		 code1 @ code2 @ [Mips.ADD (place,t1,t2)])
	end
      | S100.Minus (e1,e2,pos) =>
        let
	    val t1 = "_minus1_"^newName()
	    val t2 = "_minus2_"^newName()
            val (ty1,code1) = compileExp e1 vtable ftable t1
            val (ty2,code2) = compileExp e2 vtable ftable t2
	in
	    case (ty1,ty2) of
		(Type.Int, Type.Int) =>
		(Type.Int,
		 code1 @ code2 @ [Mips.SUB (place,t1,t2)])
	end
      | S100.Equal (e1,e2,pos) =>
	let
	    val t1 ="_equal1_"^newName()
	    val t2 ="_equal2_"^newName()
            val (_,code1) = compileExp e1 vtable ftable t1
            val (_,code2) = compileExp e2 vtable ftable t2
	in
	    (Type.Int, code1 @ code2 @ [Mips.BEQ(t1,t2,"yes"), 
					Mips.LI(place,"0"),
					Mips.J("skip"),
					Mips.LABEL("yes"),
					Mips.LI(place,"1"),
					Mips.LABEL("skip")])
	end	
      | S100.Less (e1,e2,pos) =>
        let
	    val t1 = "_less1_"^newName()
	    val t2 = "_less2_"^newName()
            val (_,code1) = compileExp e1 vtable ftable t1
            val (_,code2) = compileExp e2 vtable ftable t2
	in
	    (Type.Int, code1 @ code2 @ [Mips.SLT (place,t1,t2)])
	end
      | S100.Call (f,es,pos) =>
	let
	    val rTy = case lookup f ftable of
			  SOME (_,t) => t
			| NONE => raise Error ("unknown function "^f,pos)
	    val (code1,args) = compileExps es vtable ftable
	    fun moveArgs [] r = ([],[],0)
	      | moveArgs (arg::args) r =
	        let
		    val (code,parRegs,stackSpace) = moveArgs args (r+1)
		    val rname = makeConst r
		in
	            if r<=maxCaller then
			(Mips.MOVE (rname,arg) :: code,
			 rname :: parRegs,
			 stackSpace)
		    else
			(Mips.SW (arg,SP,makeConst stackSpace) :: code,
			 parRegs,
			 stackSpace + 4)
		end
	    val (moveCode, parRegs, stackSpace) = moveArgs args 2
	in
	    (rTy,
	     if stackSpace>0 then
		 [Mips.ADDI (SP,SP,makeConst (~stackSpace))]
		 @ code1 @ moveCode @
		 [Mips.JAL (f, parRegs),
		  Mips.MOVE (place,"2"),
		  Mips.ADDI (SP,SP,makeConst stackSpace)]
	     else
		 code1 @ moveCode @
		 [Mips.JAL (f, parRegs),
		  Mips.MOVE (place,"2")])
	end
	
and compileExps [] vtable ftable = ([], [])
  | compileExps (e::es) vtable ftable =
    let
	val t1 = "_exps_"^newName()
        val (_,code1) = compileExp e vtable ftable t1
	val (code2, regs) = compileExps es vtable ftable
    in
	(code1 @ code2, t1 :: regs)
    end
    
and compileLval lval vtable ftable =
    case lval of
	S100.Var (x,p) =>
        (case lookup x vtable of
	     SOME (ty,y) => ([],ty,Reg y)
	   | NONE => raise Error ("Unknown variable "^x,p))
      | S100.Deref (s, pos) =>
	(case lookup s vtable of
	     SOME (Ref ty,y) => ([], ty, Mem(y,"0"))
	   | SOME (ty, y) => raise Error ("Variable is not a reference "^s,pos))
	   | NONE => raise Error ("Unknown variable "^s,pos))
      | S100.Lookup (s,e,pos) =>
	let
	    val t1 = "_Lval_"^newName()
            val (_,code1) = compileExp e vtable ftable t1
	in
	    (case lookup s vtable of
		 SOME (Ref ty,y) => (code1, ty, Mem(y,t1))
	       | SOME (ty, y) => raise Error ("Variable is not a reference "^s,pos))
	       | NONE => raise Error ("Unknown variable "^s,pos))
	end
	
fun compileStat s vtable ftable exitLabel =
    case s of
	S100.EX e => #2 (compileExp e vtable ftable "0")
      | S100.If (e,s1,p) =>
        let
	    val t = "_if_"^newName()
	    val l1 = "_endif_"^newName()
	    val (_,code0) = compileExp e vtable ftable t
	    val code1 = compileStat s1 vtable ftable exitLabel
	in
	    code0 @ [Mips.BEQ (t,"0",l1)] @ code1 @ [Mips.LABEL l1]
	end
      | S100.IfElse (e,s1,s2,p) =>
        let
	    val t = "_if_"^newName()
	    val l1 = "_else_"^newName()
	    val l2 = "_endif_"^newName()
	    val (_,code0) = compileExp e vtable ftable t
	    val code1 = compileStat s1 vtable ftable exitLabel
	    val code2 = compileStat s2 vtable ftable exitLabel
	in
	    code0 @ [Mips.BEQ (t,"0",l1)] @ code1
	    @ [Mips.J l2, Mips.LABEL l1] @ code2 @ [Mips.LABEL l2]
	end
      | S100.While (e,s1,p) =>
        let
	    val t = "_while_"^newName()
	    val l1 = "_whilestart_"^newName()
	    val l2 = "_endwhile_"^newName()
	    val (_,code0) = compileExp e vtable ftable t
	    val code1 = compileStat s1 vtable ftable exitLabel
	in
	    [Mips.LABEL l1] @ code0 @ [Mips.BEQ (t,"0",l2)] @ code1 @ [Mips.J l1,Mips.LABEL l2]
	end
      | S100.Return (e,p) =>
        let
	    val t = "_return_"^newName()
	    val (_,code0) = compileExp e vtable ftable t
	in
	    code0 @ [Mips.MOVE ("2",t), Mips.J exitLabel]
	end
      | S100.Block (ds,ss,p) =>
        let
	    val vtable2 = extendDecs ds
	    val code = compileStats ss (vtable2 @ vtable) ftable exitLabel
	in
	    (code)
	end
	
and compileStats [] vtable ftable exitLabel = ([])
  | compileStats (s::ss) vtable ftable exitLabel =
    let
	val code1 = compileStat s vtable ftable exitLabel
	val code2 = compileStats ss vtable ftable exitLabel
    in
	(code1 @ code2)
    end
    

    

    
(* code for saving and restoring callee-saves registers *)
fun stackSave currentReg maxReg savecode restorecode offset =
    if currentReg > maxReg
    then (savecode, restorecode, offset)  (* done *)
    else stackSave (currentReg+1)
                   maxReg
                   (Mips.SW (makeConst currentReg,
                             SP,
                             makeConst offset)
                    :: savecode) (* save register *)
                   (Mips.LW (makeConst currentReg,
                             SP,
                             makeConst offset)
                    :: restorecode) (* restore register *)
                   (offset+4) (* adjust offset *)
	 
	 
(* compile function declaration *)
and compileFun ftable (typ, sf, args, body, (line,col)) =
    let
	val fname = Type.getName sf
	val rty = Type.getType typ sf
	fun moveArgs [] r = ([], [], 0)
	  | moveArgs ((t,ss)::ds) r =
	    moveArgs1 ss (Type.convertType t) ds r
	and moveArgs1 [] t ds r = moveArgs ds r
	  | moveArgs1 (s::ss) t ds r =
	    let
		val y = newName ()
		val (x,ty,loc) = (case s of
			              S100.Val (x,p) => (x, t, x^y))
		val rname = Int.toString r
		val (code, vtable, stackSpace) = moveArgs1 ss t ds (r+1)
	    in
		if r<=maxCaller then
		    (Mips.MOVE (loc, rname) :: code,
		     (x,(ty,loc)) :: vtable,
		     stackSpace)
		else
		    (Mips.LW (loc, FP, makeConst stackSpace) :: code,
		     (x,(ty,loc)) :: vtable,
		     stackSpace + 4)
	    end
	val (parcode,vtable,stackParams) (* move parameters to arguments *)
          = moveArgs args 2
        val body = compileStat body vtable ftable (fname ^ "_exit")
        val (body1, _, maxr,spilled)  (* call register allocator *)
          = RegAlloc.registerAlloc
                (parcode @ body) [] 2 maxCaller maxReg 0
        val (savecode, restorecode, offset) = (* save/restore callee-saves *)
            stackSave (maxCaller+1) (maxr+1) [] [] (4*spilled)
	(* save one extra callee-saves register for saving SP *)
	val ctext = if spilled>0
		    then "Spill of "^makeConst spilled ^ " variables occurred"
		    else ""
    in
        [Mips.COMMENT ctext,
         Mips.LABEL fname]  (* function label *)
	@ (if stackParams>0 then [Mips.MOVE (FP,SP)] else [])
	@ [Mips.ADDI (SP,SP,makeConst (~4-offset)), (* move SP down *)
           Mips.SW (RA, SP, makeConst offset)] (* save return address *)
        @ savecode  (* save callee-saves registers *)
        @ body1  (* code for function body *)
	@ [Mips.LABEL (fname^"_exit")] (* exit label *)
        @ restorecode  (* restore callee-saves registers *)
        @ [Mips.LW (RA, SP, makeConst offset), (* restore return addr *)
           Mips.ADDI (SP,SP,makeConst (offset+4)), (* move SP up *)
           Mips.JR (RA, [])] (* return *)
    end
    
(* compile program *)
fun compile funs =
    let
        val ftable =
	    Type.getFuns funs [("getint",([],Type.Int)),
			       ("putint",([Type.Int],Type.Int)),
                               ("getstring",([Type.Int], Type.Ref Type.Char)),
                               ("putstring",([Type.Ref Type.Char], Type.Ref Type.Char)),
                               ("walloc", ([Type.Int], Type.Ref Type.Int)),
                               ("balloc", ([Type.Int], Type.Ref Type.Char))]

	val funsCode = List.concat (List.map (compileFun ftable) funs)
    in
	[Mips.TEXT "0x00400000",
	 Mips.GLOBL "main",
	 Mips.LA (HP, "_heap_")]    (* initialise heap pointer *)
	@ [Mips.JAL ("main",[]),    (* run program *)
	   Mips.LI ("2","10"),      (* syscall control = 10 *)
           Mips.SYSCALL]            (* exit *)
	@ funsCode		  (* code for functions *)
	
	@ [Mips.LABEL "putint",     (* putint function *)
	   Mips.ADDI(SP,SP,"-8"),
	   Mips.SW ("2",SP,"0"),    (* save used registers *)
	   Mips.SW ("4",SP,"4"),
	   Mips.MOVE ("4","2"),
	   Mips.LI ("2","1"),       (* write_int syscall *)
	   Mips.SYSCALL,
	   Mips.LI ("2","4"),       (* writestring syscall *)
	   Mips.LA("4","_cr_"),
	   Mips.SYSCALL,            (* write CR *)
	   Mips.LW ("2",SP,"0"),    (* reload used registers *)
	   Mips.LW ("4",SP,"4"),
	   Mips.ADDI(SP,SP,"8"),
	   Mips.JR (RA,[]),
	   
	   Mips.LABEL "getint",     (* getint function *)
	   Mips.LI ("2","5"),       (* read_int syscall *)
	   Mips.SYSCALL,
	   Mips.JR (RA,[]),

	   Mips.LABEL "putstring",
	   Mips.MOVE ("4","2"),     (* writestring syscall *)
	   Mips.LI ("2","4"),
	   Mips.SYSCALL,
	   Mips.JR (RA,[]),

	   Mips.LABEL "getstring",
	   Mips.MOVE ("4","2"),
	   Mips.LI ("2","9"),
	   Mips.SYSCALL,
	   Mips.MOVE ("5","4"),
	   Mips.MOVE ("4","2"),
	   Mips.LI ("2","8"),
	   Mips.SYSCALL,             (* read_string function *)
	   Mips.MOVE ("2","4"),
	   Mips.JR (RA,[]),

	   Mips.LABEL "walloc",
	   Mips.MOVE ("4","2"),
	   Mips.ADD ("4","4","4"),
	   Mips.ADD ("4","4","4"),
	   Mips.LI ("2","9"),
	   Mips.SYSCALL,
	   Mips.JR (RA,[]),

	   Mips.LABEL "balloc",
	   Mips.MOVE ("4","2"),
	   Mips.LI ("2","9"),
	   Mips.SYSCALL,
	   Mips.JR (RA,[]),	   

	   Mips.DATA "",
	   Mips.ALIGN "2",
	   Mips.LABEL "_cr_",       (* carriage return string *)
	   Mips.ASCIIZ "\n",
	   Mips.ALIGN "2",
	   
	   Mips.LABEL "_heap_",     (* heap space *)
	   Mips.SPACE "100000"]
    end
    
end
