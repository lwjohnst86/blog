---
layout: post
title: "An application specific step-by-step guide to doing a
    literature review/search"
date: 2015-01-02
category: [Science, Statistics]
tags: [JabRef, Docear, references, literature review, literature search]
...

I have several reasons for writing up this guide.  My primary reason
was that I wanted to, basically, externalize my memory.  I have been
doing literature searches for a while, particularly at the start of my
MSc program, when I got frustrated with how tedious it sometimes got.
I went through a number of iterations on how to become more efficient
at it, but never thought of writing down the precise process to do it.
After not doing a literature search for a while, I realized that I had
forgotten how to do certain steps that I developed previously.  That
is when I decided to write it down.

My second reason is that I hope to eventually provide this to my
future graduate students or to others.  When I began my MSc, I
searched repeatedly online for information on how other scientists do
their literature searches.  So the second reason is I am making this
guide for those who would like to know the exact procedure that I take
when doing a literature search, to help them get an idea on how others
do it to help inform or develop their own way.

## Applications used in this guide ##

As the main title states, this is an application specific guide.  I
use the following applications for this guide and for my own lit
searches:

* Firefox (or any other web browser)
* JabRef --- at least v. 2.10
* Docear --- at least v. 1.03

[JabRef](www.jabref.scourceforge.net) is a reference manager that uses
the BibTeX format to store references.  I use LaTeX and pandoc to
create my manuscripts and/or reports so I need a program that can read
`.bib` files.  The nice thing about JabRef is that all the
customizations and editting of the references are done to the `.bib`
reference file, which means that edits and formatting I do to the
`.bib` file is independent of the computer.  Meaning I can just take
the single, *plain text* file with me wherever and I have the entire
bibliography and formats in one place.  JabRef is also available on
Linux, which I use.

[Docear](www.docear.org) is a great, fairly recent application that
combines the power of mindmaps with the power of pdf annotating
(i.e. highlighting and commenting).  It imports annotations from
article pdfs into the mindmap, allowing a visual representation of
your ideas and how research articles fit into your ideas and research.
Docear is also Java-based and uses JabRef as a backend for the
references.

I have structured this guide into two parts:

1. A brief, concise guide.
2. A detailed, descriptive guide.

# Brief step-by-step guide #

1. Develop search terms
2. Use PubMed and MeSH to refine the terms
3. Input the terms into the Web Search in JabRef, searching Medline
4. Make sure the number of hits from JabRef are similar to PubMed
5. Record hits in text editor (eg. in `searchStrategies.md` file)
6. Sort by year
7. Search through articles, deselecting non-relevant articles
8. Check for duplicates
9. Import into database
10. Select all files and add relevant keywords to "Manage keywords"
    under Edit
11. Run "Clean up entries" under Tools
12. Delete "Month", "Note", "File", and "Institution" fields using
    "Set/clear/rename fields" under the Search menu
13. Search through and mark articles that are higher priority to be read
14. Mark entries based on priority and relevance to project (Ctrl-M in JabRef)
15. Darkest colour (red) is the most relevant and important
16. Lightest is the least relevant and important
17. No mark articles are there as they may be important later on, or
    the article is interesting but not relevant to the project
18. Download PDF for the higher priority articles
19. If download doesn't work, click the DOI button and manually download
20. If manually downloaded, go to Downloads folder and rename the pdfs
    by the BibKey
21. Move Downloaded pdfs into the article folder
22. Run "Synchronize file links" under Search
23. Run "Clean up entries"
24. Check articles in articles folder to make sure there are none left
25. If some are left, rename the pdf, synchronize, and run clean up again.
26. Delete "File" field
27. Run "Synchronize file links"
28. Once articles have been downloaded, import the articles into Docear
29. Move articles into their relevant branches.
30. Read the articles, comment, highlight, etc.
31. Import the annotations
32. Move the read article into the relevant mindmap and into the read branch

----

# Detailed step-by-step guide #

## A. Pen and paper, or plain text editor

1. Develop a priori search terms for searching PubMed or other article
   search engine.

## B. Firefox (or other browser)

1. Use PubMed and MeSH to refine to the terms to capture an
   appropriate and relevant number of articles.
2. Using the search terms, run a search of PubMed and check the number
   of hits the search terms retrieved.
3. Paste the search terms developed into a Docear mindmap branch.

## C. JabRef --- Open master `.bib` file, or create a new reference database

### --- Article search and selection

1. Paste the search terms developed above into the Web Search
   plugin/utility (usually on the sidepane), using Medline as the
   search engine, and hit the `Fetch` button.
2. Check the number of hits and compare to the hits from the PubMed
   search.
3. Record date of search and number of hits in the Docear mindmap, as
   a branch of the search terms.
4. Sort results by year.
5. Search through articles, selecting (checking the check box) only
   relevant onces to be imported; check for duplicates.
6. Import into current database.

### --- Cleaning imported files

1. Select all imported references, go to the `Edit` menu at the top,
   and click `Manage keywords`.
2. Add appropriate keywords, e.g. topics that the articles represent
   (e.g. Diabetes), relevant project that the articles are linked to
   (e.g. course assignment or manuscript), or any other descriptive
   keywords.
3. Under the `Tools` menu, click `Clean up entries`.
4. In the `Search` menu, click `Set/clear/rename fields`; type in
   "Month, Note" at the top of the dialog box, select the `Clear
   fields` option, and click OK.

### --- Marking by importance and downloading pdf

1. Search through articles and read up







