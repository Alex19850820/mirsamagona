<?php echo $header; ?>
<div id="wrapper">
<div id="content_manu">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="middle">
  <?php foreach ($modules as $module) { ?>
  <?php echo ${$module['code']}; ?>
  <?php } ?>
  </div>
</div></div>
<?php echo $footer; ?> 