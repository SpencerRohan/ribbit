# Ribbit
### Summary
Ribbit is a library providing scoring advice about consumers based on their income, zipcode, and age. This is an API Integration exercise for LeapFrog Online.

### Guide to Install Gem
+ Clone this repository
+ In termial navigate to the imported repo
+ Using the gemspec build the ribbit gem - type:
```
    gem build ribbit.gemspec
```
+ Upon success you may install the gem - type:
```
    gem install ./ribbit-0.0.0.gem
```
+ Included in this library are testing suites for the ribbit library as well as a demo program implementation. To run specs for both navigate to the spec file of your choosing and - type:
```
    rspec INSERT FILENAME HERE
```

*Note: This library includes a fictional HTTP destination - for implementing in actual development scenarios you must change the destination source in the ribbit.rb file*

### Other Gems Required for Functionality
Before installing ensure you have the following gems installed locally. See Ruby-Toolbox.com for more instructions.
 + WebMock ('webmock/rspec')
 + Net/Http ('net/http')
 + Json ('json')

### Guide to use Demo Program

Also included in this repository is a program to calculate and view  consumer ratings easily with the Ribbit gem.

*Note: income, zipcode, and age values must be present, fixnums, in hash format to be valid.*

```ruby
require 'ribbit'
rating_data = ConsumerRating.new( income:  50000,
                                  zipcode: 60201,
                                  age:     35 )

rating_data.ranking #=> 'C'
rating_data.propensity #=> 2.26532
rating_data.display # will display the following in stdout: "Ranking: C, Propensity: 2.26532"
```
