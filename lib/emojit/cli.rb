require "thor"

module Emojit
  class CLI < Thor
    desc "show [NAME]", "show emoji icon and unicode"
    option :only
    def show(name=nil)
      case name
      when nil, 'all'
        list =
          Emojit.list.map do |name, (icon, code)|
            case options[:only]
            when 'name'
              "%s: %s" % [icon, name]
            when 'code', 'unicode'
              "%s: %s" % [icon, code]
            when 'emoji'
              "%s" % [icon]
            else
              "%s: %s (%s)" % [icon ,name, code]
            end
          end
        puts list.join("  ")
      else
        print "%s %s\n" % Emojit.list[name.intern]
      end
    end
  end
end