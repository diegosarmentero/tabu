
/* ==============================================================================

				JS that must be in Html files / cleected here

===============================================================================*/




// Pretty photo 
$(document).ready(function(){
	$("area[rel^='prettyPhoto']").prettyPhoto();
	
	$(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'light_square',slideshow:3000, autoplay_slideshow: true});
		
	$(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'fast',slideshow:10000, hideflash: true});
	
	$("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
	custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
	changepicturecallback: function(){ initialize(); }
	});
	
	$("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
	custom_markup: '<div id="bsap_1259344" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div><div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
	changepicturecallback: function(){ _bsap.exec(); }
	});
});




// Text slider 
$(function(){
	$('#slider-id').liquidSlider({
	autoSlide:false,
	autoHeight:true
	});
});




// Twitter plugin
jQuery(function($){
	$(".tweet").tweet({
	username: "wrapbootstrap",
	//avatar_size: 30, //If you remove the comment from this line will display the avatar of twitter username and you must remove the default twitter icon from css/jquery.tweet.css
	count: 3,
	loading_text: "loading tweets..."
	});
});




// Flickr plugin
$('.basicuse').jflickrfeed({
	limit: 14,
	qstrings: {
	id: '37304598@N02' //Here your Flickr Id
	},
	itemTemplate: '<li><a href="{{image_b}}"><img src="{{image_s}}" alt="{{title}}" /></a></li>'
});




// Go to top
$(document).ready(function() {
	$().UItoTop({ easingType: 'easeOutQuart' });
});




// tooltip
$('.tooltip-title').tooltip({
  selector: "a[rel=tooltip], li[rel=tooltip]"
})
$('.tooltip').tooltip()




// Main menu 
$(document).ready(function(){
	$("#jMenu").jMenu();
});



// Toggle
$(function(){
	$('.myToggler').click(function(e){
		$(this).next().slideToggle();
		var sign=$(this).children(':first');
		sign.text(sign.text() == '\uff0b'?'\uff0d':'\uff0b');
		e.preventDefault;
	});
});



// Tabs
$(function () {
    $('#myTab a:first').tab('show');
 })
 $('a[data-toggle="tab"]').on('shown', function (e) {
  e.target // activated tab
  e.relatedTarget // previous tab
});



// Audio - music player
audiojs.events.ready(function() {
	audiojs.createAll();
});


// First Word Color

$('h2').each(function() {
   var h = $(this).html();
   var index = h.indexOf(' ');
   if(index == -1) {
	   index = h.length;
   }
   $(this).html('<span class="h2firstword">' + h.substring(0, index) + '</span>' + h.substring(index, h.length));
});

  

 // popover demo
$("a[rel=popover]")
  .popover()
  .click(function(e) {
	e.preventDefault()
  })
  
  

// button state demo
$('#fat-btn')
  .click(function () {
	var btn = $(this)
	btn.button('loading')
	setTimeout(function () {
	  btn.button('reset')
	}, 3000)
  });


// Flex carousel
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        animationLoop: true,
        itemWidth: 270,
        itemMargin: 30,
		directionNav: false, 
		controlNav: true,
		smoothHeight: false,
		animationLoop: true, 
		pauseOnAction: true,            
    	pauseOnHover: true, 
		minItems: 1,
		mousewheel: false,  
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });


// SLIDER REVOLUTION SETTINGS //////////////////////////////
var api;
jQuery(document).ready(function() {
api =  jQuery('.fullwidthabnner').revolution({

delay:9000,       //The time one slide stays on the screen in Milliseconds (Default: 9000)
startheight:420,  //Basic Height of the Slider in the desktop resolution in pixel, other screen sizes will be calculated from this (Default: 490)   It should be similiar to the settings of the style sheet.  If you use a fullwidth banner, ti will deinfe the max. Height of the banner by resizing of the browser. The banner wont ne heigher than this value.
startwidth:1366,  //Basic Width of the Slider in the desktop resolution in pixel, other screen sizes will be calculated from this (Default: 890)   It should be similiar to the settings of the style sheet.  If you use a fullwidth banner, ti will deinfe the max. Width of the banner by resizing of the browser.
hideThumbs:200, // Time after that the Thumbs will be hidden(Default: 200),
thumbWidth:100, //the basic Width of one Thumbnail (only if thumb is selected. Default:100)   
thumbHeight:50, //the basic Height of one Thumbnail (only if thumb is selected Default 50)
thumbAmount:5, //the amount of the Thumbs visible same time (only if thumb is selected)
//** All Thumbs will be hidden in smallest Responsive Level, and in smaller level default size is reseted to 60x30px. Can be modificated in the settings.css file)
navigationType:"both",   
//Display type of the navigation bar (Default:"none")  
//Options: (bullet, thumb, none, both)
//thumb   ** In Fullwidth version thumbs wont be displayed  if navigation offset set to shwop thumbs outside of the container ! Thumbs must be showen in the container!
navigationArrows:"verticalcentered",   
//Display position of the Navigation Arrows (Default: "nexttobullets")
//Options: (nexttobullets, verticalcentered, none)
//verticalcentered   ** By navigation Type Thumb arrows always centered or none visible
navigationStyle:"round",  
//Look of the navigation bullets (Default: "round")
//Options: (round, navbar, round-old, square-old, navbar-old)
//navbar-old   ** If you choose navbar-old, we recommend to choose Navigation Arrows to nexttobullets 
touchenabled:"on",
//Enable Swipe Function on touch devices (Default: "on") 
//Options: (on,off)
onHoverStop:"on",       
//Stop the Timer when hovering the slider
//Options: (on, off)
navOffsetHorizontal:0, //The Bar is centered but could be moved this pixel count left(e.g. -10) or right (Default: 0)  ** By resizing the banner, it will be always centered !!
navOffsetVertical:20, //The Bar is bound to the bottom but could be moved this pixel count up (e. g. -20) or down (Default: 20)
stopAtSlide:-1, //-1 or 1 to 999. Stop at selected Slide Number. If set to -1 it will loop without stopping. Only available if stopAfterLoops is not equal -1 !
stopAfterLoops:-1, // -1 or 0 to 999. Stop at selected Slide Number (stopAtSlide) after slide looped "x" time, where x this Number. If set to -1 it will loop without stopping. Only available if stopAtSlide not equal -1 !
shadow:0,
//The Shadow display underneath the banner
//Options: (0, 1, 2, 3)
//0 No Shadow
fullWidth:"on", //on/off It turns on the Horizontal Centering of Images in FullWidth version. In Case the Image is bigger then the container width, it fits the image with its height in the container and centers horizontally.

	});
});



