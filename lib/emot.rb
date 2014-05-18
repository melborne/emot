require "emot/version"
require "emot/map"
require "emot/symbol_ext"
require "emot/cli"

module Emot
  def icon(name)
    build_icon( MAP[name.intern] )
  end
  alias :emoji :icon

  def unicode(name)
    build_unicode( MAP[name.intern] )
  end

  def list
    Hash[
      MAP.map do |name, codes|
        [name, [build_icon(codes), build_unicode(codes)]]
      end.sort_by(&:last)
    ]
  end

  private
  def build_icon(codes)
    codes.map { |code| code.to_i(16) }.pack("U*") if codes
  end

  def build_unicode(codes)
    codes.map { |code| "U+#{code}" }.join(" ") if codes
  end

  extend self
end
