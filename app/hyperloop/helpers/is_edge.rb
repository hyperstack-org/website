def is_edge?
  hostname = `window.location.hostname`
  hostname.split('.')[0] == 'edge' ? true : false
end
