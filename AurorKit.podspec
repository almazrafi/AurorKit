Pod::Spec.new do |spec|
  spec.name = "AurorKit"
  spec.version = "0.0.4"
  spec.summary = "Swift extensions and tools"

  spec.homepage = "https://github.com/almazrafi/AurorKit"
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { "Almaz Ibragimov" => "almazrafi@gmail.com" }
  spec.source = { :git => "https://github.com/almazrafi/AurorKit.git", :tag => "#{spec.version}" }

  spec.swift_version = '4.2'
  spec.requires_arc = true

  spec.ios.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  spec.ios.deployment_target = "10.0"

  spec.osx.frameworks = 'Foundation', 'CoreGraphics'
  spec.osx.deployment_target = "10.12"

  spec.watchos.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  spec.watchos.deployment_target = "3.0"

  spec.tvos.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  spec.tvos.deployment_target = "10.0"

  spec.subspec 'Extensions' do |extensions|
    extensions.source_files = "AurorKit/Extensions/**/*.swift"

    extensions.macos.exclude_files = [
      "AurorKit/Extensions/NSLayoutConstraintExtension.swift",
      "AurorKit/Extensions/UIColorExtension.swift",
      "AurorKit/Extensions/UIEdgeInsetsExtension.swift",
      "AurorKit/Extensions/UIImageExtension.swift",
      "AurorKit/Extensions/UIViewBorderExtension.swift",
      "AurorKit/Extensions/UIViewControllerExtension.swift",
      "AurorKit/Extensions/UIViewExtension.swift",
      "AurorKit/Extensions/UIViewShadowExtension.swift",
      "AurorKit/Extensions/UIWindowExtension.swift"
    ]

    extensions.watchos.exclude_files = [
      "AurorKit/Extensions/NSLayoutConstraintExtension.swift",
      "AurorKit/Extensions/UIViewBorderExtension.swift",
      "AurorKit/Extensions/UIViewControllerExtension.swift",
      "AurorKit/Extensions/UIViewExtension.swift",
      "AurorKit/Extensions/UIViewShadowExtension.swift",
      "AurorKit/Extensions/UIWindowExtension.swift"
    ]
  end

  spec.subspec 'Events' do |events|
    events.source_files = "AurorKit/Events/**/*.swift"
  end

  spec.subspec 'Log' do |log|
    log.source_files = "AurorKit/Log/**/*.swift"

    log.macos.exclude_files = [
      "AurorKit/Log/ViewControllers/LoggedNavigationController.swift",
      "AurorKit/Log/ViewControllers/LoggedPageViewController.swift",
      "AurorKit/Log/ViewControllers/LoggedTabBarController.swift",
      "AurorKit/Log/ViewControllers/LoggedTableViewController.swift",
      "AurorKit/Log/ViewControllers/LoggedViewController.swift"
    ]

    log.watchos.exclude_files = [
      "AurorKit/Log/ViewControllers/LoggedNavigationController.swift",
      "AurorKit/Log/ViewControllers/LoggedPageViewController.swift",
      "AurorKit/Log/ViewControllers/LoggedTabBarController.swift",
      "AurorKit/Log/ViewControllers/LoggedTableViewController.swift",
      "AurorKit/Log/ViewControllers/LoggedViewController.swift"
    ]
  end
end
