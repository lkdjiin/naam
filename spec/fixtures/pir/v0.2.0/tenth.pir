.sub 'tenth'
    .param int n
    .local int result
    result = n / 10
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = 'tenth'(99)
    say f
.end
