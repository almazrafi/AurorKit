using_bundler = defined? Bundler

unless using_bundler
    puts "\nPlease re-run using:".red
    puts "  bundle exec pod install\n\n"

    exit(1)
end

use_frameworks!

def common_pods
end

def common_tests_pods
    common_pods

    pod 'Quick'
    pod 'Nimble'
end

target 'AurorKit iOS' do
    platform :ios, '10.0'

    common_pods
end

target 'AurorKit macOS' do
    platform :macos, '10.12'

    common_pods
end

target 'AurorKit tvOS' do
    platform :tvos, '10.0'

    common_pods
end

target 'AurorKit Tests iOS' do
    inherit! :search_paths
    platform :ios, '10.0'

    common_tests_pods
end

target 'AurorKit Tests macOS' do
    inherit! :search_paths
    platform :macos, '10.12'

    common_tests_pods
end

target 'AurorKit Tests tvOS' do
    inherit! :search_paths
    platform :tvos, '10.0'
end
