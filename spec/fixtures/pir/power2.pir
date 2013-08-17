.sub '**'
    .param int n
    .local int result
    result = n * n
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = '**'(9)
    say f
.end
