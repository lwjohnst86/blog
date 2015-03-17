---
layout: post
title: Understanding variance and linear regression
tags:
    - Statistics
    - Variance
    - R Markdown
    - R
    - Practice worksheet
category:
    - Statistics
...

> I've written this blog because I want to get a better understanding
> of how the foundation of most statistics, the variance, works and
> how it applies within the context of a simple linear regression.  I
> hope that this blog will also be useful for others learning about
> statistics.

# Load up the R packages and set up data #

If you don't know who [Hadley Wickham](http://had.co.nz/) (check out
his [GitHub repos](https://github.com/hadley)), you likely will know
more about him as time goes on because he is the author of several
*incredible* R packages, including [ggplot2](http://ggplot2.org/),
[dplyr](https://github.com/hadley/dplyr/blob/master/README.md), and
[tidyr](https://github.com/hadley/tidyr/blob/master/README.md), among
many others!  He also contributes to
[RStudio](http://www.rstudio.com/), which is a great platform to use R
on.  Anyway, I'm loading the below packages as I'll be using their
functions in this post.


{% highlight r %}
library(ggplot2) ## For the plots
library(dplyr) ## To use the %>% operator (other functions)
{% endhighlight %}

Next, I'll assign some variables into `x` and `y` to make later code
easier.  I'm also using the built in R dataset `airquality`.


{% highlight r %}
aq <- airquality %>%
    tbl_df()

x <- aq$Wind
y <- aq$Temp
{% endhighlight %}

# The goal: Show how variance works in linear regression #

The main goal here is to show how variance works in linear regression
and how easy a simple linear regression is calculate.  To get started,
the common formula used to denote a linear regression is:

\[ Y = \alpha + X\beta + \varepsilon \]

Another way to write it is:

$$ y = m + bx + e $$

Where *m* is the intercept and \(b\) is the slope.  The way the slope is
calculated is by
[*least squares*](http://en.wikipedia.org/wiki/Least_squares), which
minimizes the sum of the squared residuals (or error terms).  Bit by
bit I'll show how this formula is truly calculated, starting with the
variance.

# Spread in the data: The variance statistic #

The basic foundation to analyzing data and making comparisons or
making predictions essentially use how spread out the data are from
one another to make a conclusion.  So the formula for variance of $x$
is:

\[ \sigma_{x}^2 = var(x) = \frac{\sum_{i=1}^{n} (x - \bar{x})^2}{n-1} \]

If you take a look at the formula, you can see that as values of $x$
get further and further from the mean $\bar{x}$, the square will make
them larger and always positive.  So, the more spread out the data is
from the mean, the higher the value of $\sigma_{x}^2$, or the
variance, is.  If we code this in R, this would be:


{% highlight r %}
## Raw formula
sum(((x - mean(x)) ^ 2)) / (length(x) - 1)
{% endhighlight %}



{% highlight text %}
## [1] 12.41154
{% endhighlight %}



{% highlight r %}
## ... or as a function in base R
var(x)
{% endhighlight %}



{% highlight text %}
## [1] 12.41154
{% endhighlight %}

Unlike the standard deviation which I will talk about next, the
variance is difficult to visualize as it doesn't directly represent
the spread of the data.  It merely indicates to what degree it is
spread.  Nonetheless, we can plot the distribution of the data to get
a sense of the spread.


{% highlight r %}
qplot(x, geom = 'density')
{% endhighlight %}

![Visualising the variance in x.](/images/2015-03-17-variance-linear-regression/densityPlot-1.png) 

Since the variance is directionless, it would be nice to have some way
to indicate the degree to which a variable spreads in each univariate
direction.  This is where the standard deviation comes in.

# Standard deviation: Gives the direction and magnitude of spread #

The standard deviation derives from the variance statistic.  The
formula being very simple:

$$ \sigma_{x} = \sqrt{\sigma_{x}^2} $$

Or more directly:

$$ \sigma_x = \sqrt{\frac{\sum_{i=1}^{n}(x - \bar{x})^2}{n-1}} $$

Take some time to look at this formula and to understand it.  You can
see that because of the square root and the associated interpretation
that this $\sigma_x$ value operates about the mean, there is an
assumption that the data is spread equally about the mean.  Hence this
is why the standard deviation assumes a normal (or
[Gaussian](http://en.wikipedia.org/wiki/Gaussian_function))
distribution.  If the spread is unequal about the mean, the standard
deviation is not a useful statistic to use.  This concept will come
back into play later on.

So, the R code to calculate the standard deviation is:


{% highlight r %}
## Raw formula
sqrt(sum(((x - mean(x)) ^ 2)) / (length(x) - 1))
{% endhighlight %}



{% highlight text %}
## [1] 3.523001
{% endhighlight %}



{% highlight r %}
## Standard function in R
sd(x)
{% endhighlight %}



{% highlight text %}
## [1] 3.523001
{% endhighlight %}

And if we multiply two standard deviations together, we get the
variance!  In R `sd(x) * sd(x)` = `var(x)` = 12.4115385

Unlike the variance, the standard deviation can be visualized.


{% highlight r %}
ggplot() +
  geom_density(aes(x), fill = 'orange', alpha = 0.2) +
  geom_vline(aes(xintercept = mean(x)), linetype = 'dashed',
             colour = 'blue', size = 1.25) +
  geom_vline(aes(xintercept = c((mean(x) - sd(x)),
                                (mean(x) + sd(x)))),
             linetype = 'dotted', colour = 'blue', size = 1)
{% endhighlight %}

![Standardized spread: Standard deviation and mean of x.](/images/2015-03-17-variance-linear-regression/sdPlot-1.png) 

The variance and standard deviation are useful for univariate
statistics, but since the simple linear regression consists of two
variables, there needs to be statistics which take into consideration
spread *between* variables...

# The spread between two variables: Covariance #

Just like variance, the covariance is a value that indicates the
degree to which the spread between two variables is related or not.
The formula is similar to the variance, except for the additional of
another term:

$$ cov(x, y) = \sum_{i=1}^{n}\frac{(x_i - \bar{x}) (y_i - \bar{y})} {n - 1} $$

While this formula appears similar to the variance, the addition of
the $y$ term changes the interpretation quite substantially.  Take a
look at the formula.  The value of the covariance depends upon how
related the spread of $x$ and $y$ are to each other, and unlike the
variance, there can be negative covariance.  So:

* If $x$ tends to be more *positively* spread from the mean and at the
  same time $y$ tends to be more *negatively* spread from the mean,
  this gives the covariance a negative value (a positive times a
  negative equals a negative).  Likewise, a *positive* $x$ and a
  *positive* $y$ will give *positive* covariance.
* If $x$ and $y$ tend to spread far from the mean *together*, this gives
  a larger covariance.  As they spread less from the mean *together*,
  covariance will be lower.

Thus, the covariance is a measure of how related two variables are
with each... how much of a change in one variable will there also be a
change in another variable.  So, a covariance of zero means that there
is no relationship between the two variables.

Again, look at the formula.  In any given observation (or row), either
an $x$ or a $y$ is missing, the formula doesn't work.  So an
assumption of the covariance is that the data be complete cases (no
missingness).  Also, because the covariance values depend upon the
size of the values in $x$ and $y$, there is no 'standardized' way of
comparing across different variables.

The R code for calculating the covariance is:


{% highlight r %}
## Raw formula
sum((x - mean(x)) * (y - mean(y))) / (length(x) - 1)
{% endhighlight %}



{% highlight text %}
## [1] -15.27214
{% endhighlight %}



{% highlight r %}
## The function in R
cov(x, y)
{% endhighlight %}



{% highlight text %}
## [1] -15.27214
{% endhighlight %}

In fact, if we substitute the $y$ for $x$ in the formula above, we get
the variance!  And computed in R:


{% highlight r %}
cov(x, x)
{% endhighlight %}



{% highlight text %}
## [1] 12.41154
{% endhighlight %}



{% highlight r %}
var(x)
{% endhighlight %}



{% highlight text %}
## [1] 12.41154
{% endhighlight %}

Just like the variance, showing the covariance on a plot is
difficult.  However, a standard way to present bivariate information
is through a scatter plot.


{% highlight r %}
qplot(x, y, geom = 'point')
{% endhighlight %}

![Visualizing covariance: Scatter plot of x and y](/images/2015-03-17-variance-linear-regression/covPlot-1.png) 

However, just like variance, there needs to be a way to standardize
the covariance so that it is interpretable across different variables
and gives a sense of direction and magnitude.  As with the standard
deviation, there is the correlation statistic we can use.

# Standardized way of comparing two variables: The correlation #

In this case, the correlation statistic is known as the Pearson
correlation.  There are other types of correlations you can use, like
Spearman, but I won't get into that.  The formula for the Pearson
correlation is:

$$  \rho_{x,y} = \frac{\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum_{i=1}^n(x_i-\bar{x})^2\sum_{i=1}^n(y_i-\bar{y})^2}} $$

Take a good look at the formula.  Does something look familiar?  If
you notice, the top part is the same as the covariance and the bottom
part has two formulas for the variance (of both $x$ and $y$).  So, if
I re-write this formula to simplify it:

$$ \rho_{x,y} = corr(x, y) = \frac{cov(x, y)} {\sqrt{var(x) * var(y)}} $$

We could simplify it even more.  Do you remember what the square root
of the variance gives us?  The standard deviation!  So:

$$ corr(x, y) = \frac{cov(x, y)} {sd(x) * sd(y)} $$

Calculating the correlation in R is easy!


{% highlight r %}
## Raw formula without the sd()
cov(x, y) / (sqrt(var(x)) * sqrt(var(y)))
{% endhighlight %}



{% highlight text %}
## [1] -0.4579879
{% endhighlight %}



{% highlight r %}
## Raw formula with the sd() 
cov(x, y) / (sd(x) * sd(y))
{% endhighlight %}



{% highlight text %}
## [1] -0.4579879
{% endhighlight %}



{% highlight r %}
## Using the R function
cor(x, y)
{% endhighlight %}



{% highlight text %}
## [1] -0.4579879
{% endhighlight %}

Contrary to what may often be shown or thought, the correlation value
does not represent the slope between two variables.  The correlation
is simply a way to standardize the representation of how related two
variables are to each other, or rather how changes in one variables
are related to changes in another (without implying which changed
which).  You can see this from the formula.

So, how does this fit in with linear regression??

# Linear regression: Incorporating correlation and variance #

Bringing the formula for the linear regression back down from above,
the simplest equation is:

$$ Y = \alpha + X\beta + \varepsilon $$

Based on least squares estimation, the line of best fit in the simple
linear regression case can be calculated as:

$$ \beta = \frac{\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}{\sum_{i=1}^n(x_i-\bar{x})^2} $$

If you'll notice, the formula on the top is the covariance and on the
bottom is the variance of $x$.  So, we can simplify:

$$ \beta = \frac{cov(x, y)} {var(x)} = \frac{cov(x,y)}{sd(x) * sd(x)}$$

And if we add the standard deviation of y to the top and bottom we get:

$$ \beta = \left( \frac{cov(x,y)}{sd(x) \times sd(y)} \right) \times \frac{sd(y)}{sd(x)} $$

What does the left side of the division equation look like?  It is the
formula for the correlation!  So we can simplify it to show the role
of the correlation in linear regression:

$$ \beta = \rho_{x,y} \times \frac{\sigma_y}{\sigma_x} $$

Then, $\alpha$ can be calculated by simply solving the equation
$\alpha = \bar y - \beta \bar x$.

Knowing the formulas for how these statistics are calculated can give
you some insight into why they have the assumptions that they do.  For
instance, since the least squares approach minimizes the sum of the
squared *residuals* (ie: the variance of the residuals), this suggests
that the residuals should be approximately normally distributed.  But
because the residuals are calculated based on the covariance of $x$
and $y$, this suggests that the covariance should be normally
distributed... and not the univariate distributions (a common
misconception)!

Likewise, since it is a *line* of best fit, linear regression is for
linear relationships.  Not *non*-linear ones.

So, with the R code:


{% highlight r %}
## Raw formula
cov(x, y) / var(x)
{% endhighlight %}



{% highlight text %}
## [1] -1.230479
{% endhighlight %}



{% highlight r %}
## If we want to generalize it a bit more, expanding it gets:
(cov(x, y) / (sd(x) * sd(y))) * (sd(y) / sd(x))
{% endhighlight %}



{% highlight text %}
## [1] -1.230479
{% endhighlight %}



{% highlight r %}
## Which allows us to use the correlation
cor(x, y) * (sd(y) / sd(x))
{% endhighlight %}



{% highlight text %}
## [1] -1.230479
{% endhighlight %}



{% highlight r %}
## Compare to the linear regression function:
coef(lm(y ~ x))[2]
{% endhighlight %}



{% highlight text %}
##         x 
## -1.230479
{% endhighlight %}



{% highlight r %}
## Calculating the intercept:
b <- cor(x, y) * (sd(y) / sd(x))
mean(y) - (b * mean(x))
{% endhighlight %}



{% highlight text %}
## [1] 90.13487
{% endhighlight %}



{% highlight r %}
## Compared to the lm:
coef(lm(y ~ x))[1]
{% endhighlight %}



{% highlight text %}
## (Intercept) 
##    90.13487
{% endhighlight %}

And in this case, it is easy to plot the linear regression line.


{% highlight r %}
qplot(x, y, geom = c('point', 'smooth'), method = 'lm')
{% endhighlight %}

![Linear regression line](/images/2015-03-17-variance-linear-regression/regPlot-1.png) 

A nifty thing about linear regression and it's use of the correlation
is that based on the formula, when $x$ and $y$ are scaled (centered
and standardized) with a mean of 0 and a standard deviation of 1, the
correlation coefficient **is** the linear regression estimate!  That's
because, looking at the formula above, the `sd(x)` = 1 and `sd(y)` =
1, so they cross out, leaving the correlation coefficient! Check it in
R:


{% highlight r %}
## Scale the data
s.x <- scale(x)
s.y <- scale(y)

## Check it!
cor(s.x, s.y)
{% endhighlight %}



{% highlight text %}
##            [,1]
## [1,] -0.4579879
{% endhighlight %}



{% highlight r %}
cor(s.x, s.y) * (sd(s.y) / sd(s.x))
{% endhighlight %}



{% highlight text %}
##            [,1]
## [1,] -0.4579879
{% endhighlight %}



{% highlight r %}
coef(lm(s.y ~ s.x))[2] %>% signif(7)
{% endhighlight %}



{% highlight text %}
##        s.x 
## -0.4579879
{% endhighlight %}


{% highlight r %}
qplot(s.x, s.y, geom = c('point', 'smooth'), method = 'lm')
{% endhighlight %}

![Scaled variables and linear regression line](/images/2015-03-17-variance-linear-regression/scaleRegPlot-1.png) 

# To conclude: #

In conclusion, what I've learned from getting more into understanding
the basics is a new found appreciation of statistics and a better
sense of what the numbers mean.  I think that it's important to at
least understand what the formulas mean.  I don't think it's important
to memorize them, but definitely to appreciation what the formulas
can, and *can't*, do.

Anyway, I hope to do more of these blogs in the future.  Stay tuned!

