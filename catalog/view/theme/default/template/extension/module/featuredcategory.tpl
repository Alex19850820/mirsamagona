<h3><?php echo $name; ?></h3>
<div class="row">
  <?php foreach ($categories as $category) { ?>
  <div class="col-md-3 category_box">
      <div class="image">
         <a href="<?php echo $category['href']; ?>">
          <center>
            <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></center>
          </a>
      </div>
      <div class="category-name">
        <h4><center><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></center></h4>  
      </div>
    </div>
  <?php } ?>
</div>
