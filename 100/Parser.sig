local
type t__1__ = (int*int)
type t__2__ = char*(int*int)
type t__3__ = (int*int)
type t__4__ = (int*int)
type t__5__ = (int*int)
type t__6__ = (int*int)
type t__7__ = string*(int*int)
type t__8__ = (int*int)
type t__9__ = (int*int)
type t__10__ = (int*int)
type t__11__ = (int*int)
type t__12__ = (int*int)
type t__13__ = (int*int)
type t__14__ = int*(int*int)
type t__15__ = (int*int)
type t__16__ = (int*int)
type t__17__ = (int*int)
type t__18__ = (int*int)
type t__19__ = (int*int)
type t__20__ = (int*int)
type t__21__ = string*(int*int)
type t__22__ = (int*int)
type t__23__ = (int*int)
in
datatype token =
    ASSIGN of t__1__
  | CHAR of t__2__
  | COMMA of t__3__
  | ELSE of t__4__
  | EOF of t__5__
  | EQUALS of t__6__
  | ID of t__7__
  | IF of t__8__
  | INT of t__9__
  | LCURL of t__10__
  | LESS of t__11__
  | LPAR of t__12__
  | MINUS of t__13__
  | NUM of t__14__
  | PLUS of t__15__
  | POINTER of t__16__
  | RCURL of t__17__
  | RETURN of t__18__
  | RPAR of t__19__
  | SEMICOLON of t__20__
  | STRING of t__21__
  | THEN of t__22__
  | WHILE of t__23__
end;

val Prog :
  (Lexing.lexbuf -> token) -> Lexing.lexbuf -> S100.Prog;
