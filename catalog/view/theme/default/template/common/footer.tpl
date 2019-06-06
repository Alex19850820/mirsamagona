<footer>
  <div class="container">
    <div class="menu-footer">
      <?php foreach ($categories as $category) { ?>
      <div class="footer-item">
        <h5><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h5>
      </div>
      <?php } ?>
      <div class="footer-item">
        <h5><a href="/contacts/">Контакты</a></h5>
      </div>
    </div>
    <div class="row">
      <!-- <?php if (!$informations) { ?>
	   <div class="col-sm-3">
		 <h5><?php echo $text_information; ?></h5>
		 <ul class="list-unstyled">
		   <?php foreach ($informations as $information) { ?>
		   <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
		   <?php } ?>
		 </ul>
	   </div>
	   <?php } ?>
	   <div class="col-sm-3">
		 <h5><?php echo $text_service; ?></h5>
		 <ul class="list-unstyled">
		   <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
		   <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
		   <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		 </ul>
	   </div>
	   <div class="col-sm-3">
		 <h5><?php echo $text_extra; ?></h5>
		 <ul class="list-unstyled">
		   <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
		   <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
		   <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
		   <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
		 </ul>
	   </div>
	   <div class="col-sm-3">
		 <h5><?php echo $text_account; ?></h5>
		 <ul class="list-unstyled">
		   <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
		   <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
		   <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
		   <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
		 </ul>
	   </div>-->
    </div>
    <hr>
    <div class="row" >
      <div class="col-sm-4">
        <div id="logo-footer">
          <?php if ($logo) { ?>
          <?php if ($home == $og_url) { ?>
          <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
          <?php } else { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } ?>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name_logo; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-address-menu">
        <div class="block_with_feedback">
          <span class="head-address">
            <?php echo $address;?>
          </span>
          <?php if($heading_title) { ?>
          <div class="head-phone">
            <span>
              <a href="tel:<?php echo $phone_link; ?>">
                <?php // echo $heading_title; ?>
                <?php echo $telephone; ?>
              </a>
            </span>
            <?php } ?>
          </div>
          <?php if($text_main) { ?>
          <p><?php echo $text_main; ?></p>
          <?php } ?>
          <button type="button"  id="button_feedback" class="btn btn-primary" data-toggle="modal" data-target="#modalFeedback">Заказать звонок<?php //echo $text_button; ?></button>
        </div>
        <div class="modal fade" id="modalFeedback" tabindex="-1" role="dialog" aria-labelledby="modalFeedbackLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <h3 style="text-align: center;
margin-bottom: 0;"><?php echo $heading_title; ?></h3>
              <div class="modal-body">
                <div style="display:inline-block; width: 100%; text-align:right;">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <form class="form-horizontal" id="form-feedback">
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                      <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                    </div>
                    <div class="col-sm-12">
                      <label class="control-label" for="phone"><?php echo $entry_phone; ?></label>
                      <input type="text" id="phone" name="phone" value="<?php echo $phone; ?>" class="form-control" />
                    </div>
                    <?php if($email_active == 1) { ?>
                    <div class="col-sm-12">
                      <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                      <input type="text"  name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                    </div>
                    <?php } ?>
                    <div class="col-sm-12" style="display: none">
                      <label class="control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                      <textarea   name="enquiry" rows="5" id="input-enquiry" class="form-control">Обратный звонок!</textarea>
                    </div>
                  </div>
                  <?php echo $captcha; ?>
                </form>
                <button type="button" id="button_send_feedback" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary"><?php echo $text_send; ?></button>
              </div>
            </div>
          </div>
        </div>
        <script>
		    $('#button_send_feedback').on('click', function () {
			    $.ajax({
				    url: 'index.php?route=extension/module/feedback/write',
				    type: 'post',
				    dataType: 'json',
				    data: $("#form-feedback").serialize(),
				    beforeSend: function () {
					    $('#button_send_feedback').button('loading');
				    },
				    complete: function () {
					    $('#button_send_feedback').button('reset');
				    },
				    success: function (json) {
					    $('.alert-success, .alert-danger').remove();

					    if (json['error']) {
						    $('#form-feedback').after('<div class="alert alert-danger" style="margin:20px 0;"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					    }
					    if (json['success']) {
						    $('#form-feedback').after('<div class="alert alert-success" style="margin:20px 0;"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

						    $('input[name=\'name\']').val('');
						    $('input[name=\'phone\']').val('');
						    $('input[name=\'email\']').val('');
						    $('textarea[name=\'enquiry\']').val('');
					    }
				    }
			    });
		    });
        </script>
      </div>
    </div>
    <p><?php echo $powered; ?></p>
  </div>
</footer>

<!-- ajax pagination -->

<script type="text/javascript">
	$(document).ready(function () {

		var autoscroller = [];
		//setting
		autoscroller.hidePagination = 1;
		autoscroller.autoScroll = 1;
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
</script>
<!--end-pagination-->

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
	(function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
			m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
	(window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

	ym(53651482, "init", {
		clickmap:true,
		trackLinks:true,
		accurateTrackBounce:true,
		webvisor:true
	});
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/53651482" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

</body></html>