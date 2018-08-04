require 'opal'
require 'opal_hot_reloader' # this will move to hyperloop.js

task :build do
  puts "Building app.js..."
  Opal.append_path "app"
  File.open("dist/app.js", "w+") do |out|
   out << Opal::Builder.build("app").to_s
  end
  puts "all done"
end

task :server do
  Rake::Task['build'].execute
  sh 'foreman start'
end
