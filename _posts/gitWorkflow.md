Thoughts on how to deal with multiple people working on one project

# Detailed workflow for editing the PROMISE files #

* Always work on the develop or `dev` branch when editing files

* Use the `master` branch as the go-to for the most up-to-date version
  of the dataset when you need to use the data... **But not to
  edit**!!  When you need to use the data, use the command `git
  checkout master`.  After you are done, use the command `git checkout
  dev` to go back to the editing branch.

* If files need to be edited, make sure to create a goal for editing
  the files that is specific and focused.  This will help with commits
  and the eventual merge (more on that later).
      * Once a goal for the work has been decided and is focused,
        create and use a branch specific to that topic (cleaning, data
        input, etc.) using `git checkout -b cleaning` (or
        `data-input`, or whatever).  This command creates a new branch
        and moves to it.
      * Only files specific to the goal should be edited.
      * Commit often and early, making commit messages that are clear
        and descriptive.
      * Once the goal for the edits has been completed or as close as
        can be without being perfectionist, merge your goal-specific
        branch (eg. `cleaning` or `data-input`) back into the `dev` branch.
      * Merging is a way for files that have been changed in one
      branch to be updated in another branch.
      * Use the following commands:
        
            git checkout dev
            git merge --no-commit --squash cleaning # Or data-input/etc
            git status # Make sure the files you changed are changed
            git commit --all # This will commit all the changed files

      * Git will open up a text editor.  Type out a clear,
        descriptive, and **detailed** commit message about what you
        changed and *why* you changed it.  Use the following example
        template:

        > Brief, *short* description on the first line
        
        > Then, expand on this next line, going into what you changed,
        > why you changed it.  Be descriptive and detailed here. You
        > can write as much as you like.  It is *really* important
        > that you explain yourself and the changes for other people
        > who will be using the dataset.  Note the space between the
        > first line and the more detailed paragraph.

      * When you are done with the branch you created after merging it
        into the `dev` branch, run `git branch -d cleaning` (or
        `data-input` or whatever).

* Anytime work has been done on the dataset, push (upload) the `dev`
  branch and the `master` branch to the central online location
  (likely BitBucket.org; called `origin`) where everyone can access
  your changes (ie. commits) using the command `git push origin
  master` or `git push origin dev`.

* For now, only let Luke merge the `dev` branch into the `master`
  branch.  (Using `git checkout master && git merge --no-ff
  --no-commit dev`, followed by `git tag -a tag_name -m "Detailed
  message explaining diff with last tag" && git push origin
  tag_name`).

