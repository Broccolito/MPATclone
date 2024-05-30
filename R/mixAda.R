#' @export
mixAda <- function (Z.vec, Sigma) 
{
    Sigma.inv = solve(Sigma)
    K = length(Z.vec)
    J = rep(1, K)
    I = diag(K)
    H = 1/K * J %*% t(J)
    z.tmp = as.matrix(Z.vec)
    pval.mixAda = getMixAdapPvalue(z.tmp, Sigma = Sigma, B = 11)
    return(pval.mixAda)
}
