## Calculates the effective months over which simple interest had been paid.
##
## roi - Return on Investment for single tax lien, single value (scalar)
## principals - vector containing the original principal paid for a tax
##              lien(p0) and all successive subtax payments(pj)
## interest - annual interest rate (simple) on a tax lien, single value
## delta - number of months between tax sale and subtax issuance
##         For Larimer county, this value is 3 since tax sale is in November,
##         but subtax issuance is in September. 
effectiveMonths <- function(roi, principals, annint = 0.10, delta = 3) {
    mint <- annint / 12  # monthly interest
    roiByInt = roi / mint
    if(length(principals) == 1) {
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