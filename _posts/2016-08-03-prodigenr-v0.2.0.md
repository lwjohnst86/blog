---
layout: post
title: "Standardized project generation: the prodigenr R package"
category:
    - R
tag:
    - R
    - Packages
---



Academic researchers need to write up abstracts for conferences or submits
manuscripts to journals. Often, each abstract, manuscript, or presentation is
created ad hoc and may not have much structure to the files and folders, making
it harder to come back to after a few months, harder to reproduce the results,
and harder for others to look over the work. I developed the R package
[prodigenr](https://cran.r-project.org/package=prodigenr) to make this step
automated and to help make the project adhere to reproducible analytic
guidelines.

`prodigenr`, or *pro*ject *di*rectory *gen*erator, simplifies the process of
creating these new projects and can help make your workflow more reproducible.
Standard files and folders are created for specific projects (e.g. abstracts or
manuscripts), along with a workflow that tries to be simple and easy to use,
while making use of the infrastructure and processes already well-developed and
maintained (e.g. RStudio and devtools).

## The main command: `prodigen`

To use `prodigenr`, you simply need to use the `prodigen` command. At present,
there are only four template projects that you can view using:


{% highlight r %}
library(prodigenr)
template_list
{% endhighlight %}



{% highlight text %}
#> [1] "abstract"   "manuscript" "poster"     "slides"
{% endhighlight %}

These templates are projects that an academic (biomedical at least) researcher
typically encounters. However, if you have a suggestion or want to add a
template, please create a
[Github issue](https://github.com/lwjohnst86/prodigenr/issues) or submit a [Pull Request](https://github.com/lwjohnst86/prodigenr/pulls)!

Starting a manuscript? Create a project directory like so (as well as using [Git](https://git-scm.com/)):


{% highlight r %}
path <- tempdir() # temporary directory.
prodigen('manuscript', 'ManuscriptName', path, git.init = TRUE)
{% endhighlight %}

The resulting file structure should look something like this:


{% highlight text %}
.
├── R
│   ├── fetch_data.R
│   ├── functions.R
│   ├── load_data.R
│   └── setup.R
├── doc
│   └── manuscript.Rmd
├── vignettes
│   └── extra-analyses.Rmd
├── .Rbuildignore
├── .gitignore
├── DESCRIPTION
├── ManuscriptName.Rproj
├── NAMESPACE
└── README.md

3 directories, 12 files
{% endhighlight %}

A `README.md` file is contained within each project that explains more about
what each folder does and what some of the files do that were created. This file
structure is the same used for making R packages and makes heavy use of
[`devtools`](https://cran.r-project.org/package=devtools) as this way of
structuring code is well established and extensively used.

A typical workflow (also outlined in the `README.md`) when using RStudio would be to:

1. Write up your background, methods, results, and discussion in the abstract,
poster, slides, or manuscript `.Rmd` 
([R Markdown](http://rmarkdown.rstudio.com/)) file in the `doc/` folder.
2. Any piece of code you use more than once or is fairly complex, convert it
into a function. Put this new function into a file (or the `functions.R` file) the
`R/` directory. Load that function using `devtools::load_all()` (Ctrl-Shift-L).
3. Fetch and wrangle your data in the `R/fetch_data.R` and to use the data, load
it using `load_data()`.
4. Use the Rmd files in the `vignettes/` folder to add analyses that will
supplement the main document, but aren't necessary to be included.
5. Knit the `.Rmd` file in `doc/`. You now have your final abstract, poster,
slides, or manuscript to use for your research.

The ideal end goal of each research project is to be as self contained as
possible. So that if you ever need to go back to the analysis, it is easy to
re-run the code and get the results that you say you got. This is especially
useful if others such as reviewers ask for something or want to confirm your
results. For more information on good practices to use in making an analysis
project, see
[here](http://stats.stackexchange.com/questions/2910/how-to-efficiently-manage-a-statistical-analysis-project)
or 
[here](http://www.r-bloggers.com/managing-a-statistical-analysis-project-%E2%80%93-guidelines-and-best-practices/).

> Note: This is a slightly modified version of the introduction vignette for
prodigenr ([`vignette('introduction')`](https://htmlpreview.github.io/?https://github.com/lwjohnst86/prodigenr/blob/master/vignettes/introduction.html) from version 0.3.0).
