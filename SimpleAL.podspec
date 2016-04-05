Pod::Spec.new do |s|
  s.name         = 'SimpleAL'
  s.version      = '1.0.2'
  s.summary      = 'Yelp iOS autolayout utilities forked from alexhaefner/SimpleAL'
  s.homepage     = 'https://github.com/Yelp/SimpleAL'
  s.authors      = { 'Yelp iOS Team' => 'iphone@yelp.com' }
  s.source       = { :git => 'https://github.com/Yelp/SimpleAL.git', :tag => 'v' + s.version.to_s }
  s.requires_arc = true
  s.license      = 'Apache 2.0'

  s.platform     = :ios
  s.ios.deployment_target = '6.0'

  s.public_header_files = 'Classes/**/*.h'
  s.source_files = 'Classes/**/*.{h,m}'
end
