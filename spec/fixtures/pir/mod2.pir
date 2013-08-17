.sub 'mod2'
    .param int n
    .local int result
    result = n % 2
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = 'mod2'(11)
    say f
.end
