<div class="middle" style="text-align: center;">
  <table class="list_manu">
  <?php for ($i = 0; $i < sizeof($manufacturers); $i = $i + 8) { ?>
    <tr>
      <?php for ($j = $i; $j < ($i + 8); $j++) { ?>
	  
      <td style="width: 20%;">
	  <?php if (isset($manufacturers[$j])) { ?>
      <a href="<?php echo str_replace('&', '&amp;', $manufacturers[$j]['href']); ?>"><img src="<?php echo "image/".$manufacturers[$j]['manufacturer_image']; ?>" title="<?php echo $manufacturers[$j]['name']; ?>" alt="<?php echo $manufacturers[$j]['name']; ?>" width=100px/></a><br />
      <a href="<?php echo str_replace('&', '&amp;', $manufacturers[$j]['href']); ?>"><?php echo $manufacturers[$j]['name']; ?></a><br />
      <?php } ?>
	  </td>
	  
      <?php } ?>
    </tr>
    <?php } ?>
  </table>
</div>