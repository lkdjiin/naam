.sub zero
    .param int n
    .local int result
    result = 0
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = zero(123)
    say f
.end
