# LarimerPropertyTaxes

## Description
This purpose of this project is to confirm or disprove three hypothesis described in the **Motivation** section related to investor behavior as demonstrated in past tax liens auctions conducted in Larimer county Colorado.  The study will be conducted based on data obtained from historical Larimer county tax liens sales.

## Motivation
Having been a tax lien investor since 2004, I observed what I would consider 'irrational' behavior by the more 'deep-pocketed' investors.  By 'deep-pocketed' (DP), I mean those that partake in premium bidding (which will be explained later in this document).  From these observation, I formed 3 hypotheses:

1. _On average, investors who partake in premium bidding lose money more frequently then they make money._
2. _On average, investors who partake in premium bidding lose more money than they make from premium bidding._
     - Note: This hypothesis may be true or false regardless of whether the first hypothesis is true or false.
3. _On average, the amount of risk an investors takes on through premium bidding is inversely proportional to the base amount of the lien._
     - In other words, the higher the amount of the lien, the less risk an investor is typically willing to take on where risk is measured in the number of months needed to break even (abbreviated as M2BE).

## Data
The above hypotheses are testable if enough of the following data can be obtained:

1. tax lien identifier
2. base amount of the tax lien
3. amount of premium paid for each applicable lien
4. amount redeemed

The **amount redeemed** is currently not available in the publically accessible database as of this writing. This data was obtained by requesting it specifically from the county and paying them for this information

Furthermore, the **date of redemption** is also currently unavailable in the database and must inferred.  In order to estimated the **data of redemption**, this client needed to be run periodically (a weekly interval was selected) to check whether the lean had been paid.  If the lien was found to be paid, then it could reasonably assumed that the **date of redemption** was sometime between the current and previous running of this client.

## Background regarding the bidding process

TBD - describe how the bidding process works in Larimer county

## Calculating the effective months to redemption: RedeemMonths.R


## What do the latest results look like?

TBD
