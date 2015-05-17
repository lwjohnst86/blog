---
layout: post
title: "Using more advanced macro techniques in SAS: Conditionals"
tags:
    - analysis
    - advanced
    - SAS
    - conditionals
    - if-then
    - macros
categories:
    - Statistics
    - Coding
... 

In a previous [post](http://www.sciencestatisticsandlife.com/2014/07/18/an-introduction-to-creating-your-own-macro-in-sas/), I went over a step-by-step introduction to starting your own macro.  For this post, I want to go over some more advanced features of the macro facility in SAS.  There are two features in particular that are very useful to know (at least in my opinion) for developing more useful and powerful personalized macros.  These are:

1. Conditionals
2. Loops 

As with all SAS macros, a `%` sign always precedes the macro command.  Just as in regular SAS code, the conditional `if... then` in macro code would be `%if... %then`, while the `do` loop is `%do` in macro code.  For this post, I will only go over conditionals.  In a future post I will discuss loops. 

## Using %if...%then conditional in macros ##

Conditionals are a really useful way of getting more out of your macro.  You can have your macro do different analyses depending on what you tell it to do.  Let's use the example from the post on [introducing macros](http://www.sciencestatisticsandlife.com/2014/07/18/an-introduction-to-creating-your-own-macro-in-sas/):

    %macro spearcorr (data=, var=, with=, partial=);
        proc corr data=&data spearman;
                var &var;
                with &with;
                partial &partial;
                run;
    %mend spearcorr;
    
    %spearcorr(data=mydata,
        var=height waist weight,
        with=exercise,
        partial=age);
        
Let's say we wanted to be able to output our results to a dataset using ODS (see my [post using ODS output](http://www.sciencestatisticsandlife.com/2014/07/18/an-introduction-to-creating-your-own-macro-in-sas/)).  If we ran the `ods trace on;` on the above code, we would see the name of the output would be `PartialSpearmanCorr`.  But if we ran...

    %spearcorr(data=mydata,
        var=height waist weight,
        with=exercise);
        
... Without the `partial` variables, the ODS output name would be `SpearmanCorr`.  The object name changes depending on the analysis being run.  In order to include that in the macro, we can use macro conditionals (`%if... %then`).  To do that, we need to create a condition based on whether the partial variable is empty or not.  First, include the ODS statement in the macro:

    %macro spearcorr (data=, var=, with=, partial=, outds=);
        proc corr data=&data spearman;
                var &var;
                with &with;
                partial &partial;
                ods output SpearmanCorr = &outds;
                run;
    %mend spearcorr;
    
Now, include a conditional:

    %macro spearcorr (data=, var=, with=, partial=, outds=);
        %if partial = %then %let partialods = ;
        %else %let partialods = Partial;
        proc corr data=&data spearman;
                var &var;
                with &with;
                partial &partial;
                ods output &partialods.SpearmanCorr = &outds;
                run;
    %mend spearcorr;

The code `partial = %then` means that if the macro variable `partial` argument is equal to nothing (empty), then assign the variable `partialods` to empty.  The `&partialods.SpearmanCorr` code will change the ODS object name to either `SpearmanCorr` or `PartialSpearmanCorr` depending on if partial is empty or not.  The period (.) after the `&partialods` is important as it tells SAS that the name of the macro variable is between the "&" and the ".".

This is just a small example of how conditionals can make a macro much more flexible and usable in wider situations.  There are even more complex applications of using conditionals that begin with a simple `%if ... %then` statement to make your macro as powerful as you want it to be!

If you want to see other examples of conditions, check out my [GitHub](https://github.com/lwjohnst86/sasToolkit) SAS macro repository.
