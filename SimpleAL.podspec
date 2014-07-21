Pod::Spec.new do |s|
  s.name         = 'SimpleAL'
  s.version      = '1.0.0'
  s.summary      = 'Yelp iOS autolayout utilities forked from alexhaefner/SimpleAL'
  s.homepage     = 'https://github.com/Yelp/SimpleAL'
  s.authors      = { 'Yelp iOS Team' => 'iphone@yelp.com' }
  s.source       = { :git => 'https://github.com/Yelp/SimpleAL.git', :tag => 'v1.0.0' }
  s.requires_arc = true

  s.platform     = :ios
  s.ios.deployment_target = '6.0'
  s.license      = 'apache 2.0'

  s.public_header_files = 'Classes/**/*.h'
  s.source_files = 'Classes/**/*.{h,m}'
end
