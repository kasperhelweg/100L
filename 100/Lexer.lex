{
 open Lexing;

 exception LexicalError of string * (int * int) (* (message, (line, column)) *)

 val currentLine = ref 1
 val lineStartPos = ref [0]

 fun getPos lexbuf = getLineCol (getLexemeStart lexbuf)
				(!currentLine)
				(!lineStartPos)

 and getLineCol pos line (p1::ps) =
       if pos>=p1 then (line, pos-p1)
       else getLineCol pos (line-1) ps
   | getLineCol pos line [] = raise LexicalError ("",(0,0))

 fun lexerError lexbuf s = 
     raise LexicalError (s, getPos lexbuf)

 fun keyword (s, pos) =
     case s of
         "if"           => Parser.IF pos
       | "then"         => Parser.THEN pos
       | "else"         => Parser.ELSE pos
       | "while"        => Parser.WHILE pos
       | "int"          => Parser.INT pos
       | "return"       => Parser.RETURN pos
       | _              => Parser.ID (s, pos)

 }


rule Token = parse
    [` ` `\t` `\r`]+    { Token lexbuf } (* whitespace *)
    | "/*" ([^`*`] | `*`[^`/`])* "*/"
			{ Token lexbuf } (* comment *)

  | [`\n` `\012`]       { currentLine := !currentLine+1;
                          lineStartPos :=  getLexemeStart lexbuf
			                   :: !lineStartPos;

                          Token lexbuf } (* newlines *)
  | [`0`-`9`]+          { case Int.fromString (getLexeme lexbuf) of
                               NONE   => lexerError lexbuf "Bad integer"
                             | SOME i => Parser.NUM (i, getPos lexbuf) }

  | [`a`-`z` `A`-`Z`] [`a`-`z` `A`-`Z` `0`-`9` `_`]*
                        { keyword (getLexeme lexbuf,getPos lexbuf) }

  | `'`
     ([`a`-`z` `A`-`Z` `0`-`9` ` ` `!` `#` `$` `%` `&` `(` `)` `*` `,` `-` `.` `/` `:` `;` `<` `=` `>` `?` `@` `[` `]` `^` `_` ``` `{` `|` `}` `~`] | 
      [`\`][`a`-`z` `A`-`Z` `0`-`9` ` ` `!` `#` `$` `%` `&` `(` `)` `*` `,` `-` `.` `/` `:` `;` `<` `=` `>` `?` `@` `[` `]` `^` `_` ``` `{` `|` `}` `~` `\` `'` `"`])
    `'`
                        { case Char.fromString (getLexeme lexbuf) of
                            NONE   => lexerError lexbuf "Not a char"
                          | SOME c => Parser.CHAR (valOf (SOME c), getPos lexbuf) } 

  (* The string expression below is set to '+', meaning that it's not possible to write "", i.e. a null string. It's fine to write " " however. Maybe it should be set to '*'? *)
  | [`"`][`a`-`z` `A`-`Z` `0`-`9` ` ` `!` `#` `$` `%` `&` `(` `)` `*` `,` `-` `.` `/` `:` `;` `<` `=` `>` `?` `@` `[` `]` `^` `_` ``` `{` `|` `}` `~`]+[`"`]
                        { Parser.STRING (getLexeme lexbuf, getPos lexbuf) }
   

  (* This one is probably broken for now *)
  | [`=`][`=`]          { Parser.EQUALS (getPos lexbuf) } 
  | `*`                 { Parser.POINTER(getPos lexbuf) }
  | `+`                 { Parser.PLUS (getPos lexbuf) }
  | `-`                 { Parser.MINUS (getPos lexbuf) }
  | `<`                 { Parser.LESS (getPos lexbuf) }
  | `=`                 { Parser.ASSIGN (getPos lexbuf) }
  | `(`                 { Parser.LPAR (getPos lexbuf) }
  | `)`                 { Parser.RPAR (getPos lexbuf) }
  | `{`                 { Parser.LCURL (getPos lexbuf)}
  | `}`                 { Parser.RCURL (getPos lexbuf)}
  | `,`                 { Parser.COMMA (getPos lexbuf) }
  | `;`                 { Parser.SEMICOLON (getPos lexbuf) }
  | eof                 { Parser.EOF (getPos lexbuf) }
  | _                   { lexerError lexbuf "Illegal symbol in input" }

;
