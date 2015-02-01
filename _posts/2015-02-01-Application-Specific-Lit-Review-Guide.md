---
layout: post
title: "An application specific step-by-step guide to doing a
    literature review/search"
date: 2015-02-01
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
know, tsk tsk)...  And because I don't do lit reviews/searches *that*
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

## A. Firefox (or other browser) ##

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

### B. JabRef --- Use your master `.bib` file, or create a new reference database ###

### --- Article search and selection ###

1. Paste the search terms developed above into the Web Search
   plugin/utility (usually on the sidepane), using Medline as the
   search engine, and hit the `Fetch` button.
2. Check the number of hits and compare to the hits from the PubMed
   search.
3. Record date of search and number of hits somewhere, preferably in
   the same directory as your research project.
       - Sometimes, the Web Search doesn't like some of the search
         terms and just doesn't search using them.  This can result in
         differences in the number of hits.  In this case, search
         using PubMed (more reliable) and output the search results
         into XML via the "Send to: -> File -> XML" option below/near
         the "Search" and "Filters:" buttons.  Import the XML into
         JabRef using `Ctrl-I`.
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
2. Use [Christoph Lehner's excellent plugin](http://www.lhnr.de/ext/)
   to download the pdf *from within JabRef*, rename the file, and save
   it in the pdf directory set in the JabRef settings automatically,
   all by just clicking the `Journal pdf` button!
       - Sometimes journals are behind a paywall (damn closed access),
         so if you have institutional access, just download the pdf
         manually, rename it to match the BibKey, and move it into the
         `articles/` folder.
3. Once all your relevant pdfs have been downloaded, run `Synchronize
   file links` in the `Search` Menu, then `Clean up entries` in the
   `Tools` menu.
4. Confirm that the rename worked.  If not, it is likely a file name
   issue, so fix that and do the above again.
5. Delete the `File` field in the selected articles using the
   `Set/clear/rename fields` options in the `Search` menu to fix the
   file link in the articles.  Sometimes JabRef doesn't rename the
   file link, but does rename the file itself.
6. Re-run `Synchronize file links`.

## B. Docear --- Use your main mindmap to import new pdf files ##

1. In Docear's main `literature_and_annotations.mm` file, use the
   "Reload monitored folder" button to search the `articles/` folder
   as set in the options and import new pdfs.
2. Move the imported articles into a branch that is relevant to the
   project.  At this point, you have a few options.  One is to use the
   main mindmap to import the annotations into, or another option is
   to make a new mindmap specific to your project, move the articles
   over into that mindmap and read them from there (this is the option
   I use).
3. Read the articles, make comments, highlight text and so on.  Once
   done, right-click the article, select `PDF -> Import all
   annotations`.
4. Move the read article into a new branch called `Read`, or something
   similar.
5. Repeat until all articles are read.

# Final comments #

That is all for now. I know this is fairly detailed, but it helps me
remember my workflow and I hope that in some way helps you, the
reader, to make your own workflow!

