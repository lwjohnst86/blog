deps <- as.matrix( dat[,2:4] )
inds <- as.matrix( dat[,5:8])
lm( deps~inds )
