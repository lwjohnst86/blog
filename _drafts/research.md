---
layout: post
title:
author: 
tags: []

...


## Research question ##

    Develop and focus
    Following lit search and conceptual diagram creation, refine/expand research question based on new info. Repeat lit search based on revision


## Lit search ##

    See litSearch.mm file
    Near comprehensive/systematic

## Create conceptual diagrams based on lit search and on the issues ##

    Use VUE

## Develop DAG of the issue. ##

    Use TETRAD


## Write up a draft of the intro and think about potential journals based on question ##

## Write up methods ##

    Construct a-priori list of analyses to run, plots to generate (exploratory and for manuscript)
    Develop methods justification, p-value cut-off, etc.
    Refine analyses following exploration

## Construct skeletal results section (tables - pgfplotstable; figures - knitr) ##

    Refine in light of exploration

## From dataset ##

    Extract relevant variables from master ds and save as a dataset in
    local research project folder.
    run univariate and bivariate analyses + exploratory plots
        If new insights come up here, may need to revise question/do further lit search.

## Run complex analyses (GLM, GEE, PCA, etc.) ##

    Build models
    Check diagnostics
    fit statistics
    visualization

## Write up results (knitr + pgfplotstable) ##

## Start up discussion ##

    Use results + lit rev to direct discussion
    May need additional lit search (very lightly)

## Based on findings, refine journal to submit to. ##

-----

1. Search lit to refine question and understand biology and covariates
2. Develop concept map (DAG) to inform direction of analysis and
   covariates
3. Conduct EDA, using knitr to create reports on your observations
4. Develop cross-validation sets (?)
5. Model selection at training set
6. Make prediction on what training set will reveal
7. Compare to validation/test set
8. Make conclusion on strength of statistical model for predicting
   outcome.
