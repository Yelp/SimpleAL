#!/usr/bin/env ruby

USAGE = <<END
usage: #{$0} filename ...

This script converts "basic" usage of SimpleAL to NSLayoutAnchor. It matches
lines of the form:
    
  <view>.<SimpleAL property>.<SimpleAL constraint factory>(<constraint type>: <constraint value>)

and converts it to equivalent NSLayoutAnchor syntax:

  <view>.<anchor>.constraint(<NSLayoutAnchor constraint type>: <constraint value>)

For example:
  imageView.al_height.equal(to: imageView.al_width)
becomes:
  imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
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

ARG = /([^,\)]+)/
AL  = /(Anchor)/

# Maps regexps matching a SimpleALViewProperty method call to the equivalent
# NSLayoutAnchor method call.
CALL_MAP = {
  /#{AL}\.equal\(to: #{ARG}\)/ => 
    ->(m) { "#{$1}.constraint(equalTo: #{$2})" },
  /#{AL}\.equal\(to: #{ARG}, constant: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(equalTo: #{$2}, constant: #{$3})" },
  /#{AL}\.equal\(to: #{ARG}, multiplier: #{ARG}, constant: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(equalTo: #{$2}, multiplier: #{$3}, constant: #{$4})" },

  /#{AL}\.greaterThanOrEqual\(to: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(greaterThanOrEqualTo: #{$2})" },
  /#{AL}\.greaterThanOrEqual\(to: #{ARG}, constant: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(greaterThanOrEqualTo: #{$2}, constant: #{$3})" },
  /#{AL}\.greaterThanOrEqual\(to: #{ARG}, multiplier: #{ARG}, constant: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(greaterThanOrEqualTo: #{$2}, multiplier: #{$3}, constant: #{$4})" },

  /#{AL}\.lessThanOrEqual\(to: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(lessThanOrEqualTo: #{$2})" },
  /#{AL}\.lessThanOrEqual\(to: #{ARG}, constant: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(lessThanOrEqualTo: #{$2}, constant: #{$3})" },
  /#{AL}\.lessThanOrEqual\(to: #{ARG}, multiplier: #{ARG}, constant: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(lessThanOrEqualTo: #{$2}, multiplier: #{$3}, constant: #{$4})" },

  /#{AL}\.equal\(toValue: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(equalToConstant: #{$2})" },
  /#{AL}\.lessThanOrEqual\(toValue: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(lessThanOrEqualToConstant: #{$2})" },
  /#{AL}\.greaterThanOrEqual\(toValue: #{ARG}\)/ =>
    ->(m) { "#{$1}.constraint(greaterThanOrEqualToConstant: #{$2})" },
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
