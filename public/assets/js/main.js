/*
	Strata by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/
var lastTime = new Date().getTime();
(function($) {

	var settings = {

		// Parallax background effect?
			parallax: true,

		// Parallax factor (lower = more intense, higher = less intense).
			parallaxFactor: 20

	};

	skel.breakpoints({
		xlarge: '(max-width: 1800px)',
		large: '(max-width: 1280px)',
		medium: '(max-width: 980px)',
		small: '(max-width: 736px)',
		xsmall: '(max-width: 480px)'
	});

	$(function() {

		var $window = $(window),
			$body = $('body'),
			$header = $('#header'),
			$footer = $('#footer'),
			$main = $('#main');

		// Disable animations/transitions until the page has loaded.
			$body.addClass('is-loading');

			$window.on('load', function() {
				$body.removeClass('is-loading');
			});

		// Touch?
			if (skel.vars.mobile) {

				// Turn on touch mode.
					$body.addClass('is-touch');

				// Height fix (mostly for iOS).
					window.setTimeout(function() {
						$window.scrollTop($window.scrollTop() + 1);
					}, 0);

			}

		// Fix: Placeholder polyfill.
			$('form').placeholder();

		// Prioritize "important" elements on medium.
			skel.on('+medium -medium', function() {
				$.prioritize(
					'.important\\28 medium\\29',
					skel.breakpoint('medium').active
				);
			});

		// Footer.
			skel.on('+medium', function() {
				$footer.insertAfter($main);
			});

			skel.on('-medium !medium', function() {
				$footer.appendTo($header);
			});

		// Header.

			// Parallax background.

				// Disable parallax on IE (smooth scrolling is jerky), and on mobile platforms (= better performance).
					if (skel.vars.browser == 'ie'
					||	skel.vars.mobile)
						settings.parallax = false;

				if (settings.parallax) {

					skel.on('change', function() {

						if (skel.breakpoint('medium').active) {

							$window.off('scroll.strata_parallax');
							$header.css('background-position', 'top left, center center');

						}
						else {

							$header.css('background-position', 'left 0px');

							$window.on('scroll.strata_parallax', function() {
								$header.css('background-position', 'left ' + (-1 * (parseInt($window.scrollTop()) / settings.parallaxFactor)) + 'px');
							});

						}

					});

					$window.on('load', function() {
						$window.triggerHandler('scroll');
					});

				}

		// Main Sections: Two.

			// Lightbox gallery.
				$window.on('load', function() {

					$('#two').poptrox({
						caption: function($a) { return $a.next('h3').text(); },
						overlayColor: '#2c2c2c',
						overlayOpacity: 0.85,
						popupCloserText: '',
						popupLoaderText: '',
						selector: '.work-item a.image',
						usePopupCaption: true,
						usePopupDefaultStyling: false,
						usePopupEasyClose: false,
						usePopupNav: true,
						windowMargin: (skel.breakpoint('small').active ? 0 : 50)
					});

				});

	});
	var loadMessages = function (){
		$.ajax({
			url: '/api/v1/conversations/' + conversationId + '/last_messages',
			data: {
				from: lastTime
			},
			success: function(data){
				lastTime = new Date().getTime();
				populateMessages(data);
			},
			complete: function(){
				setTimeout(loadMessages, 1500);
			}
		});
	}
	var populateMessages = function(messages) {
		var container = $('.js-chat');
		var screenboard = $('.screenboard');
		$.each(messages, function(e,i){
			var clase = 'pink ';
			var clase2 = '';
			if (i['type'] == 'lady'){
				clase = 'purple lighten-4 talk-to-marie';
				clase = 'talk-to-marie';
			}
			console.log(container);


			if(i['content'] != 'non'){
				container.append('<div class=" ' + clase2 + ' row hello"><div class="col s3 m9"><div class="card-panel ' + clase + ' lighten-3 z-depth-5"><span class="black-text">' + i['content'] +'</span></div></div></div>')
			}
			else {
				if(i['video'] != null && i['video'] != ''){
					screenboard.show(300).html('<iframe src="'+i['video']+'" frameborder="0"></iframe>')
				}
				else if(i['image'] != null && i['image'] != ''){
					screenboard.show(300).html($('<img src="'+i['image']+'"/>'))
				}
				
			}
		})
	}
	$('.send-message').submit(function(e){
		e.preventDefault();
		var form = $(this);
		$.ajax({
			url: '/api/v1/messages',
			method: 'POST',
			data: {
				content: form.find('input[name=content]').val(),
				conversation_id: form.find('input[name=conversation_id]').val(),
				authenticity_token: form.find('input[name=authenticity_token]').val()
			},
		});
		form.find('input[name=content]').val('')
		return false;
	})
	$('.screenboard').hide()
	loadMessages();
})(jQuery);