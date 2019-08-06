require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNAppMetrica"
  s.version        = package['version'].gsub(/v|-beta/, '')
  s.summary        = package['description']
  s.author         = package['author']
  s.license        = package['license']
  s.homepage       = package['homepage']
  s.platform     = :ios, "9.1"
  s.source       = { :git => "https://github.com/khorark/rn-app-metrica", :tag => "master" }
  s.source_files  = "RNAppMetrica/**/*.{h,m,swift}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "YandexMobileMetrica", "3.7.1"

end

  