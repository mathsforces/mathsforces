# Makefile

new_problem:
ifeq ($(filter-out $@,$(MAKECMDGOALS)),)
	@echo "Error: Please provide a name for the new problem."
else
	cp -r problems/example-problem problems/$(filter-out $@,$(MAKECMDGOALS))
	new_uuid=`uuidgen` && \
	{ [ -z "$$new_uuid" ] || sed -i.bak "s/^uuid = \".*\"/uuid = \"$$new_uuid\"/" problems/$(filter-out $@,$(MAKECMDGOALS))/problem.toml; } && \
	rm -f problems/$(filter-out $@,$(MAKECMDGOALS))/problem.toml.bak
endif

# use `make -s diff_problem` to show all problems that are changed during the last commit
# use this info to sync with production database
diff_problem:
	git show --name-only | grep '^problems'

%:
	@:
