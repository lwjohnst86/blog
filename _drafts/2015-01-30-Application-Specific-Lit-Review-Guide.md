---
layout: post
title: "An application specific step-by-step guide to doing a
    literature review/search"
date: 2015-01-30
category: [Science, Statistics]
tags: [JabRef, Docear, references, literature review, literature search]
...

# Contents: #

* [Brief guide](#brief-step-by-step-guide)
* [Detailed guide](#detailed-step-by-step-guide)

# Why write this guide? #

What's the point in writing this blog/guide on doing a literature
search (aka. lit reviews)?  The main reason I have for writing this
guide is rather selfish... I want to externalize my memory of my own
work flow for doing literature searches.  There are many detailed
steps involved in preparing for the literature search, using the
academic search engines, extracting the articles of interest,
downloading the pdf, inputting them into the reference manager,
cleaning the references up in the manager, and storing notes as I read
through these articles.  This is actually a lot more tedious and
detailed than doing a "simple" literature search may
seem... Especially if you want to be systematic about it.

Initially, I had worked out (over many trials and errors) a workflow
for doing lit reviews.  But!  I didn't write the workflow down (I
know, tsk tsk)...  And because I don't do lit reviews *that*
frequently, I forgot how I set up my workflow from the last time.
Which is why I decided that I needed to write it down.  This blog post
is an expanded and elaborated explanation of my workflow.

The second reason why I am writing this guide is for those interested
in the *precise* workflow a researcher (myself!) may take.  This is
because when I first started doing literature reviews in my MSc, I
searched online for how other researchers do it.  However, I found
next to nothing on the *detailed* process for the nitty gritty of
doing lit reviews.  While there were several that I found helpful for
the general concept of it (see
[here](http://www.writing.utoronto.ca/advice/specific-types-of-writing/literature-review),
[here](http://libguides.uwf.edu/content.php?pid=220792&sid=1836962),
[here](http://www.reading.ac.uk/internal/studyadvice/StudyResources/Essays/sta-startinglitreview.aspx),
or
[here](http://phdtalk.blogspot.ca/2014/03/top-3-tips-for-literature-review-success.html)),
I wanted to know *exactly* how some people did it.  So I am writing
this to give others an idea of how lit reviews may be done.

**Caveat**: This is an application specific detailed guide... As would
be expected given that this is a **detailed** guide.

## Applications used in this guide ##

As the main title states, this is an application specific guide.  I
use the following applications for this guide and for my own lit
searches:

* Firefox (or any other web browser)
* [JabRef](http://jabref.sourceforge.net/) --- at least v. 2.10
* [Docear](http://www.docear.org/) --- at least v. 1.03

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

-----

# Brief step-by-step guide #

1. Develop search terms, using PubMed and MeSH to refine
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
9. Delete `Month, Note, File, Institution` fields using
    "Search -> Set/clear/rename fields"
10. Mark entries based on priority and relevance to project (`Ctrl-M`;
    darker = most relevant)
11. Download PDF for the marked articles using
    [Christoph Lehner's plugin for JabRef](http://www.lhnr.de/ext/)
    - If it doesn't work, manually download using the DOI link or
      Google, renaming the pdfs by the BibKey and move them into the
      `article/` folder (in the folder or up one from the `myref.bib`
      file)
12. Run "Search -> Synchronize file links"
13. Run "Tools -> Clean up entries"
14. Confirm rename worked; if not, fix and re-do steps 22 and 23
15. Delete `File` field (as in step 9)
16. Run "Search -> Synchronize file links"
17. Import the pdfs into Docear
18. Move articles into their relevant branches/mindmap
19. Read the articles and make comments
20. Import the annotations
21. Move the read article into the read branch
22. Repeat steps 19-21

----

# Detailed step-by-step guide #

## A. Firefox (or other browser)

1. Develop *a priori* search terms for searching PubMed or other
   article search engine.
1. Use PubMed and MeSH to refine the terms to capture an appropriate
   and relevant number of articles.
       - Obviously too many or too few articles are never a good
         thing.
2. Using the search terms, run a search of PubMed and check the number
   of hits the search terms retrieved.
3. Record the number of hits in a plain text file or some other
   location, preferably in the same parent directory as your research
   project for a manuscript.

## B. JabRef --- Use your master `.bib` file, or create a new reference database

### --- Article search and selection

1. Paste the search terms developed above into the Web Search
   plugin/utility (usually on the sidepane), using Medline as the
   search engine, and hit the `Fetch` button.
2. Check the number of hits and compare to the hits from the PubMed
   search.
3. Record date of search and number of hits somewhere, preferably in
   the same directory as your research project.
       - Sometimes, the Web Search doesn't like some of the search
         terms and just doesn't search using them.  This can result in
         differences in the number of hits.
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







