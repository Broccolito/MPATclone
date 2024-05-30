#' @export
PC <- function (Z.vec, Sigma, PCorder) 
{
    eigen.res = eigen(Sigma)
    lambdas = eigen.res$values
    eigen.vec = eigen.res$vectors
    z.tmp = as.matrix(Z.vec)
    lambda = lambdas[PCorder]
    u = eigen.vec[, PCorder]
    PC = t(u) %*% z.tmp
    PC.std = (PC/sqrt(lambda))^2
    PC.p = pchisq(PC.std, df = 1, lower.tail = FALSE)
    return(PC.p)
}
