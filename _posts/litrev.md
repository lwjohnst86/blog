% Step-by-step guide to doing a lit review --- Application specific
% Luke Johnston
% $DATE

# Reasons for this guide

There were several reasons for writing up this guide.  My primary
reason was that I wanted to, basically, externalize my memory.  I had
been doing literature searches for a while, particularly at the start
of my MSc program, when I was just getting frustrated with how tedious
it sometimes got.  I went through a number of iterations on how to
become more efficient at it, but never thought of writing down the
precise process to do it.  I realized after I developed some pieces of
this guide that I was forgetting how to do certain steps.  That is why
I started to write it down.

My second reason is that I hope to eventually provide this to my
future graduate students or to others.  When I was in the start of my
MSc, I started repeatedly online for information on how other
scientists do their literature searches.  So the second reason is I am
making this guide for those who would like to know the exact processes
I take when doing a lit search, to help them get an idea on others do
it.

# Applications used in this guide

The following applications were used for this guide:

* Firefox (or any other web browser)
* JabRef (v. 2.10)
* Docear (v. 1.03)

JabRef is a reference manager that uses the Bib\TeX\ format to store
references.  I use \LaTeX\ so I need a program that can read `.bib`
files.  The nice thing about JabRef is that all the customizations and
editting of the references are done to the `.bib` file, which is a
plain text file.  This means that it is cross-platform, which is
necessary for me as I use Linux.  Plus, JabRef is Java-based, meaning
the program itself is cross-platform.

Docear is a great, fairly recent application that combines the power
of mindmaps with the power of pdf annotating (i.e. highlighting and
commenting).  It imports annotations from article pdfs into the
mindmap, allowing a visual representation of your ideas and how
research articles fit into your ideas and research.  Docear is also
Java-based and uses JabRef as a backend for the references.

# Step-by-step guide --- Detailed

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




# Step-by-step guide --- Brief #

1. Develop search terms
2. Use PubMed and MeSH to refine the terms
3. Input the terms into the Web Search in JabRef, searching Medline
4. Make sure the number of hits from JabRef are similar to PubMed
5. Record hits in text editor (eg. in `litSearchStrategies.md` file)
6. Sort by year
7. Search through articles, deselecting non-relevant articles
8. Check for duplicates
9. Import into database
10. Select all files and add relevant keywords to "Manage keywords" under Edit
11. Run "Clean up entries" under Tools
12. Delete "Month", "Note", "File", and "Institution" fields using "Set/clear/rename fields" under the Search menu
13. Search through and mark articles that are higher priority to be read
14. Mark entries based on priority and relevance to project (Ctrl-M in JabRef)
15. Darkest colour (red) is the most relevant and important
16. Lightest is the least relevant and important
17. No mark articles are there as they may be important later on, or the article is interesting but not relevant to the project
18. Download PDF for the higher priority articles
19. If download doesn't work, click the DOI button and manually download
20. If manually downloaded, go to Downloads folder and rename the pdfs by the BibKey
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



