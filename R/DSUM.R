#' @export
DSUM <- function (Z.vec, Sigma) 
{
    z.tmp = as.matrix(Z.vec)
    T.SUM = abs(sum(z.tmp))
    pval.SUM = pnorm(T.SUM, mean = 0, sd = sqrt(sum(Sigma)), 
        lower.tail = FALSE) * 2
    return(pval.SUM)
}
