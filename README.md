# Emot

Yet another emoji handler. It contains 870 emojis with its name and codepoint(but not contains emoji fonts or images). All names of emojis are from [Emoji cheat sheet for Campfire and GitHub](http://www.emoji-cheat-sheet.com/ "Emoji cheat sheet for Campfire and GitHub").

## Installation

Add this line to your application's Gemfile:

    gem 'emot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emot

## Usage

With Mac Terminal, `emot` command works as follows;

    % emot show sunflower # display the emoji with its codepoint.

    % emot show  # display all named emojis with its names and codepoints.

    % emot icons # display all emoji icons.

    % emot names # display available names for emojis.

See `emot help` for more info.

With Ruby,

```ruby
require 'emot'

Emot.icon(:sunflower) # => 🌻

Emot.unicode(:sunflower) # => "U+1F33B"
```

Also, you can get Symbol#~ for emoji output.

```ruby
require "emot"

puts ~:smile
puts ~:beginner
puts ~:shit
puts ~:jack_o_lantern
puts ~:'+1'
puts ~:"I broken_heart you!"
puts ~:"The pencil is mightier than gun"
puts ~:"dango is better than sunflower"
puts ~:"疲れたら beer を飲もう！"
puts ~:"fish + hocho => sushi"
puts ~:".fish + .hocho => sushi" # escape emoji with prefix dot.

# >> 😄
# >> 🔰
# >> 💩
# >> 🎃
# >> 👍
# >> I 💔 you!
# >> The 📝 is mightier than 🔫
# >> 🍡 is better than 🌻
# >> 疲れたら 🍺 を飲もう！
# >> 🐟 + 🔪 => 🍣
# >> fish + hocho => 🍣
```

## Thank you

[jugyo/named_emoji](https://github.com/jugyo/named_emoji "jugyo/named_emoji") inspired me to create emot.

I built the mapping table of emoji name and unicode using [github/gemoji](https://github.com/github/gemoji "github/gemoji").

Thank you!

## Contributing

1. Fork it ( https://github.com/[my-github-username]/emot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
