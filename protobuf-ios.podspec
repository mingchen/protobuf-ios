#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "protobuf-ios"
  s.version          = File.read('VERSION')
  s.summary          = "Google proto buffer for iOS written in Objective-C"
  s.description      = <<-DESC
                       Google proto buffer for iOS written in Objective-C
                       DESC
  s.homepage         = "https://github.com/mingchen/protobuf-ios"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ming Chen" => "mockey.chen@gmail.com" }
  s.source           = { :git => "https://github.com/mingchen/protobuf-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/mingchen/protobuf-ios'

  # s.platform     = :ios, '5.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'runtime/protobuf-ios/Classes'
  # s.resources = 'Assets/*.png'

  s.ios.exclude_files = ''
  s.osx.exclude_files = ''
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
