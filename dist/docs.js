// namespace
window.semantic = {
  handler: {}
};


// ready event
semantic.ready = function() {

  // selector cache
  var

    $sticky              = $('.ui.sticky'),
    $ui                  = $('.ui').not('.hover, .down'),
    $menu                = $('#menu'),
    $hideMenu            = $('#menu .hide.item'),
    
    $container           = $('.main.container'),
    $allHeaders          = $('.main.container > h2'),
    $sectionHeaders      = $container.children('h2'),
    $followMenu          = $container.find('.following.menu'),
    $sectionExample      = $container.children('h3, h4'),
    $exampleHeaders      = $sectionExample,
    $footer              = $('.page > .footer'),

    $sidebarButton       = $('.fixed.launch.button'),

    handler;


  // event handlers
  handler = {

    createWaypoints: function() {
      $sectionHeaders
        .visibility({
          once: false,
          offset: 110,
          onTopVisible: handler.activate.accordion,
          onTopPassed: handler.activate.section,
          onBottomPassed: handler.activate.section,
          onTopPassedReverse: handler.activate.previous
        })
      ;
      $sectionExample
        .visibility({
          once: false,
          offset: 110,
          onTopPassed: handler.activate.example,
          onTopPassedReverse: handler.activate.previousExample
        })
      ;
      $footer
        .visibility({
          once: false,
          onTopVisible: function() {
            var
              $title = $followMenu.find('> .item > .title').last()
            ;
            $followMenu
              .accordion('open', $title)
            ;
          }
        })
      ;
    },

    activate: {
      previous: function() {
        var
          $menuItems  = $followMenu.children('.item'),
          $section    = $menuItems.filter('.active'),
          index       = $menuItems.index($section)
        ;
        if($section.prev().size() > 0) {
          $section
            .removeClass('active')
            .prev('.item')
            .addClass('active')
          ;
          $followMenu
            .accordion('open', index - 1)
          ;
        }
      },
      accordion: function() {
        var
          $section       = $(this),
          index          = $sectionHeaders.index($section),
          $followSection = $followMenu.children('.item'),
          $activeSection = $followSection.eq(index)
        ;
        
        $followMenu
          .accordion('open', index)
        ;
      },
      section: function() {
        var
          $section       = $(this),
          index          = $sectionHeaders.index($section),
          $followSection = $followMenu.children('.item'),
          $activeSection = $followSection.eq(index)
        ;
        $followSection
          .not($activeSection)
          .removeClass('active')
          .find('.item')
            .removeClass('active')
        ;
        $activeSection
          .addClass('active')
        ;
      },
      previousExample: function() {
        var
          $section       = $(this),
          index          = $exampleHeaders.index($section),
          $followSection = $followMenu.find('.menu > .item'),
          $activeSection = $followSection.eq(index).prev(),
          inClosedTab    = ($(this).closest('.tab:not(.active)').size() > 0),
          anotherExample = ($(this).filter('.another.example').size() > 0)
        ;
        if(!inClosedTab && !anotherExample) {
          $followSection
            .removeClass('active')
          ;
          $activeSection
            .addClass('active')
          ;
        }
      },
      example: function() {
        var
          $section       = $(this),
          index          = $exampleHeaders.index($section),
          $followSection = $followMenu.find('.menu > .item'),
          $activeSection = $followSection.eq(index),
          inClosedTab    = ($(this).closest('.tab:not(.active)').size() > 0),
          anotherExample = ($(this).filter('.another.example').size() > 0)
        ;
        if(!inClosedTab && !anotherExample) {
          $followSection
            .removeClass('active')
          ;
          $activeSection
            .addClass('active')
          ;
        }
      }
    },


    tryCreateMenu: function(event) {
      if($(window).width() > 640) {
        //alert($container.find('.following.menu').size());
        //if($container.find('.following.menu').size() === 0) {
          handler.createMenu();
          handler.createWaypoints();
          //$(window).off('resize.menu');
        //}
      }
    },



    createMenu: function() {
      // grab each h3


      
      $followMenu
        .accordion({
          exclusive: false,
          onChange: function() {
            $sticky.sticky('refresh');
          }
        })
        .find('.menu a[href], .title[href]')
          .on('click', handler.scrollTo)
      ;
      $sticky
        .transition('fade')
      ;
    },

    scrollTo: function(event) {
      var
        id       = $(this).attr('href').replace('#', ''),
        $element = $('#'+id),
        position = $element.offset().top
      ;
      $element
        .addClass('active')
      ;
      $('html, body')
        .animate({
          scrollTop: position
        }, 500)
      ;
      location.hash = '#' + id;
      event.stopImmediatePropagation();
      event.preventDefault();
      return false;
    }

    
  };




  //handler.createAnchors();
  //handler.createMenu();
  handler.tryCreateMenu();


  // $(window).on('resize.menu', function() {
    
  //   handler.tryCreateMenu();
  // });
 


  $sticky
    .sticky({
      context : '.main.container',
      offset : 40
    })
  ;

  
  $menu
    .sidebar({
      transition       : 'overlay',
      mobileTransition : 'uncover'
    })
    .sidebar('attach events', '.launch.button')
  ;


}; //semantic.ready

document.addEventListener('DOMContentLoaded', function(){ 
    semantic.ready();
}, false);