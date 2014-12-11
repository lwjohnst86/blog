---
layout: post
title: Customizing your SAS output using ODS
category: [statistics, coding]
tags: [analysis, advanced, SAS, ODS output, customize output, tutorial]
...

## ... or how to shift through the massive SAS textual deluge ##

For those that have used both R and SAS, you may have noticed the different philosophies each has toward how much output should be given for a statistical test.  R seems to, at least to me, have the mindset that if you want more output from a test, you have to tell R exactly what you want.  The amount of output R gives is proportional to the amount of commands you give R.

SAS, on the other hand, has the mentality of giving you everything for asking very little.  You want proof?  Run a linear regression in SAS and R, then compare the outputs...  You'll see what I mean.  For SAS, the amount of output appears to be *inversely* proportional to the amount of code you have.

This situation in SAS is one very strong reason for packaging up your most used code into macros, which I introduced in a past post where [I introduced macros](http://www.sciencestatisticsandlife.com/2014/07/18/an-introduction-to-creating-your-own-macro-in-sas/).  There is another very useful facility in SAS called ODS output that is very powerful when combined with macros.  In this post, I will go over what ODS is and how to combine it with macros so that you get only the results you want.

# So, what is ODS? #

ODS stands for "Output Delivery System".  It contains an incredible number of features and commands, of which I will only be focusing on one very useful aspect of it in this post.  In particular, I'll be going over how to send selected results for a statistical test into a SAS dataset to be manipulated and eventually saved as a text, Excel, or csv ("comma separated values") file.

Let's use a typical example of SAS's textual deluge, `proc glm`.  We want to run an ANOVA.  The GLM procedure outputs a variety of results, such as model fit statistics, ANOVA results, or type 3 (what is the word?).  But we only want the ANOVA results.  How do we get it?

## Step 1: Package up your code into a macro ##

Similar to how I did it in the [introduction to macros post](http://www.sciencestatisticsandlife.com/2014/07/18/an-introduction-to-creating-your-own-macro-in-sas/), make your code into a macro.

    %macro anova(y=, x=, ds=);
        proc glm data=&ds;
            class &x;
            model &y = &x / ss3;
            run;
        %mend anova;
        
## Step 2: Find out the name of the ODS output object ##

In order to output to ODS, you need to determine the name of the ODS object by using the `ods trace on;` command:

    ods trace on;
    %anova(y=weight, x=sex, ds=sashelp.class);
    ods trace off;
    
Running this code will send the names of all the possible ODS objects associated with the `proc glm` code to the log (either to a file or to the screen).

    Output Added:
    -------------
    Name:       ClassLevels
    Label:      Class Levels
    Template:   STAT.GLM.ClassLevels
    Path:       GLM.Data.ClassLevels
    -------------

    Output Added:
    -------------
    Name:       NObs
    Label:      Number of Observations
    Template:   STAT.GLM.NObsNotitle
    Path:       GLM.Data.NObs
    -------------

    Output Added:
    -------------

    Name:       OverallANOVA
    Label:      Overall ANOVA
    Template:   stat.GLM.OverallANOVA
    Path:       GLM.ANOVA.Weight.OverallANOVA
    -------------

    Output Added:
    -------------
    Name:       FitStatistics
    Label:      Fit Statistics
    Template:   stat.GLM.FitStatistics
    Path:       GLM.ANOVA.Weight.FitStatistics
    -------------

    Output Added:
    -------------
    Name:       ModelANOVA
    Label:      Type III Model ANOVA
    Template:   stat.GLM.Tests
    Path:       GLM.ANOVA.Weight.ModelANOVA
    -------------

Look for the ANOVA object.  In this case, it is the `ModelANOVA` object. 

## Step 3: Include the ODS object in the SAS macro code ##

Now that you have the name of the object, you can put it into your macro:

    %macro anova(y=, x=, ds=, outds=);
        proc glm data=&ds;
            class &x;
            model &y = &x / ss3;
            ods output ModelANOVA=&outds;
            run;
        %mend anova;
        
    %anova(y=weight, x=sex,
        ds=sashelp.class, outds=anovads);
        
The macro now outputs a dataset with the specific results you want.  Something I highly recommend is to then manipulate the new results dataset `anovads` into a format that is easier to input into a table.  So the next step is... 

## Step 4: Edit the results output dataset to fit your needs ##

This is an optional step, as you may not need to do any edits to your results to fit your needs.  The `ModelANOVA` ODS object is fairly simple in its output, while other output objects may need additional editing.  If you do need to make edits, merely use the `data ... ; set ... ;` command.

For an example on how I use ODS output, check out my [GitHub](https://github.com/lwjohnst86/sasToolkit) repository of my SAS macros.
