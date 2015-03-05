deps <- as.matrix( dat[,2:4] )
inds <- as.matrix( dat[,5:8])
lm( deps~inds )


loopGEE <- function(data, y, x, covar, time,
                    cor.str = 'exchangeable') {

    vars <- expand.grid(indep =  as.list(x), dep = as.list(y))
    vars <- vars[c(2, 1)]

    cvars <- paste(time, covar, collapse = " + ", sep = " + ")
    vars <- merge(vars, cvars)
    colnames(vars)[3] <- "covars"

    formulas.list <- Map(make.formula, vars$dep, vars$indep, vars$covar)

    gee.list <- lapply(formulas.list, function(x) {
        gee(x, id = SID, data = data, corstr = cor.str, na.action = na.omit)
    })

    return(gee.list)
}
