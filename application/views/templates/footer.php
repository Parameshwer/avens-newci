<footer id="colophon" class="site-footer" role="contentinfo">

	<!-- .site-info -->
	<div class="container">
		<div class="row" id="footer-top">
			<div class="col-sm-4 col-md-3">
				<h4>Company</h4>
				<ul>
					<li><a href="http://www.avensonline.org/about-us">About Us</a></li>
					<li><a href="http://www.avensonline.org/policies">Policies</a></li>
					<li><a href="http://www.avensonline.org/membership">Membership</a></li>
				</ul>
			</div>
			<div class="col-sm-4 col-md-3">
				<h4>Journals</h4>
				<ul>
					<li><a href="http://www.avensonline.org/journals/?sort_type=medical">Medical</a></li>
					<li><a href="http://www.avensonline.org/journals/?sort_type=biology">Biology</a></li>
					<li><a href="http://www.avensonline.org/journals/?sort_type=pharmaceutical">Pharmacy</a></li>				
					<li><a href="http://www.avensonline.org/journals/?sort_type=biotechnology">Biotechnology</a></li>				
				</ul>
			</div>
			<div class="col-sm-4 col-md-3 address-section">
				<h4>Avens Publishing Group LLC</h4>
				<ul>
					<li>47 Hemlock Dr,  Northborough</li>
					<li>MA 01532.</li>
					<li>USA</li>
				</ul>
			</div>
			<div class="col-sm-4 col-md-3 address-section">
				<h4>Avens Publishing Group</h4>
				<ul>
					<li>502 Jyothiraditya, Srinagar Colony</li>
					<li>Hyderabad, India</li>
					<li>Email : contact@avensonline.org</li>
				</ul>
			</div>
			<div class="col-sm-4 col-md-3" id="contact-section">
				<h4>Avens</h4>						
				<div class="social-links">
					<ul class="list-inline footer-social">
						<li>
							<a target="_blank" href="https://www.facebook.com/www.avensonline.org?fref=ts">
								<img src="http://www.avensonline.org/wp-content/themes/twentythirteen/images/fb-icon.png" alt="Facebook">
							</a>
						</li>
						<li>
							<a target="_blank" href="https://twitter.com/avensonline">
								<img src="http://www.avensonline.org/wp-content/themes/twentythirteen/images/tweet.png" alt="Twitter">
							</a>
						</li>
						<li>
							<a target="_blank" href="https://www.linkedin.com/pub/avens-publishers/58/a2b/479">
								<img src="http://www.avensonline.org/wp-content/themes/twentythirteen/images/linked.png" alt="Linked In">
							</a>
						</li>
						<li>
							<a target="_blank" href="http://feeds.feedburner.com/Avens">
								<img src="http://www.avensonline.org/wp-content/themes/twentythirteen/images/rssfeed.png" alt="Rss Feed">
							</a>
						</li>
						<li>
							<a target="_blank" href="http://avensonline.org/blog">
								<img src="http://www.avensonline.org/wp-content/themes/twentythirteen/images/blog-icon.png" alt="Avens Blog">
							</a>
						</li>


					</ul>
				</div>													
			</div>
		</div>
	</div>
	<div id="footer-bottom">
		<div class="col-sm-12">
			<div class="container">
				<p><a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png"></a><br>This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.</p>
			</div>
		</div>
	</div>
</footer>
<script type='text/javascript' src='<?php echo base_url(); ?>public/js/swfobject.js'></script>
<script type='text/javascript' src='<?php echo base_url(); ?>public/js/jquery.js'></script>
<script type='text/javascript' src='<?php echo base_url(); ?>public/js/jquery-migrate.min.js'></script>
<script type="text/javascript" src="<?php echo base_url(); ?>public/js/bootstrap.min.js"></script>
<script src="<?php echo base_url(); ?>public/js/jquery.bootpag.min.js"></script>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-35984191-1']);
	_gaq.push(['_trackPageview']);
	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery("p.month").on('click', function () {
			if(jQuery(this).hasClass("active")){
				jQuery(this).removeClass("active");
			}else{
				jQuery('.month').removeClass("active");
				jQuery(this).toggleClass("active");
			}

			jQuery(".post-archive-box-inner").not(jQuery(this).next(".post-archive-box-inner")).slideUp();
			jQuery(this).next(".post-archive-box-inner").slideToggle();
		});

jQuery("#latest-article-results").load("http://www.avensonline.org/latest-article-ajax/");  //initial page number to load
jQuery(".pagination").bootpag({
	total: 16,
	page: 1,
	maxVisible: 5,
	leaps: false,
	next: 'Next'       
}).on("page", function(e, num){
	e.preventDefault();
	jQuery("#latest-article-results").prepend('<div class="loading-indication">Loading...</div>');		
	jQuery("#latest-article-results").load("http://www.avensonline.org/latest-article-ajax/", {'page':num});
});

jQuery('.nav-controls .custom-prev').on('click',function(e){
	e.preventDefault();
	jQuery('ul.pagination .prev a').trigger('click');
});
jQuery('.nav-controls .custom-next').on('click',function(e){
	e.preventDefault();
	jQuery('ul.pagination .next a').trigger('click');
});

var logo_box_height = jQuery('#logo-box').height();
//var wp_admin_nav = jQuery('#wpadminbar').height();
var admin_bar_height = (jQuery('#wpadminbar').height())?jQuery('#wpadminbar').height():'0';
var temp_height = admin_bar_height+logo_box_height;

jQuery(window).scroll(function(){
	if (jQuery(this).scrollTop() > temp_height)
		jQuery('#navbar').addClass('fixed_top').css('top',admin_bar_height);		
	else 
		jQuery('#navbar').removeClass('fixed_top').css('top','0');			
});	
jQuery('.goto-top').hide();

jQuery(window).scroll(function(){
	if (jQuery(this).scrollTop() > 200)
		jQuery('.goto-top').show(300);		
	else 
		jQuery('.goto-top').hide(300);	

});	

jQuery('.scroll-top').on('click',function(e){
	e.preventDefault();
	jQuery("html,body").animate({scrollTop:0}, 600);
});
jQuery('#mobile-post-navbtn').on('click',function(e){
	e.stopPropagation();
	jQuery('.mobile-post-nav').toggle(500);
});
jQuery('body').on('click',function(e){
	e.stopPropagation();
	jQuery('.mobile-post-nav').hide(500);
});

});
</script>
</body>
</html>