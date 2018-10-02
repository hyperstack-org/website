def is_edge?
  site = `window.location.hostname`.split('.')[0]
  site == 'edge' || site == 'localhost' ? true : false
end

def is_localhost?
  site = `window.location.hostname`.split('.')[0]
  site == 'localhost' ? true : false
end
