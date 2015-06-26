## Script reads the Larimer Tax Liens data file and writes out 3 files
## to the directory which this scrip was run:
##
## 1) goodRedeemed.csv
## 2) goodOutstanding.csv
## 3) badTaxLienRecs.csv
##

# read the data to a dataframe
tldata <- read.csv("Larimer_Tax_liens.csv")
# iterate thru the rows and determine whether they are good or bad records
