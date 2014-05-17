# Emojit

Yet another emoji name-unicode converter.

## Installation

Add this line to your application's Gemfile:

    gem 'emojit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emojit

## Usage

```ruby
require 'emojit'

Emojit.icon(:sunflower) # =>  í ¼í¼»

Emojit.unicode(:sunflower) # => "U+1F33B"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/emojit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
