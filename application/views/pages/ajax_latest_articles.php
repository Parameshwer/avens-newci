<?php foreach ($latest_articles as $row) { ?>
	<div class="media">
	<div class="media-left">
		<img width="150" height="150" src="<?php echo $row['article_image']?>" class="attachment-thumbnail wp-post-image" alt="jcb-19">		
	</div>
		<div class="media-body">
		<?php //echo $row['post_content']; ?>		
		<div class="media-body">
		<h1 style="text-align: left;"><a href="<?php echo $row['pdf_link']; ?>" target="_blank"><?php echo $row['article_name']; ?></a></h1>
		<p><?php echo $row['author_name']; ?></p>
		<p style="text-align: right;"><a href="<?php echo base_url(); ?>page/journals/"><?php echo $row['journal_name']; ?></a>		
		</p></div>
	</div>
</div>
<?php } ?>