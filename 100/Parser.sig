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

val Prog :
  (Lexing.lexbuf -> token) -> Lexing.lexbuf -> S100.Prog;
