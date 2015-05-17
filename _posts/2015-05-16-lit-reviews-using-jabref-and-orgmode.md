---
layout: post
title: "A guide to using Jabref and Org-mode to search, store, and
    summarise published literature"
tags:
    - JabRef
    - org-mode
    - emacs
    - references
    - literature review
    - reference management
    - literature search
    - workflow
categories:
    - Science
    - Statistics
...

> This is updated from my previous post
> [here](/Application-Specific-Lit-Review-Guide/).

## Contents: ##

* [Brief guide](#brief-step-by-step-guide)
* [Detailed guide](#detailed-step-by-step-guide)

-----

I wrote this post to mainly externalize my memory, but also because I
believe it's important to make it public how a typical workflow looks
like for a researcher.  This helps not only the person writing the
post (now I can always refer back to this post to remember how the
workflow is if I ever forget), but it also helps those new to do
research and who don't know how or where to start, what is an
efficient way of doing things, and what some best practices are.  It
was difficult for me when I first started and I also had a hard time
finding out how others do it since there are few, if any, resources
for how to *exactly* do your reference searches, storage, management,
and review.  Writing up how your workflow is (for anything really, not
just reference management/reviews) also makes it more systematic and
thus more replicable.

For some other helpful resources, see
[here](http://www.writing.utoronto.ca/advice/specific-types-of-writing/literature-review),
[here](http://libguides.uwf.edu/content.php?pid=220792&sid=1836962),
[here](http://www.reading.ac.uk/internal/studyadvice/StudyResources/Essays/sta-startinglitreview.aspx),
or
[here](http://phdtalk.blogspot.ca/2014/03/top-3-tips-for-literature-review-success.html)).
You can also see how I lay out my files and folders on my
[GitHub bibliography repo](https://github.com/lwjohnst86/bibliography)

## Applications I use ##

I use the following applications for this guide and for my own lit
searches:

* Firefox (or any other web browser)
* [JabRef](http://jabref.sourceforge.net/) --- at least v. 2.10
* [Emacs'](http://www.gnu.org/software/emacs/) [Org-mode](http://orgmode.org/)

[JabRef](www.jabref.scourceforge.net) is a reference manager that uses
the BibTeX format to store references.  I use [pandoc and markdown]()
to create my manuscripts and/or reports so I need a program that can
read `.bib` files.  The nice thing about JabRef is that all the
customizations and editting of the references are done to the `.bib`
reference file, which means that edits and formatting I do to the
`.bib` file is independent of the computer.  JabRef is also
cross-platform, which is important for me since I use Linux.

Now I know that JabRef has a section to keep notes, however, these
notes are really only assessible via selecting the article and moving
to the "Reveiw" tab.  I've also gotten very comfortable to whizzing
through a text file using Emacs and Vim-keybindings (it makes me much
more productive), and JabRef just doesn't have those capabilities.
Combined with the keybindings, [Emac's Org-mode](http://orgmode.org/)
is an extremely powerful tool for organizing notes.  So I use Org-mode
to summarize and take notes on articles that I'm reading.

Originally I used [Docear](http://www.docear.org/) as well, however it
really started to interrupt my workflow, change my reference database
occasionally because integrates with JabRef version 2.7 while I use
JabRef version 2.10 and strange things sometimes happen.  Docear also
didn't fit into my 'plain text-use emacs with vim keybindings-keep
things lean' workflow as Docear tries to be too many things without
being good as any one of them.  So I replaced Docear for Org-mode to
take notes and summarize articles. 

I have structured this guide into two parts:

1. A brief, concise guide.
2. A detailed, descriptive guide.

-----

# Brief step-by-step guide #

1. Develop search terms, using PubMed and MeSH to refine (Include into
   the `org-mode` `searches.org` file)
2. Use the terms in the "Web Search" field in JabRef
3. Compare and record number of hits between PubMed and JabRef
    - If JabRef's Web Search complains or the hits are different, use
      [PubMed to output to XML](http://wiki.epfl.ch/indexing/bibtex)
      and import into JabRef (`Ctrl+I`)
4. Sort hits by year
5. Search through and select relevant articles, checking for duplicates
6. Import into database
7. Select all imported articles and add relevant keywords using "Edit
    -> Manage keywords"
8. Run "Tools -> Clean up entries"
9. Delete `Month, Note, File, Institution` fields using "Search ->
    Set/clear/rename fields"
10. Mark entries based on priority and relevance to project (`Ctrl-M`;
    darker = most relevant)
11. Read through the article and record comments in the `notes.org`
    file
12. After reading the article, make a note that it was read in JabRef
    and record important information into tables in the `tables.org`
    file so that the notes are briefly summarized and articles can be
    quickly scanned for information

-----

# Detailed step-by-step guide #

## A. Firefox (or other browser) ##

1. Develop *a priori* search terms for searching PubMed or other
   article search engine.
1. Use PubMed and MeSH to refine the terms to capture an appropriate
   and relevant number of articles.
       - Obviously too many or too few articles are never a good
         thing.
2. Using the search terms, run a search of PubMed and check the number
   of hits the search terms retrieved.
3. Record the number of hits in a plain text file (eg. `searches.org`)
   or some other location, preferably in the your bibliography
   directory or in your directory where you will write your research
   manuscript.

## B. JabRef --- Use your master `.bib` file, or create a new reference database ##

### --- Article search and selection ###

1. Paste the search terms developed above into the Web Search
   plugin/utility (usually on the sidepane), using Medline as the
   search engine, and hit the `Fetch` button.
2. Check the number of hits and compare to the hits from the PubMed
   search.
3. Record date of search and number of hits somewhere, preferably in
   the same directory as your research project.
   - Sometimes, the Web Search doesn't like some of the search terms
     and just doesn't search using them.  This can result in
     differences in the number of hits.  In this case, search using
     PubMed (more reliable) and output the search results into XML via
     the "Send to: -> File -> XML" option below/near the "Search" and
     "Filters:" buttons.  Import the XML into JabRef using `Ctrl-I`.
4. Sort results by year.
5. Search through articles, selecting (checking the check box) only
   relevant onces to be imported; check for duplicates.
6. Import into the current database (or a new one).

### --- Cleaning the imported files ###

1. Select all the imported references, go to the `Edit` menu at the
   top, and click `Manage keywords`.
2. Add appropriate keywords, for instance topics that the articles
   represent (e.g. Diabetes), the relevant project that the articles
   are linked to (e.g. course assignment or manuscript), or any other
   descriptive keywords.
3. Under the `Tools` menu, click `Clean up entries`.  Sometimes the
   articles have been messily imported and this will clean it up.
4. In the `Search` menu, click `Set/clear/rename fields`; type in
   `Month, Note, File, Institution` at the top of the dialog box,
   select the `Clear fields` option, and click OK.

### --- Marking by importance and downloading pdf ###

1. Search through articles and based on their title and abstract, mark
   (`Ctrl-M` in JabRef) the articles according to how relevant the
   article is and how soon the article should be read.  The darker the
   colour, the more relevant it is.

## 3. Org-mode --- Read the article and record notes ##

1. Reading through the article, use org-mode to write up notes and
   comments in the `notes.org` file about the article that may be
   important for your particular project.
   - Use org-heading level 1 (*) for a keyword specific to the project
     (eg. Diabetes and Exercise).
   - Use org-heading level 2 (**) for the author and year
     (eg. Smith2015).
2. Once finished reading the article, make a note that it has been
   read in the JabRef file under the 'Review' tab.
3. Go into the `tables.org` and make a new row in the org-table.
   Record some simple, but important, aspects of the article so that
   it is easier to quickly scan the articles you've read.
   - Use org-heading level 1 (*) for a keyword specific to the
     project (eg. Cardiovascular disease and diet).
   - Use org-heading level 2 (**) to describe the table within
     (eg. 'Study methods' or 'Findings' or 'Model covariates').

# Final comments #

That is all for now.  Writing this helps me to remember my workflow
and I hope that in some way it helps others too!

