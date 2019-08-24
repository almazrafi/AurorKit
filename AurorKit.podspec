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
      "AurorKit/Extensions/NSLayoutConstraint+Extensions.swift",
      "AurorKit/Extensions/UIApplication+Extensions",
      "AurorKit/Extensions/UIColor+Extensions.swift",
      "AurorKit/Extensions/UIDevice+Extensions.swift",
      "AurorKit/Extensions/UIEdgeInsets+Extensions.swift",
      "AurorKit/Extensions/UIImage+Extensions.swift",
      "AurorKit/Extensions/UINavigationController+Extensionsswift",
      "AurorKit/Extensions/UIScreen+Extensions.swift",
      "AurorKit/Extensions/UIStackView+Extensions.swift",
      "AurorKit/Extensions/UIView+Border.swift",
      "AurorKit/Extensions/UIView+Extensions.swift",
      "AurorKit/Extensions/UIView+RoundedCorners.swift",
      "AurorKit/Extensions/UIView+Shadow.swift",
      "AurorKit/Extensions/UIViewController+Extensions.swift",
      "AurorKit/Extensions/UIWindow+Extensions.swift"
    ]

    extensions.watchos.exclude_files = [
      "AurorKit/Extensions/NSLayoutConstraint+Extensions.swift",
      "AurorKit/Extensions/UIApplication+Extensions",
      "AurorKit/Extensions/UIDevice+Extensions.swift",
      "AurorKit/Extensions/UINavigationController+Extensionsswift",
      "AurorKit/Extensions/UIScreen+Extensions.swift",
      "AurorKit/Extensions/UIStackView+Extensions.swift",
      "AurorKit/Extensions/UIView+Border.swift",
      "AurorKit/Extensions/UIView+Extensions.swift",
      "AurorKit/Extensions/UIView+Shadow.swift",
      "AurorKit/Extensions/UIView+RoundedCorners.swift",
      "AurorKit/Extensions/UIViewController+Extensions.swift",
      "AurorKit/Extensions/UIWindow+Extensions.swift"
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
