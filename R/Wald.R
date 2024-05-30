#' @export
Wald <- function (Z.vec, Sigma) 
{
    K = length(Z.vec)
    R.inv = solve(Sigma)
    z.tmp = as.matrix(Z.vec)
    T.Wald = t(z.tmp) %*% R.inv %*% z.tmp
    pval.Wald = pchisq(T.Wald, df = K, lower.tail = FALSE)
    return(pval.Wald)
}
