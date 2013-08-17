.sub 'power'
    .param int n
    .local int result
    result = n * n
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = 'power'(9)
    say f
.end
