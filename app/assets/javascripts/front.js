$(document).ready(function() {

// jQuery Cycle (Homepage)

	$('#images').cycle({ 
	    fx:     'fade', 
	    speed:  1000, 
	    timeout: 0, 
			slideResize:   1,
			fit: 1,
			width:   'auto',
	    next:   '.next a', 
	    prev:   '.previous a',
			pager:  '#pager', 
			before: setBGBefore,
	});
	
	function setBGBefore() {
	 $(this).css({ 'background-image': 'url(' + $(this).find('img').attr('src') + ')'});
	}

	function methodToFixLayout( e ) {
	 var bannerHeight = $('#banner').height();
   var winHeight = $(window).height() - bannerHeight;
   var winWidth = $(window).width();
   $("#images .slide").css({'width':winWidth, 'height':winHeight});
	}
	
	$(methodToFixLayout);
	
	$(window).bind("resize", methodToFixLayout);
	
});
