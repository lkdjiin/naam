Naam's grammar
==============

Grammar syntax:

    {foo}         zero or more foo
    foo | bar     foo or bar
    foo           a non-terminal foo
    'foo'         keyword foo
    [foo]         zero or one foo
    ---           free speech

This is Naam's grammar:

    program           ::= {instruction | eol}

    instruction       ::= function_def | print_statement

    print_statement   ::= 'print' word '(' int ')' eol

    function_def      ::= word '(' word ')' '=' eol {if_clause} else_clause

    if_clause         ::= int 'if' test eol

    test              ::= word op int

    else_clause       ::= int 'else' eol

    op                ::= '<' | '>'

    eol               ::= ---End of line
    int               ::= ---Integer
    word              ::= ---Anything else

