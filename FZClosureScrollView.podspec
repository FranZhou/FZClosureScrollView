#
# Be sure to run `pod lib lint FZClosureScrollView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FZClosureScrollView'
  s.version          = '0.1.0'
  s.summary          = 'Use closure instead of delegate to implement the callback for UIScrollView/UITableView/UICollectionView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Use closure instead of delegate to implement the callback for UIScrollView/UITableView/UICollectionView.
                       DESC

  s.homepage         = 'https://github.com/FranZhou/FZClosureScrollView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FranZhou' => 'fan.zhou@thoughtworks.com' }
  s.source           = { :git => 'https://github.com/FranZhou/FZClosureScrollView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'FZClosureScrollView/Classes/**/*'

  s.swift_version = '5.0'

  s.subspec 'ScrollView' do |scrollView|
    scrollView.source_files = 'FZClosureScrollView/Classes/ScrollView/**/*'
  end

  s.subspec 'TableView' do |tableView|
    tableView.source_files = 'FZClosureScrollView/Classes/TableView/**/*'
    tableView.dependency 'FZClosureScrollView/ScrollView'
  end

  s.subspec 'CollectionView' do |collectionView|
    collectionView.source_files = 'FZClosureScrollView/Classes/CollectionView/**/*'
    collectionView.dependency 'FZClosureScrollView/ScrollView'
  end
  
  # s.resource_bundles = {
  #   'FZClosureScrollView' => ['FZClosureScrollView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
