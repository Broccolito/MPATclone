#' @export
PCO <- function (Z.vec, Sigma, SigmaO) 
{
    if (!is.vector(Z.vec)) {
        Z.vec = as.vector(Z.vec)
    }
    p.PCMinP = PCMinP(Z.vec, Sigma)
    p.PCFisher = PCFisher(Z.vec, Sigma)
    p.PCLC = PCLC(Z.vec, Sigma)
    p.WI = WI(Z.vec, Sigma)
    p.Wald = Wald(Z.vec, Sigma)
    p.VC = VC(Z.vec, Sigma)
    T.minp = min(p.PCMinP, p.PCFisher, p.PCLC, p.WI, p.Wald, 
        p.VC)
    K.X = dim(SigmaO)[1]
    if (K.X != 6) {
        stop("The dimension of SigmaO is not 6!!")
    }
    upper_bound = rep(Inf, K.X)
    lower_bound = rep(qnorm(T.minp), K.X)
    a = pmvnorm(lower = lower_bound, upper = upper_bound, mean = rep(0, 
        K.X), sigma = SigmaO, algorithm = GenzBretz(maxpts = 250000, 
        abseps = 1e-13))
    pval = 1 - a[1]
    return(pval)
}
