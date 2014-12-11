---
layout: post
title: An introduction to creating your own macro in SAS
category: [statistics, coding]
tags: [analysis, beginner, coding, macro, SAS, tutorial]
...

Ever copy and paste a proc statement or data step? Or wish to do some more complex tasks, either only once or multiple times? Well in SAS, there is a facility that allows you to create these snippets of code that can be reused or that make doing complex tasks easier and more maintainable. This facility is called macros.

While there are excellent resources[^2] already available for making your own macros, I found that there were few if any step-by-step *tutorials* on making macros, especially more complex macros. In particular, there weren't many resources that focused specifically on creating macros that made doing statistical analysis easier.  Therefore, this blog/tutorial is an attempt at going through, step-by-step, how to create a macro that makes analysis easier, more maintainable, and reproducible.

[^2]: For example, [here](http://scott.sherrillmix.com/blog/programmer/sas-macros-letting-sas-do-the-typing/); however, most are pdf files that can be downloaded from a google search

# Step 1: Identify what you want the macro to accomplish #

This is a very important step.  In order to make a good macro, you need a good idea on what you want it to do and when you would use it.

One good strategy for knowing when to convert code to a macro is to identify code you copy and paste repeatedly.  For example, if you repeatedly do `proc corr` for correlations, you can package it up into a macro so you have less lines of code.  In addition, if you need to modify something within the macro, it will effect your macro throughout the entire script whenever you use it.

# Step 2: Type out the proc or datastep command you will run #

Now that we have identified what we want the macro to do, we can start putting it together.

Let's continue with the previous example of the `proc corr` command.  So, type out the code you want to run as you normally would.

    proc corr data=mydata spearman;
        var height waist weight;
        with exercise;
        partial age sex;
        run;

# Step 3: Add macro commands and variables to the proc or datastep #

Now, add the macro start and end commands to the top and bottom of the SAS code.  In SAS, these are the `%macro` and `%mend` (macro end) commands.  Following the `%macro` command, two other arguments need to be provided [^1]:

1. The name you will give the macro
2. The parameters of the macro

The parameters are the variables that you will tell SAS to include in the macro when it runs it.  In this case, the parameters could be the variables in the `data`, `var`, `with`, and `partial` statements.  In order for SAS to recognize the parameters as marco variables, they need to have an ampersand (&) in front of them (i.e. `&var`).  So, to get the same results using a macro, the code above would become:

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
        partial=age sex);

[^1]: This is not entirely true.  Only one argument is required, which is the name that you will give the macro.  The reason the second argument (i.e. the parameters) should be included is because it makes the macro more flexible.

This may seem like more work than the code in step 2, but it can become a very powerful tool for reusing code with less typing.  For instance, if we wanted to analyze different variables, without the `partial` statement, it becomes:

    %spearcorr(data=mydata,
        var=musclemass strength,
        with=exercise);

This way, the code is less verbose, cleaner, uses less lines, and is more readable.

# Step 4: Save your macros in a separate file #

It is standard practice to store all your custom-made macros in a separate file so that you can reference it in all your working SAS files (better known as a script).  You can include other SAS scripts by placing the below code at the top of your script and running it:

    %include '/path/to/macros/mymacros.sas';

Or...

    %inc '/path/to/macros/mymacros.sas';

That way, if you change your macro a bit, it will change it in all your SAS scripts.

# Conclusions #

This is a good starting point to beginning to use and build your own macro library, personalized to your work!  But this is just the tip of the iceberg in the vast power and utility of using macros in SAS.  In the next section, I will be going over more advanced features of macros in SAS that will really provide a productivity boost!

I have my macros that I have built for my use in research and analysis on [GitHub](https://github.com/lwjohnst86/sasToolkit) if you want to take a look at it, clone it, and/or modify it for your own use!
