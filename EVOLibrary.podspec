#
# Be sure to run `pod lib lint EVOLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EVOLibrary'
  s.version          = '0.1.0'
  s.summary          = 'Even的OC代码库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
内含常用宏定义、系统分类、扩展功能、快捷工具等，采用EVO前缀，避免与其他库宏定义、类、及变量名冲突
                       DESC

  s.homepage         = 'https://github.com/EvenZhu/EVOLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EvenZhu' => 'even.199010@gmail.com' }
  s.source           = { :git => 'https://github.com/EvenZhu/EVOLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'EVOLibrary/Classes/*.h'
  
  # s.resource_bundles = {
  #   'EVOLibrary' => ['EVOLibrary/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/EVOLibrary.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.subspec 'Category' do |h|
    h.source_files = 'EVOLibrary/Classes/Category/*.{h,m}'
  end
  
  s.subspec 'View' do |h|
    h.source_files = 'EVOLibrary/Classes/View/*.{h,m}'
  end

end
