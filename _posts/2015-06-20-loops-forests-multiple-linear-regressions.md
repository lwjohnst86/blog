---
layout: post
title: "Loops and Forests: Running and presenting multiple tests of
    linear regression"
tags:
    - Statistics
    - Loops
    - Forest plot
    - Regression
    - Multiple tests
    - R Markdown
    - R
    - Practice worksheet
category:
    - Statistics
...

If you do any type of data-heavy work, you likely have had to run many
tests of a regression.  As the number of response and explanatory
variables increases, the number of potential combinations of course
also increases.  There is no way you are going to type out dozens of
different regressions... You also have the challenge of presenting
this much information.  In this post, I'm going to go over a way to
loop through each of the possible combinations.  I'm also going to
advocate that any time that many results of the same test are shown,
that the tabular format for these results is probably the absolute
worst way to show your data... and that plots, in particular a
modified forest plot, are the best way to present your data.  In both
the loop and the forest plot case, I've created several functions to
carry out this task for a generalized estimating equations analysis on
my
[GitHub `rstatsToolkit` package](https://github.com/lwjohnst86/rstatsToolkit)
with an example found on the
[`plotForest` function example section](https://github.com/lwjohnst86/rstatsToolkit/blob/master/R/plotForest.R)

# Setup: Load the necessary packages and set up data #

Load up the incredibly useful
[`dplyr`](https://github.com/hadley/dplyr) and
[`ggplot2`](http://ggplot2.org/) packages.  `dplyr`, via the
[`magrittr`](https://github.com/smbache/magrittr) package, allows us
to use the `%>%` pipe command, which is so absolutely amazing, I don't
know why this type of command wasn't made sooner!


{% highlight r %}
library(ggplot2)
library(dplyr)
library(magrittr)
library(broom)
library(tidyr)
{% endhighlight %}

Let's create a fake dataset to play with and assign it a `tbl` class
via the `tbl_df()` command.  A `tbl` and `tbl_df` class makes the
printing nicer, so that not all the data is printed.


{% highlight r %}
df <- data.frame(matrix(runif(200*26), ncol = 26)) %>%
  tbl_df %>%
  ## Rename columns above 21 to be Y instead of X
  setNames(., gsub('X(2[1-6])', 'Y\\1', names(.))) %>%
  mutate(Y21 = Y21 * X1,
         Y24 = Y24^X4,
         Y26 = Y26 + (X5 * X7 * X19),
         Y22 = Y22^(X12 + X14)) %>%
  mutate_each(funs(as.numeric(scale(.))))
{% endhighlight %}

I've made some of the response variables purposefully related to the
explanatory variables so that there are at least some statistically
significant associations.  You'll also notice that I've scaled (mean
centered and standardized) all the variables as this will allow the
regression results to be comparable across tests.  This is especially
important when showing them on a forest plot.

# TODO list for running and plotting many regressions: #

Before we begin, it's good to list out what exactly needs to be done
in order to get the end result.  So:

1. Create some way to allow each combination of the 20 by 6 variables
2. Apply the regression to each combination
3. Extract only the relevant values from the regressions
4. Send the output data to ggplot as a forest plot

# 1. Creating either a formula list or wrangle the data #

There are two (probably more) ways that we could run a regression on
each combination of response and explanatory variable.  The first is
to create a list of formulas for each combination.


{% highlight r %}
response <- grep('Y', names(df), value = TRUE)
explanatory <- grep('X', names(df), value = TRUE)
formulaList <- expand.grid(dep = response, indep = explanatory) %>%
  with(., Map(function(y, x) as.formula(paste(y, '~', x)), dep, indep))

head(formulaList, 3)
{% endhighlight %}



{% highlight text %}
## [[1]]
## Y21 ~ X1
## <environment: 0x3b25678>
## 
## [[2]]
## Y22 ~ X1
## <environment: 0x3b1a550>
## 
## [[3]]
## Y23 ~ X1
## <environment: 0x3b12460>
{% endhighlight %}

You can see that this creates a list of formulas, which can then be
passed into a regression.  However, another way to run a regression on
all combinations is to use the `gather` function from the
[`tidyr`](https://github.com/hadley/tidyr) package.  This converts the
dataframe into a format that allows a regression to run on groups of
the response and explanatory variables.  I really like this method
(having only recently discovered it) as you can operate on the data
directly, rather then through the formula list.


{% highlight r %}
prep.df <- df %>%
  gather(Indep, Xvalue, X1:X20) %>% ## To get a explanatory column
  gather(Dep, Yvalue, Y21:Y26) ## To get a response column

head(prep.df)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [6 x 4]
## 
##   Indep     Xvalue Dep      Yvalue
## 1    X1  0.7741445 Y21  1.90872266
## 2    X1 -0.3531208 Y21  0.17324040
## 3    X1 -0.2130827 Y21 -0.02031865
## 4    X1 -0.4270212 Y21 -0.37047140
## 5    X1  0.8865390 Y21  0.35932606
## 6    X1 -0.4795838 Y21  0.43324312
{% endhighlight %}

# 2. Apply a regression to each combination #

So now we have the formula list or the data in the format needed for
next processing.  First, let's do the regression on the formula list.
Here I use the `tidy` function from the
[`broom`](https://github.com/dgrtwo/broom) package, which basically
tidies up the regression output to make it cleaner and easier to work
with.


{% highlight r %}
datafit1 <- lapply(formulaList, function(x) lm(x, data = df) %>%
         broom::tidy(., conf.int = TRUE, data = df))

head(datafit1, 2)
{% endhighlight %}



{% highlight text %}
## [[1]]
##          term      estimate  std.error     statistic      p.value
## 1 (Intercept) -1.063207e-16 0.05469165 -1.944003e-15 1.000000e+00
## 2          X1  6.362161e-01 0.05482889  1.160367e+01 4.365591e-24
##     conf.low conf.high
## 1 -0.1078529 0.1078529
## 2  0.5280926 0.7443397
## 
## [[2]]
##          term      estimate  std.error     statistic   p.value   conf.low
## 1 (Intercept) -3.848662e-17 0.07088752 -5.429252e-16 1.0000000 -0.1397914
## 2          X1 -6.502336e-03 0.07106540 -9.149791e-02 0.9271895 -0.1466446
##   conf.high
## 1 0.1397914
## 2 0.1336399
{% endhighlight %}

This output is still in a list format, so it will evenutally need to
be unlisted.  Alright, let's try it with the wrangled data.


{% highlight r %}
datafit2 <- prep.df %>%
  group_by(Dep, Indep) %>%
  do(lm(Yvalue ~ Xvalue, data = .) %>%
       broom::tidy(., conf.int = TRUE, data = .))

head(datafit2)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [6 x 9]
## Groups: Dep, Indep
## 
##   Dep Indep        term      estimate  std.error     statistic
## 1 Y21    X1 (Intercept) -1.063207e-16 0.05469165 -1.944003e-15
## 2 Y21    X1      Xvalue  6.362161e-01 0.05482889  1.160367e+01
## 3 Y21    X2 (Intercept) -2.612717e-17 0.07056171 -3.702741e-16
## 4 Y21    X2      Xvalue -9.598485e-02 0.07073877 -1.356892e+00
## 5 Y21    X3 (Intercept) -3.040845e-17 0.06987275 -4.351976e-16
## 6 Y21    X3      Xvalue  1.687198e-01 0.07004809  2.408628e+00
## Variables not shown: p.value (dbl), conf.low (dbl), conf.high (dbl)
{% endhighlight %}

In this case, the command above uses the `do` function from the
[`dplyr`](https://github.com/hadley/dplyr) package, which let's me run
the regression on each 'group'.  Compared to using the formula list,
this approach is much nicer in that you don't have to unlist the
output, it's cleaner and easier to read, and also includes the `Dep`
and `Indep` variable names.  Because of these reasons (and because it
is a bit frustrating to try to wrangle the formula list approach into
a format that is useable), I'm going to continue with using the
`dplyr` + `tidyr` approach.

# 3. Extract the relevant information #

At this point, it is fairly trivial to subset the data and add any
relevant variables to this output dataset.  Given I only want the
`Indep` variable regression information, let's filter the dataset down.


{% highlight r %}
datafit.subset <- datafit2 %>%
  filter(term == 'Xvalue')

head(datafit.subset)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [6 x 9]
## Groups: Dep, Indep
## 
##   Dep Indep   term    estimate  std.error  statistic      p.value
## 1 Y21    X1 Xvalue  0.63621614 0.05482889 11.6036662 4.365591e-24
## 2 Y21    X2 Xvalue -0.09598485 0.07073877 -1.3568916 1.763605e-01
## 3 Y21    X3 Xvalue  0.16871977 0.07004809  2.4086276 1.692888e-02
## 4 Y21    X4 Xvalue  0.19102134 0.06975827  2.7383325 6.738213e-03
## 5 Y21    X5 Xvalue -0.03361530 0.07102674 -0.4732766 6.365372e-01
## 6 Y21    X6 Xvalue  0.10619539 0.07066504  1.5027994 1.344840e-01
## Variables not shown: conf.low (dbl), conf.high (dbl)
{% endhighlight %}

Ok, so it's in a good format to be plotted.  *However*, there is
something I want to include in the plot.  To help make the
visualization easier and quicker to interpret, I want to make the
regression results on the plot *bigger* as the significance becomes
*stronger*.  So, I need to create a new variable that represents the
levels of significance for each regression.


{% highlight r %}
datafit.plot <- datafit.subset %>%
  mutate(f.pvalue = cut(p.value, breaks = c(-Inf, 0.001, 0.01, 0.05, Inf),
                        labels = c('<0.001', '<0.01', '<0.05', '>0.05'),
                        ordered_result = TRUE) %>%
           factor(., levels = rev(levels(.))))

summary(datafit.plot$f.pvalue)
{% endhighlight %}



{% highlight text %}
##  >0.05  <0.05  <0.01 <0.001 
##    105      7      4      4
{% endhighlight %}

The summary of the levels of significance show mostly non-significance
(which is expected given the dataset is random), but since I made some
of the variables purposefully related, there is some significant
associations.  We can now pass this dataset into the forest plot.

# 4. Make a forest plot of the regression output #

I chose using a forest plot because it is a perfect plot to represent
results with a confidence band, especially when used to compare across
multiple tests.  I use the incredible
[`ggplot2`](https://github.com/hadley/ggplot2) to make the forest
plot.  While this part takes the most amount of code, it is simple
code for specifying the elements of the plot.


{% highlight r %}
forestplot <- datafit.plot %>%
  ggplot(., aes(estimate, Indep)) +
  geom_errorbarh(aes(xmin = conf.low,
                     xmax = conf.high,
                     alpha = f.pvalue,
                     height = 0)) +
  geom_vline(xintercept = 0, linetype = 'dashed') +
  geom_point(aes(size = f.pvalue,
                 alpha = f.pvalue)) +
  scale_alpha_discrete(name = 'P-value') +
  scale_size_discrete(name = 'P-value') +
  facet_wrap(~ Dep, ncol = 3) +
  theme_bw(14) +
  labs(y = 'Explanatory (aka predictor) variables',
       x = 'Standardized beta-coefficients\nwith 95% confidence intervals')

print(forestplot)
{% endhighlight %}

![Forest plot showing regression results of each combination of response and explanatory variable.](/images/2015-06-20-loops-forests-multiple-linear-regressions/forestPlot-1.png) 

And there you go!  A forest plot, with dots that increase in size and
opacity as the statistical significance increases.

Visualizations should be used more often to represent results from
scientific research.  I think that, in general, results should
*almost* always be shown visually, and especially when many regression
(or other tests) are run.  Forest plots in particular should be used
for presenting regression results rather than in the table format.
The main reasons being:

* A forest plot is a perfect plot device to be able to compare
  regression results across variables.
* Given that the beta coefficient *with* the confidence interval is
  presented, the magnitude of an association and the *uncertainty*
  that the beta coefficient may represent the population estimate can
  be quickly inferred and compared across regressions.  Text is a very
  poor tool to being able to evaluate the magnitude of an association
  *in comparison to other test results*.
* When many statistical tests are run, there is the concern for false
  positives.  Because of the visualization of the confidence intervals
  and the size of the lines and dots depicting higher statistical
  significance, you can determine whether an association is a false
  positive *better* than when showing in a table.  For instance, when
  confidence intervals are very wide and close to the line, this
  likely means a false positive.
* Humans are visual by nature.  Text in tabular format is difficult
  and cumbersome to work through and understand.  Making a forest plot
  is being considerate to the reader and reviewer of the research.
  Scientists are busy people and the general public doesn't always
  know how to interpret scientific results.

The more work you as the researcher put into making your results
visually easy to interpret and understand, the better it will be for
you and for your audience!

I hope this post helps others work better present their results!
