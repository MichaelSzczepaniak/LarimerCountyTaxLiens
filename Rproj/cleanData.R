library(lubridate); library(stringr)

## Script reads the Larimer Tax Liens data file and writes out 3 files
## to the directory which this scrip was run:
##
## 1) goodRedeemed.csv
## 2) goodOutstanding.csv
## 3) badTaxLienRecs.csv
##
cleanTaxLienData <- function(file_name = "Larimer_Tax_liens.csv") {
    colNamez <- c(
        "SCHEDULE_NUMBER",
        "CERTIFICATE_NUMBER",
        "ISSUE_DATE",
        "SUBTAX",
        "REDEMPTION_DATE",
        "TAX_YEAR",
        "PRINCIPAL",
        "INTEREST",
        "PREMIUMBIDFEE",
        "TREASURERDEEDFEE"
    )
    colClazzes <- c(
        "integer",
        "integer",
        "Date",
        "factor",
        "Date",
        "integer",
        "numeric",
        "numeric",
        "integer",
        "numeric"
    )
    # a few of the date strings have times appended to them, but most don't
    colClazzes.nodates <- c(
        "integer",
        "integer",
        "character",
        "factor",
        "character",
        "integer",
        "numeric",
        "numeric",
        "integer",
        "numeric"
    )
    tldata <- read.csv(file_name, header = TRUE,
                       colClasses = colClazzes.nodates)
    tldata$ISSUE_DATE <- removeTimeSuffixes(tldata$ISSUE_DATE)
    
    return(tldata)
}

removeTimeSuffixes <- function(dateStrings) {
#     > lengthVals <- str_length(tldata$ISSUE_DATE)
#     > unique(lengthVals)
#     [1]  8 17
    returnVector <- dateStrings
    for(i in length(dateStrings)) {
        dt <- dateStrings[i]
        if(str_length(dt)) {
            returnVector[i] <- substr(dt, 1, 8)
        }
    }
    
    return(returnVector)
}

writePremiumBids(file_name = "Larimer_Tax_liens.csv",
                 output_file = "premium_bids.csv") {
    tldata <- cleanTaxLienData()
    premium_bids <- filter(tldata, PREMIUMBIDFEE > 0)
    write.csv(premium_bids, "premium_bids.csv", row.names = FALSE)
}