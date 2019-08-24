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

    extensions.macos.exclude_files = [
      "AurorKit/Extensions/NSLayoutConstraint+Extensions.swift",
      "AurorKit/Extensions/UIApplication+Extensions.swift",
      "AurorKit/Extensions/UIColor+Extensions.swift",
      "AurorKit/Extensions/UIDevice+Extensions.swift",
      "AurorKit/Extensions/UIEdgeInsets+Extensions.swift",
      "AurorKit/Extensions/UIImage+Extensions.swift",
      "AurorKit/Extensions/UINavigationController+Extensions.swift",
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
      "AurorKit/Extensions/CACornerMask+Extensions.swift",
      "AurorKit/Extensions/CAGradientLayer+Direction.swift",
      "AurorKit/Extensions/CAGradientLayer+Gradient.swift",
      "AurorKit/Extensions/CALayer+Border.swift",
      "AurorKit/Extensions/CALayer+RoundedCorners.swift",
      "AurorKit/Extensions/CALayer+Shadow.swift",
      "AurorKit/Extensions/NSLayoutConstraint+Extensions.swift",
      "AurorKit/Extensions/UIApplication+Extensions.swift",
      "AurorKit/Extensions/UIDevice+Extensions.swift",
      "AurorKit/Extensions/UINavigationController+Extensions.swift",
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

    log.ios.frameworks = 'UIKit'
    log.tvos.frameworks = 'UIKit'

    log.dependency 'AurorKit/Extensions'

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
