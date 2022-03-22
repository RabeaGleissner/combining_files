# Programming Exercise

## How to run the code

Clone the code and run

`bundle install`

Run the tests: 

`rspec`

Run the linter:

`rubocop`

Generate the combined data files:

`ruby combine.rb --format json journals.csv articles.csv authors.json > full_articles.json`
`ruby combine.rb --format csv journals.csv articles.csv authors.json > full_articles.csv`


## Considerations

1) Files to combine

The program currently only combines the three existing files in the `/resources` directory.
However, I noticed that the file names are being passed as part of the command to run the program.
That made me wonder if this program should be able to combine any given files.
I decided for now not to accomodate for this case because it would make the program lot more complex.
But I wanted to call out that this struck me as a possibility!
This would be something that I would clarify with a product manager first.

2) ISSN formatting

The instructions say that sometimes the ISSN can be missing a hyphen.
I coded for exactly that eventuality, assuming that it will always have the right format - so either two sets of four digits with a hyphen or eight digits.
If there was ever a data file with an ISSN in a different format, no errors would be thrown currently, although I think that might be a good idea for an actual production usecase! 


## Instructions

In the resources directory, you'll find three data files:

* journals.csv: a list of journal titles and ISSNs;
* articles.csv: a list of article DOIs [0], titles and ISSNs;
* authors.json: a list of author names and their article DOIs.

We want to combine these data and output a single text file in one of two
different formats:

* CSV with columns of DOI, Article title, Author name, Journal title and
  Journal ISSN, e.g.

      10.1234/altmetric0,Small Wooden Chair,Amari Lubowitz,"Shanahan, Green and Ziemann",1337-8688

* JSON as an array of objects with fields for DOI, title, author, journal and
  ISSN, e.g.

    {
        "doi": "10.1234/altmetric0",
        "title": "Small Wooden Chair",
        "author": "Amari Lubowitz",
        "journal": "Shanahan, Green and Ziemann",
        "issn": "1337-8688"
    }

Note that ISSNs should always be formatted as two groups of four digits
separated by a hyphen, e.g. 1234-5678, but might be missing the hyphen in the
source data.

We'd like you to create a Ruby program that can take these three files and
produce the new formats by running it like so (assuming the program is called
combine.rb):

    $ ruby combine.rb --format json journals.csv articles.csv authors.json > full_articles.json
    $ ruby combine.rb --format csv journals.csv articles.csv authors.json > full_articles.csv

    [0]: http://en.wikipedia.org/wiki/Digital_object_identifier
