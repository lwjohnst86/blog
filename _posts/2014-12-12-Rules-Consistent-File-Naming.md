---
layout: post
title: "Staying sane: Rules on consistent file naming practices"
date: 2014-12-12
category: [Science, Statistics, Life]
tags: [organization, computer management, time management, sanity]
...

One important component of maintaining order and sanity with your
files if you do any significant amount of computer work (or even if
you don't) is making sure you have established rules for naming files
and folders.  You can develop your own or you can use rules developed
by others.  I've taken a bit from all over the place (including from
the
[University of Edinburgh website](http://www.recordsmanagement.ed.ac.uk/InfoStaff/RMstaff/RMprojects/PP/FileNameRules/Rules.htm)),
incorporated some of my own thoughts on filenaming, and decided to put
it up on my blog so others may have a starting point to developing
their own.  Below I have detailed my filenaming rules that I try to be
strict about.

*A brief note:* Some programs have different rules, so of course use
the rules dictated by whatever program you are using.  Two examples:
1) In SAS, hyphens in file names are not allowed; 2)
[Jekyll](jekyllrb.com) (used by [Github Pages](pages.github.com) that
generated this blog) uses slightly different filenaming rules than my
own personal rules, so I use which rules are appropriate for the
program/situation.

# File (and Folder) Naming Rules: #

1. Keep the names short, but meaningful. Remove unnecessary words such
   as "the", "and", "a" etc.

2. Don't include spaces and avoid underscores (debatable and/or
   situational).  For a string of words, capitalize the first letter
   of each word, except for the first word
   (e.g. `fileNameDescription`)

3. Use hyphens to separate important parts of the name or when there
   is an abbreviation followed by another word.  For example,
   `diabetesRisk-AnalysisOutput` which separates the two concepts, the
   project descriptor `diabetesRisk` and the contents of the file
   `AnalysisOutput`.  Another example:
   `report-AnalysisFoodIntake-2014.pdf` and **not**
   `reportAnalysisFoodIntake2014.pdf`.

4. Avoid redundancy in file names and file paths (folder names).  For
   example, don't use `folderName/fileName-folderName.txt` and instead
   use `folderName/fileName.txt`.  Another example: don't use
   `diabetesSatFats/analysis-DiabetesSatFats.sas` and instead use
   `diabetesSatFats/analysis.sas`.

5. If a number is included in the filename, such as for the version
   number, use two digits not one (e.g. `V01`, not `V1`).

6. When including a date, include it at the very end of the filename
   and in the international standard format `YYYY-MM-DD`.

I hope these rules help you start with developing your own set of rules!
