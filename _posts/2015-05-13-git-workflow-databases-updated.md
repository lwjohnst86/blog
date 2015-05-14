---
layout: post
title: "Git workflow for research databases: Updated"
date: 2015-05-13
categories:
    - Science
    - Statistics
tag: [organization, git, database management, workflow]
...

After having submitted pull requests to the
[Software Carpentry's](http://software-carpentry.org/)
[Git novice](https://github.com/swcarpentry/git-novice) lessons as
part of the
[instructor training](http://swcarpentry.github.io/training-course/),
I realized that the workflow they use (and I am sure many others use)
looks like a very good workflow to adopt for my research database
(that other students also use and that will eventually start
contributing to).  So, I've significantly updated the workflow I had
originally posted [here](/Git-Workflow-Research-Databases/).

# Dataset workflow for team environments #

A brief summary
([tl;dr](http://www.urbandictionary.com/define.php?term=tl%3Bdr)):

* The components include:
  - A central/main dataset (in [BitBucket](https://bitbucket.org/) or
    [GitHub](https://github.com/))
  - A forked version of the dataset in each members own account
  - A local version on each members computers

* The actions include:
  - Pulling from the main dataset (`upstream` remote) into the local
    version
  - Pushing (or pulling as well) to the forked dataset (`origin`
    remote) into (or out of) the local version
  - Submitting a pull request from the forked dataset to the main
    dataset and allowing others to comment and/or approve of the pull
    request

# To expand... #

Previously, I thought it would be good to have two branches, the
`master` and the `dev` branch. However, this was needlessly
complicated and didn't allow for more control over who/what was pushed
to the main dataset.  Plus, the number of redundant (ie. extra
backups) of the main dataset was not that high (one main plus each of
the team members own local version: 1 + n).  However, using the
workflow that Software Carpentry uses provides additional benefits:

1. Greater control over who/what gets into the main dataset
2. Greater redundance (main + forked + local: 1 + 2 * number of team
   members) and so more backups
3. Less branches to deal with (only `master`)
4. Less complicated set up on the local computer

The workflow I am talking about is best encapsulated in this image:

![Workflow for datasets in a team environment.](/images/git-workflow-databases.png)

To get to this state, you need to:

1. Fork the main dataset into your own account (either BitBucket or
   GitHub)
2. Clone the forked dataset onto your computer, preferably in your 'My
   Documents' or your 'Datasets' folders.  Using the terminal/Git
   Bash, `cd` into the folder you want to clone the dataset into and:

        git clone https://github.com/youraccount/yourforkeddataset.git

3. Go into the newly cloned `dataset` folder (or whatever name) using
   `cd` and add the `upstream` remote:

        git remote add upstream https://github.com/mainaccount/maindataset.git

    To keep up-to-date with the main dataset, just run `git pull
    upstream master`.  To push (or pull) to your forked version, use
    `git push origin master` (or `git pull origin master`).

# Commits and pull requests #

To make sure that commits and the version control history are clean,
create a goal for what needs done and work toward that goal.  As files
are changed, make sure to `git add` and `git commit` often, providing
detailed commit messages.  A typical format for a commit message 

> Brief, *short* description on the first line
>
> Then, expand on this next line, going into what you changed,
> why you changed it.  Be descriptive and detailed here. You
> can write as much as you like.  It is *really* important
> that you explain yourself and the changes for other people
> who will be using the dataset.  Note the space between the
> first line and the more detailed paragraph.

After a goal has been completed, submit a pull request to the main
dataset.  Depending on the changes, you may need to make some more
changes and update the pull request.  Then the pull request will be
merged with the main dataset and you can `git pull upstream master` to
keep your local version updated.

# Typical commands used in this workflow #

Each line represents an individual command, while the `##` indicate a
comment, so anything after the `##` does nothing in the terminal/Git Bash.

    ## Go to dataset/my documents
    cd /path/to/your/dataset/folder 
    
    ## Clone the forked dataset
    git clone https://bitbucket.org/youraccount/yourforkeddataset.git
    
    ## Move into the new folder
    cd yourforkeddataset 
    
    ## Add the upstream (main dataset) to pull from
    git remote add upstream https://bitbucket.org/mainaccount/maindataset.git
    
    ## Confirm that there are origin and upstream remotes
    git remote -v 
    
    ## Change some files
    git add filename1 filename2
    
    ## Commit to the git history and type out a detailed message
    git commit 
    
    ## Pull from upstream just in case
    git pull upstream master
    
    ## Fix any conflicts if need be
    git push origin master

On BitBucket/GitHub, the two things you will need to do is "Fork" and
"Pull request", that's it.

