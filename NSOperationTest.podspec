
Pod::Spec.new do |s|


  s.name         = "NSOperationTest"
  s.version      = "0.1.1"
  s.summary      = "A test of NSOperation."

  s.homepage     = "https://github.com/flairamyz/NSOperationTest"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "amyz" => "flairamyz@foxmail.com" }

  s.source       = { :git => "https://github.com/flairamyz/NSOperationTest.git", :tag => "#{s.version}" }
  s.source_files  = "NSOperation", "NSOperation/**/*.{h,m}"
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "8.0" #平台及支持的最低版本
  # s.public_header_files = "Classes/**/*.h"


end
