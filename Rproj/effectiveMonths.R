## Calculates the effective months over which simple interest had been paid.
##
## returnAmt - Return on Investment for a single tax lien; single value (scalar)
## principals - Numeric vector containing the original principal paid for a tax
##              lien(p0) and all successive subtax payments(pj)
## interest - Annual interest rate (simple) on a tax lien; single value (scalar)
## delta - Number of months between tax sale and subtax issuance; single value
##         (scalar). For Larimer county, this value is 3 since tax sale is 
##         typically in November, but subtax issuance is typically in September.
## returnIsTotal - FALSE if returnAmt is the ROI (difference between the total
##                 amount returned and what was paid).
##                 TRUE if returnAmt is the total amount returned. If this is
##                 the case, the function will do an internal calculation for
##                 ROI as part of calculating the effective months of interest.
effectiveMonths <- function(returnAmt, principals, annint = 0.10, delta = 3,
                            returnIsTotal = TRUE) {
    mint <- annint / 12  # monthly interest
    if(returnIsTotal) {
        # total amount returned has been passed, so ROI is difference
        # between what was paid and what was returned to investor
        roiByInt = (returnAmt - sum(principals)) / mint
    }
    else {
        # actual ROI is passes
        roiByInt = returnAmt / mint
    }
    
    if(length(principals) == 1) {
        # no subtax has been paid, simple calculation
        return(roiByInt / principals[1])
    }
    # If we are here, one or more subtax payments were made.
    sumSubtaxes <- sum(principals[2:length(principals)])
    # sub taxes vector = principals[2:length(principals)]
    twelveSumOverjpj <- 12 * sum(principals[2:length(principals)] *
                                 1:(length(principals) - 1))
    deltaSumOverpj <- delta * sumSubtaxes
    p0PlusSumOverpj <- principals[1] + sumSubtaxes
    m0 <- (roiByInt + twelveSumOverjpj - deltaSumOverpj) / p0PlusSumOverpj
    m0 <- as.integer(round(m0, digits = 0))
    
    return(m0)
}