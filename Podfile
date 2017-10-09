platform :ios, '8.0'
use_frameworks!

target 'SwiftCocoa' do
pod 'SDWebImage'
pod 'SwiftyJSON'
pod 'AFNetworking'
#pod 'SnapKit'
pod 'RealmSwift'
pod 'SwiftyDrop'
pod 'MJRefresh'
pod 'IQKeyboardManagerSwift'
pod 'Masonry'
pod 'ReactiveCocoa'

#pod 'LKDBHelper', '~> 2.4'
#pod 'CocoaLumberjack', '~> 3.0.0'
#pod 'MBProgressHUD'
#pod 'YYModel'
#pod 'YRJSONAdapter'
#pod 'JSBadgeView', '~> 1.4.1'
#pod 'CYLTabBarController'
#pod 'STPickerView', '2.0'
#pod 'YSLContainerViewController', '~> 0.0.2'
#pod 'Qiniu', '~> 7.1.5'
#pod 'HyphenateFullSDK', '~> 3.1.5'
#pod 'AMap2DMap', '~> 4.6.0'
#pod 'AMapSearch', '~> 5.0.0'
#pod 'AMapLocation', '~> 2.3.1'
#pod 'SDAutoLayout', '~> 2.1.3'
#pod 'MWPhotoBrowser', '~> 2.1.2'
#pod 'iOS-WebP'
#pod 'NullSafe'
#pod 'UMengUShare/Social/ReducedWeChat'
#pod 'UMengUShare/UI'
#pod 'UMengUShare/Social/ReducedQQ'
#pod 'UMengUShare/Social/ReducedSina'
#pod 'SCRecorder'
#pod 'Hyphenate'

end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['SWIFT_VERSION'] = '3.0'
end
end
end
