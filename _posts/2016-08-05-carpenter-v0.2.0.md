---
layout: post
title: "Building tables using the carpenter R package"
category:
    - R
tag:
    - R
    - Packages
---



In biomedical research, there are certain types of tables that are often 
included in the article. For instance, some basic statistics between the treatment
and control group. Or maybe it is between males and females, before and after an
intervention, and so on. Often these tables are a hassle to create and are prone to
needing updates based on slight changes in the data or from reviewer comments.
I can't stand doing these repetitive and simple tasks by hand, so I designed
carpenter to make creating these tables easily.

## Using carpenter and building a table

The underlying design principal for carpenter is that you create an outline of
what the table should look like before finally creating the table. This is how
carpenters also work: they sketch what the product will look like before
actually starting to build anything. There are four 'outlining' functions,
several carpenter statistics functions, and one final 'building' function:

- `outline_table()` starts the outlining process.
- `add_rows()` adds variables to the row or rows with associated descriptive
statistics.
- `stat_*()` type statistic functions to be used with `add_rows()` (a list of
available statistics can be found using `?carpenter::table_stats`).
- `renaming()` for customizing the naming of the rows and table headers.
- `build-table()` for finally building the table (uses the
[`pander`](http://rapporter.github.io/pander/) package).

These functions are chained together using the wonderful 
[magrittr](https://cran.r-project.org/package=magrittr) `%>%` pipe. If you've
never used this package or the pipe, take a look at the vignette on introducing
it. So, let's do some coding:


{% highlight r %}
library(magrittr)
library(carpenter)
head(iris)
{% endhighlight %}



{% highlight text %}
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1          5.1         3.5          1.4         0.2  setosa
#> 2          4.9         3.0          1.4         0.2  setosa
#> 3          4.7         3.2          1.3         0.2  setosa
#> 4          4.6         3.1          1.5         0.2  setosa
#> 5          5.0         3.6          1.4         0.2  setosa
#> 6          5.4         3.9          1.7         0.4  setosa
{% endhighlight %}



{% highlight r %}
outline_table(iris, 'Species') 
{% endhighlight %}



{% highlight text %}
#> # A tibble: 0 x 0
{% endhighlight %}

You'll notice that the `outline_table` function returned a `tibble` of 0 rows
and 0 columns. That's because we haven't added anything else to the table!
carpenter is waiting for more information. So we add rows by:


{% highlight r %}
outline_table(iris, 'Species') %>% 
    add_rows('Sepal.Length', stat_meanSD) 
{% endhighlight %}



{% highlight text %}
#> # A tibble: 1 x 4
#>      Variables    setosa versicolor virginica
#>          <chr>     <chr>      <chr>     <chr>
#> 1 Sepal.Length 5.0 (0.4)  5.9 (0.5) 6.6 (0.6)
{% endhighlight %}

You see it has now added a row to the table. Adding more rows:


{% highlight r %}
outline_table(iris, 'Species') %>% 
    add_rows(c('Sepal.Length', 'Petal.Length'), stat_meanSD) %>%
    add_rows('Sepal.Width', stat_medianIQR) 
{% endhighlight %}



{% highlight text %}
#> # A tibble: 3 x 4
#>      Variables        setosa    versicolor     virginica
#>          <chr>         <chr>         <chr>         <chr>
#> 1 Sepal.Length     5.0 (0.4)     5.9 (0.5)     6.6 (0.6)
#> 2 Petal.Length     1.5 (0.2)     4.3 (0.5)     5.6 (0.6)
#> 3  Sepal.Width 3.4 (3.2-3.7) 2.8 (2.5-3.0) 3.0 (2.8-3.2)
{% endhighlight %}

See how this can make creating these tables very easy. Let's remove the `.` from
the row names and fix up the table header names:


{% highlight r %}
tab <- outline_table(iris, 'Species') %>% 
    add_rows(c('Sepal.Length', 'Petal.Length'), stat_meanSD) %>%
    add_rows('Sepal.Width', stat_medianIQR)  %>% 
    renaming('header', c('Measures', 'Setosa', 'Versicolor', 'Virginica')) %>% 
    renaming('rows', function(x) gsub('\\.', ' ', x))
tab
{% endhighlight %}



{% highlight text %}
#> # A tibble: 3 x 4
#>       Measures        Setosa    Versicolor     Virginica
#>          <chr>         <chr>         <chr>         <chr>
#> 1 Sepal Length     5.0 (0.4)     5.9 (0.5)     6.6 (0.6)
#> 2 Petal Length     1.5 (0.2)     4.3 (0.5)     5.6 (0.6)
#> 3  Sepal Width 3.4 (3.2-3.7) 2.8 (2.5-3.0) 3.0 (2.8-3.2)
{% endhighlight %}

And finally build the table into a Markdown format for easy insertion into 
[R Markdown documents](http://rmarkdown.rstudio.com/):


{% highlight r %}
build_table(tab)
{% endhighlight %}



| Measures     |    Setosa     |  Versicolor   |   Virginica   |
|:-------------|:-------------:|:-------------:|:-------------:|
| Sepal Length |   5.0 (0.4)   |   5.9 (0.5)   |   6.6 (0.6)   |
| Petal Length |   1.5 (0.2)   |   4.3 (0.5)   |   5.6 (0.6)   |
| Sepal Width  | 3.4 (3.2-3.7) | 2.8 (2.5-3.0) | 3.0 (2.8-3.2) |

If you have factor/discrete data, you can even use include these variables:


{% highlight r %}
library(dplyr)
mtcars %>% 
    mutate(
        gear = as.factor(gear),
        vs = as.factor(vs)
    ) %>% 
    outline_table('vs') %>% 
    add_rows('mpg', stat_meanSD) %>%
    add_rows('drat', stat_medianIQR) %>% 
    add_rows('gear', stat_nPct) %>% 
    renaming('header', c('Measures', 'V-engine', 'Straight engine')) %>% 
    renaming('rows', function(x) x %>% 
                 gsub('drat', 'Read axle ratio', .) %>% 
                 gsub('mpg', 'Miles/gallon', .) %>% 
                 gsub('gear', 'Number of gears', .)) %>% 
    build_table()
{% endhighlight %}



| Measures        |   V-engine    |  Straight engine  |
|:----------------|:-------------:|:-----------------:|
| Miles/gallon    |  16.6 (3.9)   |    24.6 (5.4)     |
| Read axle ratio | 3.2 (3.1-3.7) |   3.9 (3.7-4.1)   |
| Number of gears |               |                   |
| - 3             |  12 (66.7%)   |     3 (21.4%)     |
| - 4             |   2 (11.1%)   |    10 (71.4%)     |
| - 5             |   4 (22.2%)   |     1 (7.1%)      |

Pretty easy eh?

Sometimes, though, you don't need to compare multiple columns, but instead need
to only show one column. Easy, just don't include a header in the
`outline_table()`!


{% highlight r %}
iris %>% 
    outline_table() %>% 
    add_rows('Sepal.Length', stat_meanSD) %>%
    add_rows('Sepal.Width', stat_medianIQR) %>% 
    renaming('header', c('Measures', 'Values')) %>% 
    build_table() 
{% endhighlight %}



| Measures     |    Values     |
|:-------------|:-------------:|
| Sepal.Length |   5.8 (0.8)   |
| Sepal.Width  | 3.0 (2.8-3.3) |

> Note: This is a slightly modified version of the introduction vignette for
carpenter
([`vignette('carpenter')`](https://htmlpreview.github.io/?https://github.com/lwjohnst86/carpenter/blob/master/vignettes/carpenter.html)
from version 0.2.0). Presently, carpenter only creates
tables that you would typically see as the 'basic characteristics' or
'descriptive statistics' table in most biomedical articles. The plan is to
include other common table structures, but they haven't been implemented yet. If
you have any suggestions, let me know as an
[Issue](https://github.com/lwjohnst86/carpenter/issues/new)!
