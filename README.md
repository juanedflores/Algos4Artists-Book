# Algos4Artists (working title)
The current status of this project is that it will be used as a personal reference for listing and explaining algorithms that I have run into and used in creative programming. Perhaps in the future this book will be revised in a way to help guide beginning programmers.
Since this is mostly for myself at the moment, it will resemble a bit of a dumping ground and will be using all the open source creative programming environments I use such as Processing, P5.js, openrndr, openframeworks, as well as projects written in Python and available modules.

## This Repo
This is a repo to house the files to build the Algos4ArtistsBook, but also to familiarize myself with a writing workflow, as this is my first major project that uses pandoc to convert markdown to HTML, PDF, and EPUB.
Along with the essential files, I will also use this repo to contain any help files to guide anyone (or my future self) on how to get set up in vim to work on a project like this.

### What Is Included 
* A Makefile to build the Algos4ArtistsBook.md file to several formats in the `output` directory. `make` will create the files if there are any changes. `make clean` will remove any output files.
* A pandoc directory with any LaTeX files, pandoc templates, and color themes.
* A `vimforwriting.md` file to document what settings I used for this workflow.

