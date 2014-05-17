module Emojit
  module SymbolExt
    def ~
      to_s.split
      .map { |word| Emojit.icon(word) || word.sub(/^\./, '') }
      .join(" ")
    end
  end
end

Symbol.send(:include, Emojit::SymbolExt)
