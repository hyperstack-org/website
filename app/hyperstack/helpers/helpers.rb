def is_edge?
  site = `window.location.hostname`.split('.')[0]
  site == 'edge' || site == 'localhost' ? true : false
end
