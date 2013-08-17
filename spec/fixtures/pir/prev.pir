.sub prev
    .param int n
    .local int result
    result = n - 1
    goto RETURN
RETURN:
    .return(result)
.end
.sub main :main
    .local int f
    f = prev(10)
    say f
.end
