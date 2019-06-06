// $(document).ready(function(){
// 	$('#phone').inputmask("+9(999) 999-9999");
// });
<!-- ajax pagination -->
	$(document).ready(function () {

		var autoscroller = [];
		//setting
		autoscroller.hidePagination = 1;
		autoscroller.autoScroll = 0;
		autoscroller.catcher = '#endless';
		autoscroller.delay = 1000;
		//setting

		autoscroller.loading = 0;


		$(window).scroll(function() {


			if(inWindow(autoscroller.catcher) && !autoscroller.loading && autoscroller.autoScroll) {

				autoscroller.loading = true;
				$('#endless .fa-refresh').addClass('fa-spin');

				setTimeout(function() {

					$('#endless').trigger('click');

				}, autoscroller.delay);

			}

		});

		if (autoscroller.hidePagination) {
			$('.pagination').hide();
		}


		if ($('.product-grid, .product-list').length) {

			if ($('.pagination').length && !$('.pagination > li:last-child').hasClass('active')) {

				$('#content div.col-sm-6.text-right').hide();

				$('.pagination').parent().before('<div class="col-xs-12 text-center"><button class="btn btn-success btn-lg" id="endless" style="margin: 15px auto; padding: 10px 120px;" ><i class="fa fa-refresh"></i> </button></div>');

				$('#endless').on('click', function(e) {

					var lastProduct = $('.pagination').parent().parent().parent().find('.product-layout:last-child');

					var nextPage = $('ul.pagination li.active').next().find('a:first-child');

					$.ajax({
						url: $(nextPage).attr('href'),
						beforeSend: function(){
							$('#endless .fa-refresh').addClass('fa-spin');
						},
						success: function(data){

							var products = $(data).find('.product-list');

							lastProduct.after(products);







							if (localStorage.getItem('display') == 'grid') {

								cols = $('#column-right, #column-left').length;

								if (cols == 2) {
									$(products).attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
								} else if (cols == 1) {
									$(products).attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
								} else {
									$(products).attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
								}

							}


							$('.pagination').html($(data).find('.pagination > *'));

							nextPage = $('ul.pagination li.active').next().find('a:first-child');


							if (nextPage.length == 0) {
								$('#endless').remove();
							} else {
								$('#endless .fa-refresh').removeClass('fa-spin');
							}

							autoscroller.loading = 0;
						}
					});

					return false;
				});

			}
		}


		function inWindow(el){
			if($(el).length) {
				var scrollTop = $(window).scrollTop();
				var windowHeight = $(window).height();
				var offset = $(el).offset();

				if(scrollTop <= offset.top && ($(el).height() + offset.top) < (scrollTop + windowHeight))
					return true;
			};

			return false;
		}

	});
<!--end pagination-->