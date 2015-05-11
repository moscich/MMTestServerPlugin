Pod::Spec.new do |s|
  s.name             = "MMTestServerPlugin"
  s.version          = "0.1.0"
  s.summary          = "Library that enables launching asynchronous events in the application"
  s.homepage         = "https://github.com/moscich/MMTestServerPlugin"
  s.license          = 'MIT'
  s.author           = { "Marek Mościchowski" => "marek.moscichowski@miquido.com" }
  s.source           = { :git => "https://github.com/moscich/MMTestServerPlugin.git", :tag => s.version.to_s }


  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  
  s.dependency 'SocketRocket', '~> 0.2'
end
