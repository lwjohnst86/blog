---
layout: post
title: "A potential Git workflow for research databases"
date: 2014-12-30
category: [Science, Statistics]
tags: [organization, git, database management, workflow]
...

*Updated on 2015-01-21*

> These are my thoughts on a potential Git workflow for research
> databases, in particular for my own PhD dataset.  I'm still in the
> process of developing the workflow and will likely tweak it as time
> goes on.

## Workflow for managing a research database and associated files ##

There are two basic rules:

1. Only edit and work on files in the develop or `dev` branch.
2. Use the `master` branch as the go-to for the "stable" version of
   the dataset and to use for your analyses, but **not** to edit them.

There are again two possibilities for following this rule:

1. (Complex) Whenever data needs to be used, switch to the
   `master` branch using `git checkout master` and afterwards switch
   back to the `dev` branch (`git checkout dev`).
2. (Simple) Create two folders in your dataset folder: a `master`
   folder and a `dev` folder, where only the branches specific to
   those folders are used.  This allows for a physical, tangible
   separation between development and stable datasets.

When files, data, or code *do* need to be worked on, work in the `dev`
folder and commit to the `dev` branch.  To make sure that commits and
the version control history are clean, create a goal for what needs
done and work toward that goal.  Once a goal has been created, there
are two options for committing into the history:

A. (Complex, though potentially cleaner) Create a temporary branch
   while in the `dev` branch specific to the goal.  This branch could
   either be named `temp` or a name relevant to the goal
   (eg. `cleaning` or `data-input`) using the command:

        git checkout -b temp # Or cleaning, etc.
        # As files get changed, use the commands:
        git add filename1 filename2 # etc
        git commit # Type out a detailed commit message

    All work and commits will be specific to the goal.

B. (Simple, though potentially messier) Add and commit to the `dev`
   branch, making sure that the commits are as clean and focused on
   the goal as possible.  The only commands needed are:

        git add filename1 filename2 # etc
        git commit # Type out a detailed commit message

Only files specific to the goal should be committed into the git
history.  Given that caveat, make sure to commit often enough that the
commits have a clear goal and a descriptive message.

*Note*: If A) directly above is implemented (via a `temp` branch), the
 commands to use to bring the changes into the `dev` branch would be:

    git checkout dev # You are on the cleaning, etc. branch
    git merge --no-commit --squash cleaning # Or data-input/etc
    git status # Make sure the files you changed are changed
    git commit --all # This will commit all the changed files

Type out a descriptive commit message on generally what was changed
and why they were changed.  If you no longer need the `temp` branch,
run:

    git branch -d temp # Or cleaning, etc.

For either A) or B), whenever you run the command `git commit`, a text
editor will open up, where you can type out a **detailed** commit
message, using the format:

> Brief, *short* description on the first line
>
> Then, expand on this next line, going into what you changed,
> why you changed it.  Be descriptive and detailed here. You
> can write as much as you like.  It is *really* important
> that you explain yourself and the changes for other people
> who will be using the dataset.  Note the space between the
> first line and the more detailed paragraph.

Anytime work has been done on the dataset, push (upload) the `dev`
branch to the central online location (called `origin`) where everyone
can access your changes (ie. commits) using the command:

    git push origin dev

*Note*: For now, only let admins merge the `dev` branch into the
`master` branch, using:

        git checkout master
        git merge --no-ff --no-commit dev
        git commit
        git tag -a tag_name -m "Detailed msg explaining diff with last tag"
        git push origin tag_name

I'll be updating this as I work out what the best workflow is for my
research databases.

