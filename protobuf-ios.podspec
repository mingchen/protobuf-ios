#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "protobuf-ios"
#  s.version          = File.read('VERSION')
  s.version          = "2.3.2"
  s.summary          = "An Objective-C implementation of Google proto buffer for iOS"
  s.description      = <<-DESC
                        An Objective-C implementation of Google proto buffer for iOS

                       * Support write to / parse from delimited stream (protobuf 2.3 feature).
                       DESC
  s.homepage         = "https://github.com/mingchen/protobuf-ios"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ming Chen" => "mockey.chen@gmail.com" }
  s.source           = { :git => "https://github.com/mingchen/protobuf-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/mingchen/protobuf-ios'

  s.platform     = :ios, '5.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = false

  s.source_files = 'runtime/protobuf-ios/Classes'
  # s.resources = 'Assets/*.png'

  s.ios.exclude_files = ''
  s.osx.exclude_files = ''
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
