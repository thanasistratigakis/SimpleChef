# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'SimpleChef' do
    pod 'Alamofire', '~> 4.0'
    pod 'AlamofireImage', '~> 3.0'
    pod 'SwiftyJSON'
    pod 'SnapKit', '~> 3.0'
end

target 'SimpleChefTests' do

end

target 'SimpleChefUITests' do

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
