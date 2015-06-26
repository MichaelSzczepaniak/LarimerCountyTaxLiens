##
## roi - Return on Investment for single tax lien, single value (scalar)
## principals - vector containing the original principal paid for a tax
##              lien(p0) and all successive subtax payments(pj)
## interest - annual interest rate on a tax lien, single value
effectiveMonths <- function(roi, principals, interest = (0.10/12)) {
    firstYearMonths <- roi / (principals[1] * interest)
    if(length(principals) == 1) {
        return(firstYearMonths)
    }
    return(-1)
}