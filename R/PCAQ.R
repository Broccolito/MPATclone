#' @export
PCAQ <- function (Z.vec, Sigma, SigmaX) 
{
    if (!is.vector(Z.vec)) {
        Z.vec = as.vector(Z.vec)
    }
    p.WI = WI(Z.vec, Sigma)
    p.Wald = Wald(Z.vec, Sigma)
    p.VC = VC(Z.vec, Sigma)
    T.minp = min(c(p.WI, p.Wald, p.VC))
    K.X = dim(SigmaX)[1]
    if (K.X != 3) {
        stop("The dimension of SigmaX is not 3!!")
    }
    upper_bound = rep(Inf, K.X)
    lower_bound = rep(qnorm(T.minp), K.X)
    a = pmvnorm(lower = lower_bound, upper = upper_bound, mean = rep(0, 
        K.X), sigma = SigmaX, algorithm = GenzBretz(maxpts = 250000, 
        abseps = 1e-13))
    p.PCAQ = 1 - a[1]
    return(p.PCAQ)
}
