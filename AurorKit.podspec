Pod::Spec.new do |spec|
  spec.name = "AurorKit"
  spec.version = "0.1.0"
  spec.summary = "Swift extensions and tools"

  spec.homepage = "https://github.com/almazrafi/AurorKit"
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { "Almaz Ibragimov" => "almazrafi@gmail.com" }
  spec.source = { :git => "https://github.com/almazrafi/AurorKit.git", :tag => "#{spec.version}" }

  spec.swift_version = '5.0'
  spec.requires_arc = true

  spec.ios.frameworks = 'Foundation'
  spec.ios.deployment_target = "10.0"

  spec.osx.frameworks = 'Foundation'
  spec.osx.deployment_target = "10.12"

  spec.watchos.frameworks = 'Foundation'
  spec.watchos.deployment_target = "3.0"

  spec.tvos.frameworks = 'Foundation'
  spec.tvos.deployment_target = "10.0"

  spec.subspec 'Extensions' do |extensions|
    extensions.source_files = "AurorKit/Extensions/**/*.swift"

    extensions.ios.frameworks = 'QuartzCore', 'CoreGraphics', 'UIKit'
    extensions.osx.frameworks = 'QuartzCore', 'CoreGraphics', 'AppKit'
    extensions.watchos.frameworks = 'QuartzCore', 'CoreGraphics', 'UIKit'
    extensions.tvos.frameworks = 'QuartzCore', 'CoreGraphics', 'UIKit'
  end

  spec.subspec 'Events' do |events|
    events.source_files = "AurorKit/Events/**/*.swift"
  end

  spec.subspec 'Log' do |log|
    log.source_files = "AurorKit/Log/**/*.swift"

    log.ios.frameworks = 'UIKit'
    log.tvos.frameworks = 'UIKit'

    log.dependency 'AurorKit/Extensions'
  end
end
