all:

submodule:
	git submodule update --init --recursive
	git submodule foreach 'git fetch origin; git checkout $$(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; git clean -dfx'

clean:
	-find . -name "*~" -delete
	-find . -name "auto" -type d -exec rm -r "{}" \;

cleanall: clean
