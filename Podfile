use_frameworks!

target 'AurorKit iOS' do
  platform :ios, '10.0'
end

target 'AurorKit macOS' do
    platform :macos, '10.12'
end

target 'AurorKit tvOS' do
    platform :tvos, '10.0'
end

target 'AurorKit Tests iOS' do
  inherit! :search_paths
  platform :ios, '10.0'

  pod 'Quick'
  pod 'Nimble'
end

target 'AurorKit Tests macOS' do
    inherit! :search_paths
    platform :macos, '10.12'
    
    pod 'Quick'
    pod 'Nimble'
end

target 'AurorKit Tests tvOS' do
    inherit! :search_paths
    platform :tvos, '10.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
        end
    end
end
