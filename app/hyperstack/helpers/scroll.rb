# these are not used

def scroll_to_top
  `window.scroll({
    top: 0
  });`
end

def scroll_to_element_id id
  trimmed_id = id.tr('#','')
  `var element = document.getElementById(trimmed_id);
   element.scrollIntoView(true);`
end
