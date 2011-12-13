local open Obj Lexing in


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
       | "int"          => Parser.INT pos
       | "return"       => Parser.RETURN pos
       | _              => Parser.ID (s, pos)

 
fun action_17 lexbuf = (
 lexerError lexbuf "Illegal symbol in input" )
and action_16 lexbuf = (
 Parser.EOF (getPos lexbuf) )
and action_15 lexbuf = (
 Parser.SEMICOLON (getPos lexbuf) )
and action_14 lexbuf = (
 Parser.COMMA (getPos lexbuf) )
and action_13 lexbuf = (
 Parser.RPAR (getPos lexbuf) )
and action_12 lexbuf = (
 Parser.LPAR (getPos lexbuf) )
and action_11 lexbuf = (
 Parser.ASSIGN (getPos lexbuf) )
and action_10 lexbuf = (
 Parser.LESS (getPos lexbuf) )
and action_9 lexbuf = (
 Parser.MINUS (getPos lexbuf) )
and action_8 lexbuf = (
 Parser.PLUS (getPos lexbuf) )
and action_7 lexbuf = (
 Parser.EQUALS (getPos lexbuf) )
and action_6 lexbuf = (
 Parser.STRING (getLexeme lexbuf, getPos lexbuf) )
and action_5 lexbuf = (
 case Char.fromString (getLexeme lexbuf) of
                            NONE   => lexerError lexbuf "Not a char"
                          | SOME c => Parser.CHAR (valOf (SOME c), getPos lexbuf) )
and action_4 lexbuf = (
 keyword (getLexeme lexbuf,getPos lexbuf) )
and action_3 lexbuf = (
 case Int.fromString (getLexeme lexbuf) of
                               NONE   => lexerError lexbuf "Bad integer"
                             | SOME i => Parser.NUM (i, getPos lexbuf) )
and action_2 lexbuf = (
 currentLine := !currentLine+1;
                          lineStartPos :=  getLexemeStart lexbuf
			                   :: !lineStartPos;

                          Token lexbuf )
and action_1 lexbuf = (
 Token lexbuf )
and action_0 lexbuf = (
 Token lexbuf )
and state_0 lexbuf = (
 let val currChar = getNextChar lexbuf in
 if currChar >= #"A" andalso currChar <= #"Z" then  state_17 lexbuf
 else if currChar >= #"a" andalso currChar <= #"z" then  state_17 lexbuf
 else if currChar >= #"0" andalso currChar <= #"9" then  state_13 lexbuf
 else case currChar of
    #"\t" => state_3 lexbuf
 |  #"\r" => state_3 lexbuf
 |  #" " => state_3 lexbuf
 |  #"\"" => state_5 lexbuf
 |  #"*" => state_5 lexbuf
 |  #"\n" => action_2 lexbuf
 |  #"\f" => action_2 lexbuf
 |  #"=" => state_16 lexbuf
 |  #"<" => action_10 lexbuf
 |  #";" => action_15 lexbuf
 |  #"/" => state_12 lexbuf
 |  #"-" => action_9 lexbuf
 |  #"," => action_14 lexbuf
 |  #"+" => action_8 lexbuf
 |  #")" => action_13 lexbuf
 |  #"(" => action_12 lexbuf
 |  #"'" => state_6 lexbuf
 |  #"\^@" => action_16 lexbuf
 |  _ => action_17 lexbuf
 end)
and state_3 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_0);
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"\t" => state_33 lexbuf
 |  #"\r" => state_33 lexbuf
 |  #" " => state_33 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_5 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_17);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"," andalso currChar <= #"~" then  state_30 lexbuf
 else case currChar of
    #"!" => state_30 lexbuf
 |  #" " => state_30 lexbuf
 |  #"&" => state_30 lexbuf
 |  #"%" => state_30 lexbuf
 |  #"$" => state_30 lexbuf
 |  #"#" => state_30 lexbuf
 |  #"*" => state_30 lexbuf
 |  #")" => state_30 lexbuf
 |  #"(" => state_30 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_6 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_17);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"," andalso currChar <= #"[" then  state_21 lexbuf
 else if currChar >= #"]" andalso currChar <= #"~" then  state_21 lexbuf
 else case currChar of
    #"!" => state_21 lexbuf
 |  #" " => state_21 lexbuf
 |  #"&" => state_21 lexbuf
 |  #"%" => state_21 lexbuf
 |  #"$" => state_21 lexbuf
 |  #"#" => state_21 lexbuf
 |  #"*" => state_21 lexbuf
 |  #")" => state_21 lexbuf
 |  #"(" => state_21 lexbuf
 |  #"\\" => state_23 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_12 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_17);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"," andalso currChar <= #"[" then  state_21 lexbuf
 else if currChar >= #"]" andalso currChar <= #"~" then  state_21 lexbuf
 else case currChar of
    #"!" => state_21 lexbuf
 |  #" " => state_21 lexbuf
 |  #"&" => state_21 lexbuf
 |  #"%" => state_21 lexbuf
 |  #"$" => state_21 lexbuf
 |  #"#" => state_21 lexbuf
 |  #")" => state_21 lexbuf
 |  #"(" => state_21 lexbuf
 |  #"\\" => state_23 lexbuf
 |  #"*" => state_22 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_13 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_3);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"0" andalso currChar <= #"9" then  state_20 lexbuf
 else backtrack lexbuf
 end)
and state_16 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_11);
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"=" => action_7 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_17 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_4);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"0" andalso currChar <= #"9" then  state_18 lexbuf
 else if currChar >= #"A" andalso currChar <= #"Z" then  state_18 lexbuf
 else if currChar >= #"a" andalso currChar <= #"z" then  state_18 lexbuf
 else case currChar of
    #"_" => state_18 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_18 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_4);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"0" andalso currChar <= #"9" then  state_18 lexbuf
 else if currChar >= #"A" andalso currChar <= #"Z" then  state_18 lexbuf
 else if currChar >= #"a" andalso currChar <= #"z" then  state_18 lexbuf
 else case currChar of
    #"_" => state_18 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_20 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_3);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"0" andalso currChar <= #"9" then  state_20 lexbuf
 else backtrack lexbuf
 end)
and state_21 lexbuf = (
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"'" => action_5 lexbuf
 |  #"/" => action_5 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_22 lexbuf = (
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"'" => state_27 lexbuf
 |  #"/" => state_27 lexbuf
 |  #"*" => state_28 lexbuf
 |  #"\^@" => backtrack lexbuf
 |  _ => state_26 lexbuf
 end)
and state_23 lexbuf = (
 let val currChar = getNextChar lexbuf in
 if currChar >= #"0" andalso currChar <= #"~" then  state_21 lexbuf
 else case currChar of
    #"!" => state_21 lexbuf
 |  #" " => state_21 lexbuf
 |  #"&" => state_21 lexbuf
 |  #"%" => state_21 lexbuf
 |  #"$" => state_21 lexbuf
 |  #"#" => state_21 lexbuf
 |  #"*" => state_21 lexbuf
 |  #")" => state_21 lexbuf
 |  #"(" => state_21 lexbuf
 |  #"." => state_21 lexbuf
 |  #"-" => state_21 lexbuf
 |  #"," => state_21 lexbuf
 |  #"/" => state_25 lexbuf
 |  #"'" => action_5 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_25 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_5);
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"'" => action_5 lexbuf
 |  #"/" => action_5 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_26 lexbuf = (
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"*" => state_28 lexbuf
 |  #"\^@" => backtrack lexbuf
 |  _ => state_26 lexbuf
 end)
and state_27 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_5);
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"*" => state_28 lexbuf
 |  #"\^@" => backtrack lexbuf
 |  _ => state_26 lexbuf
 end)
and state_28 lexbuf = (
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"/" => action_1 lexbuf
 |  #"\^@" => backtrack lexbuf
 |  _ => state_26 lexbuf
 end)
and state_30 lexbuf = (
 let val currChar = getNextChar lexbuf in
 if currChar >= #"," andalso currChar <= #"~" then  state_30 lexbuf
 else case currChar of
    #"!" => state_30 lexbuf
 |  #" " => state_30 lexbuf
 |  #"&" => state_30 lexbuf
 |  #"%" => state_30 lexbuf
 |  #"$" => state_30 lexbuf
 |  #"#" => state_30 lexbuf
 |  #")" => state_30 lexbuf
 |  #"(" => state_30 lexbuf
 |  #"*" => state_32 lexbuf
 |  #"\"" => action_6 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_32 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_6);
 let val currChar = getNextChar lexbuf in
 if currChar >= #"," andalso currChar <= #"~" then  state_30 lexbuf
 else case currChar of
    #"!" => state_30 lexbuf
 |  #" " => state_30 lexbuf
 |  #"&" => state_30 lexbuf
 |  #"%" => state_30 lexbuf
 |  #"$" => state_30 lexbuf
 |  #"#" => state_30 lexbuf
 |  #")" => state_30 lexbuf
 |  #"(" => state_30 lexbuf
 |  #"*" => state_32 lexbuf
 |  #"\"" => action_6 lexbuf
 |  _ => backtrack lexbuf
 end)
and state_33 lexbuf = (
 setLexLastPos lexbuf (getLexCurrPos lexbuf);
 setLexLastAction lexbuf (magic action_0);
 let val currChar = getNextChar lexbuf in
 case currChar of
    #"\t" => state_33 lexbuf
 |  #"\r" => state_33 lexbuf
 |  #" " => state_33 lexbuf
 |  _ => backtrack lexbuf
 end)
and Token lexbuf =
  (setLexLastAction lexbuf (magic dummyAction);
   setLexStartPos lexbuf (getLexCurrPos lexbuf);
   state_0 lexbuf)

(* The following checks type consistency of actions *)
val _ = fn _ => [action_17, action_16, action_15, action_14, action_13, action_12, action_11, action_10, action_9, action_8, action_7, action_6, action_5, action_4, action_3, action_2, action_1, action_0];

end