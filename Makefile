all: run

run:
	bundle exec jekyll serve --port 4000

update:
	bundler update
