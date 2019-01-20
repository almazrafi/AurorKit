Pod::Spec.new do |s|
  s.name         = "AurorKit"
  s.version      = "0.0.1"
  s.summary      = "Swift extensions and tools"
  
  s.homepage     = "https://github.com/almazrafi/AurorKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Almaz Ibragimov" => "almazrafi@gmail.com" }
  s.source       = { :git => "https://github.com/almazrafi/AurorKit.git", :tag => "#{s.version}" }

  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.12"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "10.0"

  s.default_subspec = 'Extensions'

  s.subspec 'Extensions' do |extensions|
    extensions.source_files  = "AurorKit/Extensions"
  end

  s.subspec 'Events' do |events|
    events.source_files  = "AurorKit/Events"
  end
end
