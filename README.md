# LarimerPropertyTaxes

## Description
This purpose of this project is to confirm or disprove three hypothesis described in the **Motivation** section related to investor behavior as demonstrated in past tax liens auctions conducted in Larimer county Colorado.  The study will be conducted based on data obtained from historical Larimer county tax liens sales.

A simple SOAP client will be developed in order to access the property records database for **Larimer county Colorado** (the database) in order to update the historical records with the most current data available without having to go back to the county continually to request query runs on their internal databases.  The plan is to cross-check the data obtained from the SOAP client with data obtained from Larimer county directly in the the following year.

## Motivation
Having been a tax lien investor for over a decade, I observed what I would consider 'irrational' behavior by the more 'deep-pocketed' investors.  By 'deep-pocketed' (DP), I mean those that partake in premium bidding (which will be explained later in this document).  From these observation, I formed 3 hypotheses:

1. _On average, investors who partake in premium bidding lose money more frequently then they make money._
2. _On average, investors who partake in premium bidding lose more more money than they make from premium bidding._
     - Note: This hypothesis may be true or false regardless of whether the first hypothesis is true or false.
3. _On average, the amount of risk an investors takes on through premium bidding is inversely proportional to the base amount of the lien._
     - In other words, the higher the amount of the lien, the less risk an investor is typically willing to take on where risk is measured in the number of months needed to break even (abbreviated as M2BE).

## Data
The above hypotheses are testable if enough of the following data can be obtained:

1. tax lien identifier
2. amount of the lien
3. amount of premium paid
4. amount redeemed

The **amount redeemed** is currently not in the database as of this writing and must be inferred from the following 3 pieces of information:
1. the date of purchase
2. the date of redemption
3. the interest rate

Furthermore, the **date of redemption** is also currently unavailable in the database and must inferred.  In order to estimated the **data of redemption**, this client needed to be run periodically (a weekly interval was selected) to check whether the lean had been paid.  If the lien was found to be paid, then it could reasonably assumed that the **date of redemption** was sometime between the current and previous running of this client.

## Background regarding the bidding process

TBD - describe how the bidding process works in Larimer county

## Calculating the effective months to redemption: RedeemMonths.R

## The basic SOAP client

TBD - describe how to use ant script which will be a part of this project

## How to run the client

TBD

## What do the latest results look like?

TBD
