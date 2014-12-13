
all : commands

#-------------------------------------------------------------------
# Targets and commands

##-------------------------------------------------------------------
## commands    : Show all commands in Makefile
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'

##-------------------------------------------------------------------

## update_site : Merge posts/edits from the `writing` branch into master
update_site :
	git checkout master && \
	git merge --no-commit --no-ff writing && \
	rm -rf misc/

## build_local : Build the site locally to test out before going live
build_local :
	jekyll serve

# Not sure about this one
update_jekyll :
	bundle update
