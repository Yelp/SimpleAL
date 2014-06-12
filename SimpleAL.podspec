Pod::Spec.new do |s|
  s.name         = 'SimpleAL'
  s.version      = '1.0.0'
  s.summary      = 'Yelp iOS collection and table view utilities'
  s.homepage     = 'https://gitweb.yelpcorp.com/?p=SimpleAL.git'
  s.authors      = { 'Yelp iOS Team' => 'iphone@yelp.com' }
  s.source       = { :git => 'git@git.yelpcorp.com:SimpleAL.git', :tag => 'v1.0.0' }
  s.requires_arc = true

  s.platform     = :ios
  s.ios.deployment_target = '6.0'

  s.public_header_files = 'Classes/**/*.h'
  s.source_files = 'Classes/**/*.{h,m}'
end
