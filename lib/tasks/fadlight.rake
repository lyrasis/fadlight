namespace :fadlight do
  namespace :assets do
    FADLIGHT_ASSETS = {
      "FAVICON_URL" => "app/assets/images/favicon.ico",
      "FOOTER_URL" => "app/views/shared/_footer.html.erb",
      "HEADER_URL" => "app/views/shared/_header.html.erb",
      "JS_URL" => "app/assets/javascripts/fadlight.js",
      "LOCALES_URL" => "config/locales/en.yml",
      "LOGO_URL" => "app/assets/images/blacklight/logo.png",
      "REPOSITORY_URL" => "config/repositories.yml",
      "THEME_CSS_URL" => "app/assets/stylesheets/fadlight.css",
    }

    desc 'Cleanup FadLight assets'
    task :clean do
      FADLIGHT_ASSETS.values.each do |a|
        path = File.join(Rails.root, a)
        FileUtils.rm path if File.file? path
      end
    end

    desc 'Download FadLight assets'
    task :download do
      FADLIGHT_ASSETS.each do |envvar, a|
        Dir.chdir Rails.root
        url = ENV[envvar]
        if url
          puts "Downloading: #{url} #{a}"
          `wget -O #{a} #{url}`
        end
      end
    end
  end
end
