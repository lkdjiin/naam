.sub 'succ'
    .param int n
    .local int result
    result = n + 1
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = 'succ'(10)
    say f
.end
