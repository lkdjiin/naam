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

    print_statement   ::= 'print' word ( int ) eol

    function_def      ::=  function_header {if_clause} else_clause

    function_header   ::= word ( word ) -> eol

    if_clause         ::= expr 'if' test eol

    test              ::= word op int

    else_clause       ::= expr 'else' eol

    expr              ::= int | word [op expr]

    op                ::= + | < | >

    eol               ::= ---End of line
    int               ::= ---Integer
    word              ::= ---Anything else

