local
type t__1__ = (int*int)
type t__2__ = (int*int)
type t__3__ = char*(int*int)
type t__4__ = (int*int)
type t__5__ = (int*int)
type t__6__ = (int*int)
type t__7__ = (int*int)
type t__8__ = string*(int*int)
type t__9__ = (int*int)
type t__10__ = (int*int)
type t__11__ = (int*int)
type t__12__ = (int*int)
type t__13__ = (int*int)
type t__14__ = (int*int)
type t__15__ = int*(int*int)
type t__16__ = (int*int)
type t__17__ = (int*int)
type t__18__ = (int*int)
type t__19__ = (int*int)
type t__20__ = (int*int)
type t__21__ = (int*int)
type t__22__ = string*(int*int)
type t__23__ = (int*int)
type t__24__ = (int*int)
in
datatype token =
    ASSIGN of t__1__
  | CHAR of t__2__
  | CHARCONST of t__3__
  | COMMA of t__4__
  | ELSE of t__5__
  | EOF of t__6__
  | EQUALS of t__7__
  | ID of t__8__
  | IF of t__9__
  | INT of t__10__
  | LCURL of t__11__
  | LESS of t__12__
  | LPAR of t__13__
  | MINUS of t__14__
  | NUM of t__15__
  | PLUS of t__16__
  | POINTER of t__17__
  | RCURL of t__18__
  | RETURN of t__19__
  | RPAR of t__20__
  | SEMICOLON of t__21__
  | STRINGCONST of t__22__
  | THEN of t__23__
  | WHILE of t__24__
end;

open Obj Parsing;
prim_val vector_ : int -> 'a -> 'a Vector.vector = 2 "make_vect";
prim_val update_ : 'a Vector.vector -> int -> 'a -> unit = 3 "set_vect_item";

val yytransl = #[
  257 (* ASSIGN *),
  258 (* CHAR *),
  259 (* CHARCONST *),
  260 (* COMMA *),
  261 (* ELSE *),
  262 (* EOF *),
  263 (* EQUALS *),
  264 (* ID *),
  265 (* IF *),
  266 (* INT *),
  267 (* LCURL *),
  268 (* LESS *),
  269 (* LPAR *),
  270 (* MINUS *),
  271 (* NUM *),
  272 (* PLUS *),
  273 (* POINTER *),
  274 (* RCURL *),
  275 (* RETURN *),
  276 (* RPAR *),
  277 (* SEMICOLON *),
  278 (* STRINGCONST *),
  279 (* THEN *),
  280 (* WHILE *),
    0];

val yylhs = "\255\255\
\\001\000\002\000\002\000\003\000\003\000\007\000\007\000\008\000\
\\008\000\006\000\004\000\005\000\005\000\014\000\014\000\013\000\
\\013\000\013\000\013\000\013\000\009\000\009\000\009\000\009\000\
\\009\000\009\000\009\000\009\000\009\000\010\000\010\000\011\000\
\\011\000\012\000\000\000";

val yylen = "\002\000\
\\002\000\007\000\000\000\001\000\001\000\002\000\000\000\003\000\
\\000\000\002\000\001\000\003\000\001\000\002\000\000\000\002\000\
\\005\000\007\000\003\000\004\000\001\000\001\000\001\000\003\000\
\\003\000\003\000\003\000\004\000\003\000\000\000\001\000\001\000\
\\003\000\001\000\002\000";

val yydefred = "\000\000\
\\000\000\000\000\005\000\004\000\035\000\000\000\000\000\001\000\
\\011\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\022\000\000\000\000\000\009\000\000\000\021\000\000\000\000\000\
\\000\000\000\000\000\000\010\000\008\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\016\000\000\000\002\000\
\\000\000\000\000\000\000\031\000\000\000\000\000\000\000\000\000\
\\029\000\019\000\000\000\000\000\000\000\000\000\012\000\000\000\
\\028\000\000\000\014\000\020\000\033\000\000\000\000\000\018\000";

val yydgoto = "\002\000\
\\005\000\006\000\007\000\027\000\028\000\016\000\012\000\013\000\
\\024\000\043\000\044\000\025\000\047\000\048\000";

val yysindex = "\003\000\
\\004\255\000\000\000\000\000\000\000\000\012\255\017\255\000\000\
\\000\000\025\255\000\000\020\255\004\255\090\255\017\255\029\255\
\\000\000\028\255\047\255\000\000\087\255\000\000\087\255\094\255\
\\063\255\004\255\069\255\000\000\000\000\087\255\087\255\043\255\
\\108\255\105\255\087\255\087\255\087\255\000\000\087\255\000\000\
\\017\255\100\255\055\255\000\000\111\255\029\255\090\255\066\255\
\\000\000\000\000\054\255\000\000\000\000\045\255\000\000\087\255\
\\000\000\090\255\000\000\000\000\000\000\082\255\090\255\000\000";

val yyrindex = "\000\000\
\\083\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\003\255\000\000\000\000\000\000\000\000\071\255\
\\000\000\008\255\000\000\000\000\000\000\000\000\000\000\000\000\
\\051\255\083\255\243\254\000\000\000\000\072\255\000\000\089\255\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\074\255\000\000\000\000\000\000\000\000\089\255\000\000\
\\000\000\000\000\076\255\062\255\065\255\027\255\000\000\072\255\
\\000\000\000\000\000\000\000\000\000\000\024\255\000\000\000\000";

val yygindex = "\000\000\
\\000\000\085\000\245\255\106\000\077\000\097\000\000\000\110\000\
\\236\255\076\000\000\000\000\000\242\255\086\000";

val YYTABLESIZE = 133;
val yytable = "\026\000\
\\033\000\015\000\034\000\001\000\009\000\003\000\013\000\013\000\
\\034\000\042\000\045\000\034\000\009\000\004\000\051\000\052\000\
\\053\000\008\000\054\000\034\000\015\000\034\000\007\000\034\000\
\\009\000\017\000\017\000\034\000\034\000\017\000\024\000\017\000\
\\017\000\017\000\017\000\042\000\017\000\011\000\017\000\014\000\
\\030\000\017\000\017\000\062\000\003\000\017\000\024\000\024\000\
\\064\000\029\000\018\000\019\000\004\000\020\000\023\000\021\000\
\\035\000\022\000\036\000\031\000\037\000\023\000\023\000\039\000\
\\023\000\026\000\023\000\036\000\025\000\037\000\023\000\023\000\
\\041\000\026\000\057\000\026\000\025\000\026\000\025\000\027\000\
\\025\000\026\000\026\000\060\000\025\000\025\000\063\000\027\000\
\\003\000\017\000\006\000\030\000\017\000\032\000\018\000\027\000\
\\027\000\018\000\019\000\021\000\020\000\022\000\021\000\056\000\
\\022\000\035\000\015\000\036\000\023\000\037\000\040\000\035\000\
\\010\000\036\000\038\000\037\000\035\000\055\000\036\000\035\000\
\\037\000\036\000\035\000\037\000\036\000\050\000\037\000\049\000\
\\046\000\032\000\058\000\061\000\059\000";

val yycheck = "\014\000\
\\021\000\013\000\023\000\001\000\002\001\002\001\020\001\021\001\
\\001\001\030\000\031\000\004\001\010\001\010\001\035\000\036\000\
\\037\000\006\001\039\000\012\001\032\000\014\001\020\001\016\001\
\\008\001\002\001\003\001\020\001\021\001\006\001\004\001\008\001\
\\009\001\010\001\011\001\056\000\013\001\013\001\015\001\020\001\
\\013\001\018\001\019\001\058\000\002\001\003\001\020\001\021\001\
\\063\000\021\001\008\001\009\001\010\001\011\001\004\001\013\001\
\\012\001\015\001\014\001\013\001\016\001\019\001\012\001\001\001\
\\014\001\004\001\016\001\014\001\004\001\016\001\020\001\021\001\
\\004\001\012\001\020\001\014\001\012\001\016\001\014\001\004\001\
\\016\001\020\001\021\001\018\001\020\001\021\001\005\001\012\001\
\\006\001\003\001\020\001\020\001\003\001\020\001\008\001\020\001\
\\021\001\008\001\009\001\013\001\011\001\015\001\013\001\004\001\
\\015\001\012\001\018\001\014\001\019\001\016\001\026\000\012\001\
\\007\000\014\001\021\001\016\001\012\001\041\000\014\001\012\001\
\\016\001\014\001\012\001\016\001\014\001\021\001\016\001\020\001\
\\032\000\020\000\020\001\056\000\047\000";

val yyact = vector_ 36 (fn () => ((raise Fail "parser") : obj));
(* Rule 1, file Parser.grm, line 32 *)
val _ = update_ yyact 1
(fn () => repr(let
val d__1__ = peekVal 1 : S100.FunDec list
val d__2__ = peekVal 0 : (int*int)
in
( (d__1__) ) end : S100.Prog))
;
(* Rule 2, file Parser.grm, line 37 *)
val _ = update_ yyact 2
(fn () => repr(let
val d__1__ = peekVal 6 : S100.Type
val d__2__ = peekVal 5 : S100.Sid
val d__3__ = peekVal 4 : (int*int)
val d__4__ = peekVal 3 : S100.Dec list
val d__5__ = peekVal 2 : (int*int)
val d__6__ = peekVal 1 : S100.Stat
val d__7__ = peekVal 0 : S100.FunDec list
in
( ((d__1__), (d__2__), (d__4__), (d__6__), (d__3__)) :: (d__7__) ) end : S100.FunDec list))
;
(* Rule 3, file Parser.grm, line 38 *)
val _ = update_ yyact 3
(fn () => repr(let
in
( [] ) end : S100.FunDec list))
;
(* Rule 4, file Parser.grm, line 41 *)
val _ = update_ yyact 4
(fn () => repr(let
val d__1__ = peekVal 0 : (int*int)
in
( S100.Int (d__1__) ) end : S100.Type))
;
(* Rule 5, file Parser.grm, line 42 *)
val _ = update_ yyact 5
(fn () => repr(let
val d__1__ = peekVal 0 : (int*int)
in
( S100.Char (d__1__) ) end : S100.Type))
;
(* Rule 6, file Parser.grm, line 46 *)
val _ = update_ yyact 6
(fn () => repr(let
val d__1__ = peekVal 1 : S100.Dec list
val d__2__ = peekVal 0 : S100.Dec
in
( (d__1__) @ [(d__2__)] ) end : S100.Dec list))
;
(* Rule 7, file Parser.grm, line 47 *)
val _ = update_ yyact 7
(fn () => repr(let
in
( [] ) end : S100.Dec list))
;
(* Rule 8, file Parser.grm, line 51 *)
val _ = update_ yyact 8
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Dec list
val d__2__ = peekVal 1 : S100.Dec
val d__3__ = peekVal 0 : (int*int)
in
( (d__1__) @ [(d__2__)] ) end : S100.Dec list))
;
(* Rule 9, file Parser.grm, line 52 *)
val _ = update_ yyact 9
(fn () => repr(let
in
( [] ) end : S100.Dec list))
;
(* Rule 10, file Parser.grm, line 55 *)
val _ = update_ yyact 10
(fn () => repr(let
val d__1__ = peekVal 1 : S100.Type
val d__2__ = peekVal 0 : S100.Sid list
in
( ((d__1__), (d__2__)) ) end : S100.Dec))
;
(* Rule 11, file Parser.grm, line 58 *)
val _ = update_ yyact 11
(fn () => repr(let
val d__1__ = peekVal 0 : string*(int*int)
in
( S100.Val (d__1__) ) end : S100.Sid))
;
(* Rule 12, file Parser.grm, line 62 *)
val _ = update_ yyact 12
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Sid
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Sid list
in
( (d__1__) :: (d__3__) ) end : S100.Sid list))
;
(* Rule 13, file Parser.grm, line 63 *)
val _ = update_ yyact 13
(fn () => repr(let
val d__1__ = peekVal 0 : S100.Sid
in
( [(d__1__)] ) end : S100.Sid list))
;
(* Rule 14, file Parser.grm, line 67 *)
val _ = update_ yyact 14
(fn () => repr(let
val d__1__ = peekVal 1 : S100.Stat
val d__2__ = peekVal 0 : S100.Stat list
in
( ((d__1__) :: (d__2__)) ) end : S100.Stat list))
;
(* Rule 15, file Parser.grm, line 68 *)
val _ = update_ yyact 15
(fn () => repr(let
in
( [] ) end : S100.Stat list))
;
(* Rule 16, file Parser.grm, line 71 *)
val _ = update_ yyact 16
(fn () => repr(let
val d__1__ = peekVal 1 : S100.Exp
val d__2__ = peekVal 0 : (int*int)
in
( S100.EX (d__1__) ) end : S100.Stat))
;
(* Rule 17, file Parser.grm, line 73 *)
val _ = update_ yyact 17
(fn () => repr(let
val d__1__ = peekVal 4 : (int*int)
val d__2__ = peekVal 3 : (int*int)
val d__3__ = peekVal 2 : S100.Exp
val d__4__ = peekVal 1 : (int*int)
val d__5__ = peekVal 0 : S100.Stat
in
( S100.If ((d__3__),(d__5__),(d__1__)) ) end : S100.Stat))
;
(* Rule 18, file Parser.grm, line 75 *)
val _ = update_ yyact 18
(fn () => repr(let
val d__1__ = peekVal 6 : (int*int)
val d__2__ = peekVal 5 : (int*int)
val d__3__ = peekVal 4 : S100.Exp
val d__4__ = peekVal 3 : (int*int)
val d__5__ = peekVal 2 : S100.Stat
val d__6__ = peekVal 1 : (int*int)
val d__7__ = peekVal 0 : S100.Stat
in
( S100.IfElse ((d__3__),(d__5__),(d__7__),(d__1__)) ) end : S100.Stat))
;
(* Rule 19, file Parser.grm, line 77 *)
val _ = update_ yyact 19
(fn () => repr(let
val d__1__ = peekVal 2 : (int*int)
val d__2__ = peekVal 1 : S100.Exp
val d__3__ = peekVal 0 : (int*int)
in
( S100.Return ((d__2__),(d__1__)) ) end : S100.Stat))
;
(* Rule 20, file Parser.grm, line 79 *)
val _ = update_ yyact 20
(fn () => repr(let
val d__1__ = peekVal 3 : (int*int)
val d__2__ = peekVal 2 : S100.Dec list
val d__3__ = peekVal 1 : S100.Stat list
val d__4__ = peekVal 0 : (int*int)
in
( S100.Block ((d__2__), (d__3__), (d__1__)) ) end : S100.Stat))
;
(* Rule 21, file Parser.grm, line 82 *)
val _ = update_ yyact 21
(fn () => repr(let
val d__1__ = peekVal 0 : int*(int*int)
in
( S100.NumConst (d__1__) ) end : S100.Exp))
;
(* Rule 22, file Parser.grm, line 83 *)
val _ = update_ yyact 22
(fn () => repr(let
val d__1__ = peekVal 0 : char*(int*int)
in
( S100.CharConst (d__1__) ) end : S100.Exp))
;
(* Rule 23, file Parser.grm, line 84 *)
val _ = update_ yyact 23
(fn () => repr(let
val d__1__ = peekVal 0 : S100.Lval
in
( S100.LV (d__1__) ) end : S100.Exp))
;
(* Rule 24, file Parser.grm, line 86 *)
val _ = update_ yyact 24
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Lval
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Assign ((d__1__),(d__3__),(d__2__)) ) end : S100.Exp))
;
(* Rule 25, file Parser.grm, line 87 *)
val _ = update_ yyact 25
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Plus ((d__1__), (d__3__), (d__2__)) ) end : S100.Exp))
;
(* Rule 26, file Parser.grm, line 88 *)
val _ = update_ yyact 26
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Minus ((d__1__), (d__3__), (d__2__)) ) end : S100.Exp))
;
(* Rule 27, file Parser.grm, line 89 *)
val _ = update_ yyact 27
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Less ((d__1__), (d__3__), (d__2__)) ) end : S100.Exp))
;
(* Rule 28, file Parser.grm, line 91 *)
val _ = update_ yyact 28
(fn () => repr(let
val d__1__ = peekVal 3 : string*(int*int)
val d__2__ = peekVal 2 : (int*int)
val d__3__ = peekVal 1 : S100.Exp list
val d__4__ = peekVal 0 : (int*int)
in
( S100.Call (#1 (d__1__), (d__3__), (d__2__)) ) end : S100.Exp))
;
(* Rule 29, file Parser.grm, line 93 *)
val _ = update_ yyact 29
(fn () => repr(let
val d__1__ = peekVal 2 : (int*int)
val d__2__ = peekVal 1 : S100.Exp
val d__3__ = peekVal 0 : (int*int)
in
( (d__2__) ) end : S100.Exp))
;
(* Rule 30, file Parser.grm, line 96 *)
val _ = update_ yyact 30
(fn () => repr(let
in
( [] ) end : S100.Exp list))
;
(* Rule 31, file Parser.grm, line 97 *)
val _ = update_ yyact 31
(fn () => repr(let
val d__1__ = peekVal 0 : S100.Exp list
in
( (d__1__) ) end : S100.Exp list))
;
(* Rule 32, file Parser.grm, line 100 *)
val _ = update_ yyact 32
(fn () => repr(let
val d__1__ = peekVal 0 : S100.Exp
in
( [(d__1__)] ) end : S100.Exp list))
;
(* Rule 33, file Parser.grm, line 102 *)
val _ = update_ yyact 33
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp list
in
( (d__1__) :: (d__3__) ) end : S100.Exp list))
;
(* Rule 34, file Parser.grm, line 105 *)
val _ = update_ yyact 34
(fn () => repr(let
val d__1__ = peekVal 0 : string*(int*int)
in
( S100.Var (d__1__) ) end : S100.Lval))
;
(* Entry Prog *)
val _ = update_ yyact 35 (fn () => raise yyexit (peekVal 0));
val yytables : parseTables =
  ( yyact,
    yytransl,
    yylhs,
    yylen,
    yydefred,
    yydgoto,
    yysindex,
    yyrindex,
    yygindex,
    YYTABLESIZE,
    yytable,
    yycheck );
fun Prog lexer lexbuf = yyparse yytables 1 lexer lexbuf;
