map "/" do
  use Rack::Static, urls: [""],
                    root: File.expand_path('./app'),
                    index: 'index.html'
  run lambda {}
end
