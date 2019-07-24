
Pod::Spec.new do |s|
  s.name         = "RNAppMetrica"
  s.version      = "1.0.0"
  s.summary      = "RNAppMetrica"
  s.description  = <<-DESC
                  RNAppMetrica
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "9.1"
  s.source       = { :git => "https://github.com/khorark/RNAppMetrica.git", :tag => "master" }
  s.source_files  = "RNAppMetrica/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "YandexMobileMetrica", "3.7.1"

end

  