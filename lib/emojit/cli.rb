require "thor"

module Emojit
  class CLI < Thor
    desc "show [NAME]", "show emoji icon and unicode"
    def show(name=nil)
      case name
      when nil
        "not implement"
      else
        print "%s %s\n" % Emojit.list[name.intern]
      end
    end
  end
end