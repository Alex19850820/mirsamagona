<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title;  ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
  <meta property="og:title" content="<?php echo $title; ?>" />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="<?php echo $og_url; ?>" />
  <?php if ($og_image) { ?>
  <meta property="og:image" content="<?php echo $og_image; ?>" />
  <?php } else { ?>
  <meta property="og:image" content="<?php echo $logo; ?>" />
  <?php } ?>
  <meta property="og:site_name" content="<?php echo $name; ?>" />
  <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
  <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" ></script>
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
  <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
  <?php foreach ($styles as $style) { ?>
  <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  <script src="catalog/view/javascript/common.js"></script>
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($scripts as $script) { ?>
  <script src="<?php echo $script; ?>" ></script>
  <?php } ?>
  <?php foreach ($analytics as $analytic) { ?>
  <?php echo $analytic; ?>
  <?php } ?>
</head>
<body class="<?php echo $class; ?>">
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>

        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container" style="border: 1px solid #ddd; background-color: #f5f5f5; border-radius: 3px; margin-top: 15px;">
    <div class="row" >
      <div class="col-sm-4">
        <div id="logo">
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
            <div class="dropdown">
              <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-user"></i>
                <span class="hidden-xs hidden-sm hidden-md">
                  <?php echo $text_account; ?> <span class="caret"></span>
                </span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <?php if ($logged) { ?>
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                <?php } else { ?>
                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                <?php } ?>
              </ul>
            </div>
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
      <div class="col-nav-menu">
        <div class="col-sm-5"><?php echo $search; ?>
        </div>
        <div class="col-sm-3"><?php echo $cart; ?></div>
      </div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <!--data-toggle="dropdown"-->
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"  >
            <?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>