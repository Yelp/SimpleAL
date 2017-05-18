#!/usr/bin/env ruby

USAGE = <<END
usage: #{$0} filename ...

This script converts "basic" usage of SimpleAL to NSLayoutAnchor. It matches
lines of the form:
    
  [<SimpleALViewProperty> <ViewProperty method>:<SimpleALViewProperty> ...]

and converts it to equivalent NSLayoutAnchor syntax:

  [<NSLayoutAnchor> <NSLayoutAnchor method>:<NSLayoutAnchor> ...]

For example:
  [imageView.al_height equalToViewProperty:imageView.al_width]
becomes:
  [imageView.heightAnchor constraintEqualToAnchor:imageView.widthAnchor]
END

ANCHOR_MAP = {
  "al_top"      => "topAnchor",
  "al_baseline" => "lastBaselineAnchor",
  "al_bottom"   => "bottomAnchor",
  "al_centerX"  => "centerXAnchor",
  "al_centerY"  => "centerYAnchor",
  "al_height"   => "heightAnchor",
  "al_leading"  => "leadingAnchor",
  "al_left"     => "leftAnchor",
  "al_right"    => "rightAnchor",
  "al_trailing" => "trailingAnchor",
  "al_width"    => "widthAnchor"
}

# Returns the NSLayoutAnchor property name equivalent to SimpleAL view
# properties `symbol`.
def anchor(symbol)
  ANCHOR_MAP[symbol]
end

# Returns `str` with all SimpleAL view properties converted to NSLayoutAnchor
# property names.
def anchors(str)
  str.gsub(/[a-zA-Z_][a-zA-Z0-9_0]*/) { |token| anchor(token) || token }
end

ARG = /([^ \]]+)/
AL  = /(Anchor)/

# Maps regexps matching a SimpleALViewProperty method call to the equivalent
# NSLayoutAnchor method call.
CALL_MAP = {
  /#{AL} equalToViewProperty:#{ARG}/ =>
    ->(m) { "#{$1} constraintEqualToAnchor:#{$2}" },
  /#{AL} lessThanOrEqualToViewProperty:#{ARG}/ =>
    ->(m) { "#{$1} constraintLessThanOrEqualToAnchor:#{$2}" },
  /#{AL} greaterThanOrEqualToViewProperty:#{ARG}/ =>
    ->(m) { "#{$1} constraintGreaterThanOrEqualToAnchor:#{$2}" },
  /#{AL} equalToValue:#{ARG}/ =>
    ->(m) { "#{$1} constraintEqualToConstant:#{$2}" },
  /#{AL} lessThanOrEqualToValue:#{ARG}/ =>
    ->(m) { "#{$1} constraintLessThanOrEqualToConstant:#{$2}" },
  /#{AL} greaterThanOrEqualToValue:#{ARG}/ =>
    ->(m) { "#{$1} constraintGreaterThanOrEqualToConstant:#{$2}" },
}

abort USAGE if ARGV.empty?
ARGV.each do |filename|
  code = File.readlines filename
  file_changed = false
  code.each do |line|
    line_changed = ANCHOR_MAP.map { |match, subst| line.gsub!(match, subst) }
                             .any? { |s| s }
    line_changed = CALL_MAP.map { |match, block| line.gsub!(match, &block) }
                           .any? { |s| s } || line_changed
    file_changed = file_changed || line_changed
  end
  
  if file_changed
    File.write filename, code.join
    puts "Converted #{filename}" 
  end
end
