module Emot
  module SymbolExt
    def ~
      to_s.split
      .map { |word| Emot.icon(word) || word.sub(/^\./, '') }
      .join(" ")
    end
  end
end

Symbol.send(:include, Emot::SymbolExt)
