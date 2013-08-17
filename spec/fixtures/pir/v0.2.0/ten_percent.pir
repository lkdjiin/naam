.sub 'ten%'
    .param int n
    .local int result
    result = n / 10
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = 'ten%'(100)
    say f
.end
