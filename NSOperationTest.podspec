#
#  Be sure to run `pod spec lint NSOperationTest.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/


Pod::Spec.new do |s|

  s.name         = "NSOperationTest"
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.version      = "0.1.0"
  s.summary      = "A test about NSOperation."
  s.homepage = 'https://github.com/flairamyz/NSOperationTest'
  s.authors = { 'flairamyz' => '894167502@qq.com' }
  s.source = { :git => 'https://github.com/flairamyz/NSOperationTest.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'NSOperation/*.{h,m}'

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4

end
