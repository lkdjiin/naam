.sub 'ten-percent'
    .param int n
    .local int result
    result = n / 10
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = 'ten-percent'(100)
    say f
.end
