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
type t__15__ = (int*int)
type t__16__ = int*(int*int)
type t__17__ = (int*int)
type t__18__ = (int*int)
type t__19__ = (int*int)
type t__20__ = (int*int)
type t__21__ = (int*int)
type t__22__ = (int*int)
type t__23__ = (int*int)
type t__24__ = string*(int*int)
type t__25__ = (int*int)
type t__26__ = (int*int)
in
datatype token =
    ASSIGN of t__1__
  | CHAR of t__2__
  | CHARCONST of t__3__
  | COMMA of t__4__
  | ELSE of t__5__
  | EOF of t__6__
  | EQUAL of t__7__
  | ID of t__8__
  | IF of t__9__
  | INT of t__10__
  | LBRAC of t__11__
  | LCURL of t__12__
  | LESS of t__13__
  | LPAR of t__14__
  | MINUS of t__15__
  | NUM of t__16__
  | PLUS of t__17__
  | POINTER of t__18__
  | RBRAC of t__19__
  | RCURL of t__20__
  | RETURN of t__21__
  | RPAR of t__22__
  | SEMICOLON of t__23__
  | STRINGCONST of t__24__
  | THEN of t__25__
  | WHILE of t__26__
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
  263 (* EQUAL *),
  264 (* ID *),
  265 (* IF *),
  266 (* INT *),
  267 (* LBRAC *),
  268 (* LCURL *),
  269 (* LESS *),
  270 (* LPAR *),
  271 (* MINUS *),
  272 (* NUM *),
  273 (* PLUS *),
  274 (* POINTER *),
  275 (* RBRAC *),
  276 (* RCURL *),
  277 (* RETURN *),
  278 (* RPAR *),
  279 (* SEMICOLON *),
  280 (* STRINGCONST *),
  281 (* THEN *),
  282 (* WHILE *),
    0];

val yylhs = "\255\255\
\\001\000\002\000\002\000\003\000\003\000\007\000\007\000\008\000\
\\008\000\006\000\004\000\004\000\005\000\005\000\014\000\014\000\
\\013\000\013\000\013\000\013\000\013\000\013\000\009\000\009\000\
\\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\\009\000\010\000\010\000\011\000\011\000\012\000\012\000\012\000\
\\000\000";

val yylen = "\002\000\
\\002\000\007\000\000\000\001\000\001\000\002\000\000\000\003\000\
\\000\000\002\000\001\000\002\000\003\000\001\000\002\000\000\000\
\\002\000\005\000\007\000\005\000\003\000\004\000\001\000\001\000\
\\001\000\001\000\003\000\003\000\003\000\003\000\003\000\004\000\
\\003\000\000\000\001\000\001\000\003\000\001\000\002\000\004\000\
\\002\000";

val yydefred = "\000\000\
\\000\000\000\000\005\000\004\000\041\000\000\000\000\000\001\000\
\\011\000\000\000\000\000\012\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\024\000\000\000\000\000\009\000\000\000\023\000\
\\000\000\025\000\000\000\000\000\000\000\000\000\000\000\010\000\
\\008\000\000\000\000\000\039\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\017\000\000\000\002\000\
\\000\000\000\000\000\000\000\000\035\000\000\000\000\000\000\000\
\\000\000\033\000\021\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\013\000\040\000\000\000\032\000\000\000\015\000\022\000\
\\000\000\037\000\000\000\020\000\000\000\019\000";

val yydgoto = "\002\000\
\\005\000\006\000\007\000\031\000\032\000\018\000\014\000\015\000\
\\028\000\052\000\053\000\029\000\056\000\057\000";

val yysindex = "\005\000\
\\000\255\000\000\000\000\000\000\000\000\025\255\062\255\000\000\
\\000\000\027\255\023\255\000\000\000\000\051\255\000\255\069\255\
\\062\255\052\255\000\000\249\254\068\255\000\000\098\255\000\000\
\\098\255\000\000\077\255\150\255\078\255\000\255\090\255\000\000\
\\000\000\098\255\098\255\000\000\098\255\050\255\034\255\151\255\
\\098\255\098\255\098\255\098\255\098\255\000\000\098\255\000\000\
\\062\255\173\255\174\255\074\255\000\000\131\255\052\255\069\255\
\\079\255\000\000\000\000\162\255\001\255\048\255\096\255\096\255\
\\001\255\000\000\000\000\098\255\000\000\069\255\000\000\000\000\
\\069\255\000\000\092\255\000\000\069\255\000\000";

val yyrindex = "\000\000\
\\099\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\007\255\000\000\000\000\000\000\
\\000\000\087\255\000\000\085\255\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\106\255\099\255\045\255\000\000\
\\000\000\000\000\089\255\000\000\000\000\095\255\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\094\255\000\000\000\000\000\000\000\000\095\255\
\\000\000\000\000\000\000\000\000\020\255\137\255\120\255\132\255\
\\065\255\000\000\000\000\089\255\000\000\000\000\000\000\000\000\
\\000\000\000\000\024\255\000\000\000\000\000\000";

val yygindex = "\000\000\
\\000\000\087\000\246\255\111\000\071\000\088\000\000\000\105\000\
\\234\255\062\000\000\000\000\000\240\255\075\000";

val YYTABLESIZE = 192;
val yytable = "\030\000\
\\039\000\003\000\040\000\034\000\017\000\001\000\035\000\042\000\
\\009\000\004\000\036\000\050\000\051\000\043\000\054\000\044\000\
\\009\000\045\000\060\000\061\000\062\000\063\000\064\000\031\000\
\\065\000\018\000\018\000\017\000\007\000\018\000\008\000\018\000\
\\018\000\018\000\012\000\018\000\013\000\018\000\031\000\018\000\
\\042\000\031\000\031\000\018\000\018\000\051\000\043\000\018\000\
\\044\000\018\000\045\000\003\000\019\000\075\000\042\000\058\000\
\\076\000\020\000\021\000\004\000\078\000\022\000\044\000\023\000\
\\045\000\024\000\014\000\014\000\027\000\009\000\025\000\019\000\
\\016\000\026\000\033\000\027\000\020\000\021\000\047\000\010\000\
\\022\000\037\000\023\000\027\000\024\000\038\000\027\000\027\000\
\\038\000\025\000\041\000\038\000\026\000\049\000\027\000\069\000\
\\077\000\038\000\072\000\038\000\019\000\038\000\042\000\038\000\
\\003\000\020\000\038\000\038\000\006\000\026\000\034\000\023\000\
\\026\000\024\000\016\000\036\000\048\000\011\000\026\000\066\000\
\\026\000\026\000\026\000\029\000\026\000\055\000\038\000\026\000\
\\026\000\074\000\071\000\000\000\029\000\000\000\029\000\028\000\
\\029\000\042\000\029\000\000\000\030\000\029\000\029\000\043\000\
\\028\000\044\000\028\000\045\000\028\000\030\000\028\000\000\000\
\\070\000\028\000\028\000\030\000\042\000\042\000\030\000\030\000\
\\000\000\000\000\043\000\043\000\044\000\044\000\045\000\045\000\
\\042\000\000\000\000\000\000\000\046\000\059\000\043\000\000\000\
\\044\000\068\000\045\000\042\000\042\000\000\000\000\000\073\000\
\\000\000\043\000\043\000\044\000\044\000\045\000\045\000\067\000";

val yycheck = "\016\000\
\\023\000\002\001\025\000\011\001\015\000\001\000\014\001\007\001\
\\002\001\010\001\018\001\034\000\035\000\013\001\037\000\015\001\
\\010\001\017\001\041\000\042\000\043\000\044\000\045\000\004\001\
\\047\000\002\001\003\001\038\000\022\001\006\001\006\001\008\001\
\\009\001\010\001\008\001\012\001\014\001\014\001\019\001\016\001\
\\007\001\022\001\023\001\020\001\021\001\068\000\013\001\024\001\
\\015\001\026\001\017\001\002\001\003\001\070\000\007\001\022\001\
\\073\000\008\001\009\001\010\001\077\000\012\001\015\001\014\001\
\\017\001\016\001\022\001\023\001\004\001\008\001\021\001\003\001\
\\022\001\024\001\023\001\026\001\008\001\009\001\001\001\018\001\
\\012\001\014\001\014\001\019\001\016\001\001\001\022\001\023\001\
\\004\001\021\001\014\001\007\001\024\001\004\001\026\001\022\001\
\\005\001\013\001\020\001\015\001\003\001\017\001\007\001\019\001\
\\006\001\008\001\022\001\023\001\022\001\004\001\022\001\014\001\
\\007\001\016\001\020\001\022\001\030\000\007\000\013\001\049\000\
\\015\001\024\001\017\001\004\001\019\001\038\000\022\000\022\001\
\\023\001\068\000\056\000\255\255\013\001\255\255\015\001\004\001\
\\017\001\007\001\019\001\255\255\004\001\022\001\023\001\013\001\
\\013\001\015\001\015\001\017\001\017\001\013\001\019\001\255\255\
\\022\001\022\001\023\001\019\001\007\001\007\001\022\001\023\001\
\\255\255\255\255\013\001\013\001\015\001\015\001\017\001\017\001\
\\007\001\255\255\255\255\255\255\023\001\023\001\013\001\255\255\
\\015\001\004\001\017\001\007\001\007\001\255\255\255\255\022\001\
\\255\255\013\001\013\001\015\001\015\001\017\001\017\001\019\001";

val yyact = vector_ 42 (fn () => ((raise Fail "parser") : obj));
(* Rule 1, file Parser.grm, line 33 *)
val _ = update_ yyact 1
(fn () => repr(let
val d__1__ = peekVal 1 : S100.FunDec list
val d__2__ = peekVal 0 : (int*int)
in
( (d__1__) ) end : S100.Prog))
;
(* Rule 2, file Parser.grm, line 38 *)
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
(* Rule 3, file Parser.grm, line 39 *)
val _ = update_ yyact 3
(fn () => repr(let
in
( [] ) end : S100.FunDec list))
;
(* Rule 4, file Parser.grm, line 42 *)
val _ = update_ yyact 4
(fn () => repr(let
val d__1__ = peekVal 0 : (int*int)
in
( S100.Int (d__1__) ) end : S100.Type))
;
(* Rule 5, file Parser.grm, line 43 *)
val _ = update_ yyact 5
(fn () => repr(let
val d__1__ = peekVal 0 : (int*int)
in
( S100.Char (d__1__) ) end : S100.Type))
;
(* Rule 6, file Parser.grm, line 47 *)
val _ = update_ yyact 6
(fn () => repr(let
val d__1__ = peekVal 1 : S100.Dec list
val d__2__ = peekVal 0 : S100.Dec
in
( (d__1__) @ [(d__2__)] ) end : S100.Dec list))
;
(* Rule 7, file Parser.grm, line 48 *)
val _ = update_ yyact 7
(fn () => repr(let
in
( [] ) end : S100.Dec list))
;
(* Rule 8, file Parser.grm, line 52 *)
val _ = update_ yyact 8
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Dec list
val d__2__ = peekVal 1 : S100.Dec
val d__3__ = peekVal 0 : (int*int)
in
( (d__1__) @ [(d__2__)] ) end : S100.Dec list))
;
(* Rule 9, file Parser.grm, line 53 *)
val _ = update_ yyact 9
(fn () => repr(let
in
( [] ) end : S100.Dec list))
;
(* Rule 10, file Parser.grm, line 56 *)
val _ = update_ yyact 10
(fn () => repr(let
val d__1__ = peekVal 1 : S100.Type
val d__2__ = peekVal 0 : S100.Sid list
in
( ((d__1__), (d__2__)) ) end : S100.Dec))
;
(* Rule 11, file Parser.grm, line 59 *)
val _ = update_ yyact 11
(fn () => repr(let
val d__1__ = peekVal 0 : string*(int*int)
in
( S100.Val (d__1__) ) end : S100.Sid))
;
(* Rule 12, file Parser.grm, line 60 *)
val _ = update_ yyact 12
(fn () => repr(let
val d__1__ = peekVal 1 : (int*int)
val d__2__ = peekVal 0 : string*(int*int)
in
( S100.Ref (d__2__) ) end : S100.Sid))
;
(* Rule 13, file Parser.grm, line 64 *)
val _ = update_ yyact 13
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Sid
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Sid list
in
( (d__1__) :: (d__3__) ) end : S100.Sid list))
;
(* Rule 14, file Parser.grm, line 65 *)
val _ = update_ yyact 14
(fn () => repr(let
val d__1__ = peekVal 0 : S100.Sid
in
( [(d__1__)] ) end : S100.Sid list))
;
(* Rule 15, file Parser.grm, line 69 *)
val _ = update_ yyact 15
(fn () => repr(let
val d__1__ = peekVal 1 : S100.Stat
val d__2__ = peekVal 0 : S100.Stat list
in
( ((d__1__) :: (d__2__)) ) end : S100.Stat list))
;
(* Rule 16, file Parser.grm, line 70 *)
val _ = update_ yyact 16
(fn () => repr(let
in
( [] ) end : S100.Stat list))
;
(* Rule 17, file Parser.grm, line 73 *)
val _ = update_ yyact 17
(fn () => repr(let
val d__1__ = peekVal 1 : S100.Exp
val d__2__ = peekVal 0 : (int*int)
in
( S100.EX (d__1__) ) end : S100.Stat))
;
(* Rule 18, file Parser.grm, line 75 *)
val _ = update_ yyact 18
(fn () => repr(let
val d__1__ = peekVal 4 : (int*int)
val d__2__ = peekVal 3 : (int*int)
val d__3__ = peekVal 2 : S100.Exp
val d__4__ = peekVal 1 : (int*int)
val d__5__ = peekVal 0 : S100.Stat
in
( S100.If ((d__3__),(d__5__),(d__1__)) ) end : S100.Stat))
;
(* Rule 19, file Parser.grm, line 77 *)
val _ = update_ yyact 19
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
(* Rule 20, file Parser.grm, line 79 *)
val _ = update_ yyact 20
(fn () => repr(let
val d__1__ = peekVal 4 : (int*int)
val d__2__ = peekVal 3 : (int*int)
val d__3__ = peekVal 2 : S100.Exp
val d__4__ = peekVal 1 : (int*int)
val d__5__ = peekVal 0 : S100.Stat
in
( S100.While ((d__3__), (d__5__), (d__1__))) end : S100.Stat))
;
(* Rule 21, file Parser.grm, line 81 *)
val _ = update_ yyact 21
(fn () => repr(let
val d__1__ = peekVal 2 : (int*int)
val d__2__ = peekVal 1 : S100.Exp
val d__3__ = peekVal 0 : (int*int)
in
( S100.Return ((d__2__),(d__1__)) ) end : S100.Stat))
;
(* Rule 22, file Parser.grm, line 83 *)
val _ = update_ yyact 22
(fn () => repr(let
val d__1__ = peekVal 3 : (int*int)
val d__2__ = peekVal 2 : S100.Dec list
val d__3__ = peekVal 1 : S100.Stat list
val d__4__ = peekVal 0 : (int*int)
in
( S100.Block ((d__2__), (d__3__), (d__1__)) ) end : S100.Stat))
;
(* Rule 23, file Parser.grm, line 86 *)
val _ = update_ yyact 23
(fn () => repr(let
val d__1__ = peekVal 0 : int*(int*int)
in
( S100.NumConst (d__1__) ) end : S100.Exp))
;
(* Rule 24, file Parser.grm, line 87 *)
val _ = update_ yyact 24
(fn () => repr(let
val d__1__ = peekVal 0 : char*(int*int)
in
( S100.CharConst (d__1__) ) end : S100.Exp))
;
(* Rule 25, file Parser.grm, line 88 *)
val _ = update_ yyact 25
(fn () => repr(let
val d__1__ = peekVal 0 : string*(int*int)
in
( S100.StringConst (d__1__)) end : S100.Exp))
;
(* Rule 26, file Parser.grm, line 89 *)
val _ = update_ yyact 26
(fn () => repr(let
val d__1__ = peekVal 0 : S100.Lval
in
( S100.LV (d__1__) ) end : S100.Exp))
;
(* Rule 27, file Parser.grm, line 91 *)
val _ = update_ yyact 27
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Lval
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Assign ((d__1__),(d__3__),(d__2__)) ) end : S100.Exp))
;
(* Rule 28, file Parser.grm, line 92 *)
val _ = update_ yyact 28
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Plus ((d__1__), (d__3__), (d__2__)) ) end : S100.Exp))
;
(* Rule 29, file Parser.grm, line 93 *)
val _ = update_ yyact 29
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Minus ((d__1__), (d__3__), (d__2__)) ) end : S100.Exp))
;
(* Rule 30, file Parser.grm, line 94 *)
val _ = update_ yyact 30
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Less ((d__1__), (d__3__), (d__2__)) ) end : S100.Exp))
;
(* Rule 31, file Parser.grm, line 95 *)
val _ = update_ yyact 31
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp
in
( S100.Equal ((d__1__), (d__3__), (d__2__))) end : S100.Exp))
;
(* Rule 32, file Parser.grm, line 97 *)
val _ = update_ yyact 32
(fn () => repr(let
val d__1__ = peekVal 3 : string*(int*int)
val d__2__ = peekVal 2 : (int*int)
val d__3__ = peekVal 1 : S100.Exp list
val d__4__ = peekVal 0 : (int*int)
in
( S100.Call (#1 (d__1__), (d__3__), (d__2__)) ) end : S100.Exp))
;
(* Rule 33, file Parser.grm, line 99 *)
val _ = update_ yyact 33
(fn () => repr(let
val d__1__ = peekVal 2 : (int*int)
val d__2__ = peekVal 1 : S100.Exp
val d__3__ = peekVal 0 : (int*int)
in
( (d__2__) ) end : S100.Exp))
;
(* Rule 34, file Parser.grm, line 102 *)
val _ = update_ yyact 34
(fn () => repr(let
in
( [] ) end : S100.Exp list))
;
(* Rule 35, file Parser.grm, line 103 *)
val _ = update_ yyact 35
(fn () => repr(let
val d__1__ = peekVal 0 : S100.Exp list
in
( (d__1__) ) end : S100.Exp list))
;
(* Rule 36, file Parser.grm, line 106 *)
val _ = update_ yyact 36
(fn () => repr(let
val d__1__ = peekVal 0 : S100.Exp
in
( [(d__1__)] ) end : S100.Exp list))
;
(* Rule 37, file Parser.grm, line 108 *)
val _ = update_ yyact 37
(fn () => repr(let
val d__1__ = peekVal 2 : S100.Exp
val d__2__ = peekVal 1 : (int*int)
val d__3__ = peekVal 0 : S100.Exp list
in
( (d__1__) :: (d__3__) ) end : S100.Exp list))
;
(* Rule 38, file Parser.grm, line 111 *)
val _ = update_ yyact 38
(fn () => repr(let
val d__1__ = peekVal 0 : string*(int*int)
in
( S100.Var (d__1__) ) end : S100.Lval))
;
(* Rule 39, file Parser.grm, line 112 *)
val _ = update_ yyact 39
(fn () => repr(let
val d__1__ = peekVal 1 : string*(int*int)
val d__2__ = peekVal 0 : (int*int)
in
( S100.Deref (d__1__) ) end : S100.Lval))
;
(* Rule 40, file Parser.grm, line 113 *)
val _ = update_ yyact 40
(fn () => repr(let
val d__1__ = peekVal 3 : string*(int*int)
val d__2__ = peekVal 2 : (int*int)
val d__3__ = peekVal 1 : S100.Exp
val d__4__ = peekVal 0 : (int*int)
in
(S100.Lookup (#1 (d__1__), (d__3__), (d__2__))) end : S100.Lval))
;
(* Entry Prog *)
val _ = update_ yyact 41 (fn () => raise yyexit (peekVal 0));
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
