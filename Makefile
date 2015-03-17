
all : commands

#-------------------------------------------------------------------
# Targets and commands

##-------------------------------------------------------------------
## commands    : Show all commands in Makefile
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'

##-------------------------------------------------------------------

## knit_rmd   : Generate a post from a .Rmd file
knit_rmd :
	./knitpost.R

## build_local : Build the site locally to test out before going live
build_local :
	jekyll serve --watch --draft

# Not sure about this one
update_jekyll :
	bundle update
