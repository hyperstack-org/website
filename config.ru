map "/" do
  use Rack::Static, urls: [""],
                    root: File.expand_path('./public'),
                    index: 'index.html'
  run lambda {}
end
