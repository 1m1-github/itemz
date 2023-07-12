# itemz

+ content consists of a list of _item_s
+ each _item_ consists of a _title_, a _description_, a _timestamp_, and a list of _tags_
+ user supplied content as json
+ user supplied design as css
+ main item in json 
+ each item has a title, description, timestamp and a list of tags
+ see my json as an example: 
+ timestamps are in epoch (seconds since 1970 UTC)
+ items should have unique timestamps
+ each item also has a tag `_${timestamp}` added to be directly linkable
+ tags are filters
+ each _item_ is clickable
+ filters is clickable
+ user supplied title for site

## usage

https://little-unit-4743.on.fleek.co?content=content_url&css=css_url&filters=filter1,filter2&title=mytitle

## example

imagine a user has content available at the following url:
https://raw.githubusercontent.com/1m1-github/itemz/main/example/example_content.json

and css available at the following url:
https://raw.githubusercontent.com/1m1-github/itemz/main/example/example_css.css

first, we url encode (https://en.wikipedia.org/wiki/URL_encoding) these links and get:
https%3A%2F%2Fraw.githubusercontent.com%2F1m1-github%2Fitemz%2Fmain%2Fexample%2Fexample_content.json
https%3A%2F%2Fraw.githubusercontent.com%2F1m1-github%2Fitemz%2Fmain%2Fexample%2Fexample_css.css

now we can supply these urls as parameters to the itemz code:
https://little-unit-4743.on.fleek.co?content=https%3A%2F%2Fraw.githubusercontent.com%2F1m1-github%2Fitemz%2Fmain%2Fexample%2Fexample_content.json&css=https%3A%2F%2Fraw.githubusercontent.com%2F1m1-github%2Fitemz%2Fmain%2Fexample%2Fexample_css.css

we can add filters if we want to:
https://little-unit-4743.on.fleek.co?content=https%3A%2F%2Fraw.githubusercontent.com%2F1m1-github%2Fitemz%2Fmain%2Fexample%2Fexample_content.json&css=https%3A%2F%2Fraw.githubusercontent.com%2F1m1-github%2Fitemz%2Fmain%2Fexample%2Fexample_css.css&filters=a,b

or a specific item filter via its timestamp:
https://little-unit-4743.on.fleek.co?content=https%3A%2F%2Fraw.githubusercontent.com%2F1m1-github%2Fitemz%2Fmain%2Fexample%2Fexample_content.json&css=https%3A%2F%2Fraw.githubusercontent.com%2F1m1-github%2Fitemz%2Fmain%2Fexample%2Fexample_css.css&filters=_123920395