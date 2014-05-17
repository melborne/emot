# Emojit

Yet another emoji handler. It contains 870 emojis with its name and codepoint(but not contains emoji fonts or images). All names of emojis are from [Emoji cheat sheet for Campfire and GitHub](http://www.emoji-cheat-sheet.com/ "Emoji cheat sheet for Campfire and GitHub").

## Installation

Add this line to your application's Gemfile:

    gem 'emojit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emojit

## Usage

With Mac Terminal, `emojit` command works as follows;

    % emojit show sunflower # display the emoji with its codepoint.

    % emojit show  # display all named emojis with its names and codepoints.

    % emojit icons # display all emoji icons.

    % emojit names # display available names for emojis.

See `emojit help` for more info.

With Ruby,

```ruby
require 'emojit'

Emojit.icon(:sunflower) # =>  í ¼í¼»

Emojit.unicode(:sunflower) # => "U+1F33B"
```
í ¼í¼»

Also, you can get Symbol#~ for emoji output.

```ruby
require "emojit"

puts ~:smile
puts ~:beginner
puts ~:shit
puts ~:jack_o_lantern
puts ~:'+1'
puts ~:"I broken_heart you!"
puts ~:"The Pencil is mightier than gun"
puts ~:"Dango is better than sunflower"
puts ~:"ç–²ã‚ŒãŸã‚‰ beer ã‚’é£²ã‚‚ã†ï¼"
puts ~:"fish + hocho => sushi"
puts ~:".fush + .hocho => sushi" # escape emoji with prefix dot.
```

It gets them.

 í ½í¸„

 í ½í´°

 í ½í²©

 í ¼í¾ƒ

 í ½í±

 I í ½í²” you!

 The Pencil is mightier than í ½í´«

 Dango is better than í ¼í¼»

 ç–²ã‚ŒãŸã‚‰ í ¼í½º ã‚’é£²ã‚‚ã†ï¼

 í ½í°Ÿ + í ½í´ª => í ¼í½£

 fush + hocho => í ¼í½£


## Thank you

[jugyo/named_emoji](https://github.com/jugyo/named_emoji "jugyo/named_emoji") inspired me to create Emojit.

I built the mapping table of emoji name and unicode using [github/gemoji](https://github.com/github/gemoji "github/gemoji").

Thank you!

## Contributing

1. Fork it ( https://github.com/[my-github-username]/emojit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
