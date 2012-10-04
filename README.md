# gist_search

Search your gist.

## Installation

groonga:

    $ brew install groonga

gist_search:

    $ git clone git://github.com/jugyo/gist_search.git

## Usage

    $ cd gist_search

Create database:

    $ ./script/create_db

Create search index:

    $ ./script/index USER_NAME PAGE_COUNT

Search:

    $ ./script/search USER_NAME KEYWORD

## TODO

* Make this a gem
* Or make this a web app
