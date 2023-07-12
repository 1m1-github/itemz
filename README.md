# itemz

+ each _item_ consists of a _title_, a _description_, a _timestamp_ and a list of _tags_
+ items are displayed in order of the _timestamp_
+ the _user supplied content as json
+ user supplied design as css
+ main item in json 
+ each item has a title, description, timestamp and a list of tags
+ see my json as an example: 
+ timestamps are in epoch (seconds since 1970 UTC)
+ items should have unique timestamps
+ each item also has a tag `_${timestamp}` added to be directly linkable
+ tags are filters