Pod::Spec.new do |s|

  s.name         = "IPImage"
  s.version      = "1.0.2"
  s.summary      = "An easy way to generate circular placeholder images."
  s.description  = <<-DESC
IPImage aims to be an easy way to generate placeholder image for your UIViewController (or anywhere you might need an UIImage object). Just provide the text, size, and colors. IPImage is useful for directory-like views.
                   DESC
  s.homepage     = "https://github.com/bofiaza/IPImage"
  s.license      = "MIT"
  s.author             = "bofiaza"
  s.social_media_url   = "http://twitter.com/bofiaza"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/bofiaza/IPImage.git", :tag => "#{s.version}" }
  s.source_files  = "IPImage/Sources/**/*.{swift}"
  s.documentation_url = "https://github.com/bofiaza/IPImage/blob/master/docs/index.html"

end
