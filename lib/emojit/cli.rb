require "thor"

module Emojit
  class CLI < Thor
    desc "show [NAME]", "show emoji icon and unicode for NAME"
    option :only, aliases:'-o'
    option :inline, aliases:'-i', default:false, type: :boolean
    def show(name=nil)
      case name
      when nil, 'all'
        list =
          Emojit.list.map do |name, (icon, code)|
            case options[:only]
            when 'name'
              "%s  %s" % [icon, name]
            when 'code', 'unicode'
              "%s  %s" % [icon, code]
            when 'emoji', 'icon'
              "%s" % [icon]
            when 'nameonly'
              "%s" % [name]
            else
              "%s  %s (%s)" % [icon ,name, code]
            end
          end
        puts (options[:inline] ? list.join("  ") : list)
      else
        icon, code = Emojit.list[name.intern]
        if icon
          print "%s  %s (%s)\n" % [icon, name, code]
        else
          puts "No emoji for '#{name}'"
        end
      end
    end

    desc "icons", "show all emoji icons"
    def icons
      CLI.start(['show', '--only', 'emoji', '--inline', false])
    end

    desc "names", "show all available names for emoji"
    def names
      CLI.start(['show', '--only', 'nameonly'])
    end
  end
end
