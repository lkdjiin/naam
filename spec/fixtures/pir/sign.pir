.sub 'sign'
    .param int n
    .local int result
    if n > 0 goto LABEL0001
    if n < 0 goto LABEL0002
    result = 0
    goto RETURN
LABEL0001:
    result = 1
    goto RETURN
LABEL0002:
    result = -1
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = 'sign'(4)
    say f
.end
