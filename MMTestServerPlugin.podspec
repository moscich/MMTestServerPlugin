#
# Be sure to run `pod lib lint MMTestServerPlugin.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MMTestServerPlugin"
  s.version          = "0.1.0"
  s.summary          = "A short description of MMTestServerPlugin."
  s.description      = <<-DESC
                       An optional longer description of MMTestServerPlugin

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/MMTestServerPlugin"
  s.license          = 'MIT'
  s.author           = { "Marek Mościchowski" => "marek.moscichowski@miquido.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/MMTestServerPlugin.git", :tag => s.version.to_s }


  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  
  s.dependency 'SocketRocket', '~> 0.2'
end
