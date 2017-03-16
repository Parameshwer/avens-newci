<footer id="colophon" class="site-footer" role="contentinfo">

	<!-- .site-info -->
	<div class="container">
		<div class="row" id="footer-top">
			<div class="col-sm-4 col-md-3">
				<h4>Company</h4>
				<ul>
					<li><a href="<?php echo base_url(); ?>about-us">About Us</a></li>
					<li><a href="<?php echo base_url(); ?>policies">Policies</a></li>
					<li><a href="<?php echo base_url(); ?>membership">Membership</a></li>
				</ul>
			</div>
			<div class="col-sm-4 col-md-3">
				<h4>Journals</h4>
				<ul>
					<li><a href="<?php echo base_url(); ?>journals/?sort_type=medical">Medical</a></li>
					<li><a href="<?php echo base_url(); ?>journals/?sort_type=biology">Biology</a></li>
					<li><a href="<?php echo base_url(); ?>journals/?sort_type=pharmaceutical">Pharmacy</a></li>				
					<li><a href="<?php echo base_url(); ?>journals/?sort_type=biotechnology">Biotechnology</a></li>				
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
								<img src="<?php echo base_url(); ?>public/images/fb-icon.png" alt="Facebook">
							</a>
						</li>
						<li>
							<a target="_blank" href="https://twitter.com/avensonline">
								<img src="<?php echo base_url(); ?>public/images/tweet.png" alt="Twitter">
							</a>
						</li>
						<li>
							<a target="_blank" href="https://www.linkedin.com/pub/avens-publishers/58/a2b/479">
								<img src="<?php echo base_url(); ?>public/images/linked.png" alt="Linked In">
							</a>
						</li>
						<li>
							<a target="_blank" href="http://feeds.feedburner.com/Avens">
								<img src="<?php echo base_url(); ?>public/images/rssfeed.png" alt="Rss Feed">
							</a>
						</li>
						<li>
							<a target="_blank" href="http://avensonline.org/blog">
								<img src="<?php echo base_url(); ?>public/images/blog-icon.png" alt="Avens Blog">
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
<!-- <script type='text/javascript' src='<?php echo base_url(); ?>public/js/swfobject.js'></script>
<script type='text/javascript' src='<?php echo base_url(); ?>public/js/jquery.js'></script>
<script type='text/javascript' src='<?php echo base_url(); ?>public/js/jquery-migrate.min.js'></script>
<script type="text/javascript" src="<?php echo base_url(); ?>public/js/bootstrap.min1.js"></script>
 -->

<!-- <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
<script type="text/javascript" src="<?php echo base_url(); ?>public/js/jquery.validator.js"></script>
<script src="<?php echo base_url(); ?>public/js/jquery.bootpag.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#form_collab").validate({
			rules: {
				institute_name: "required",
				email: {
					required: true,
					email: true
				},
				mailing_address: "required",
				country:"required",
				website_rrl:"required"
			},
			messages: {
				institute_name: "Please enter your Institute Name",
				email: "Please enter a valid email address",
				mailing_address: "Please enter your mailing address",
				country: "Please enter your country",
				website_rrl: "Please enter your website url"

			},
			success: function(){
				$(this).click(false);
				$(this).attr("readonly", true);
			}
		});
		$(".contact-form").validate({
			rules: {
				first_name: "required",
				email_id: {
					required: true,
					email: true
				}
			},
			messages: {
				first_name: "Please enter your firstname",
				email_id: "Please enter a valid email address"

			},
			success: function(){
				$(this).click(false);
				$(this).attr("readonly", true);
			}
		});

		$("#manuscript_form").validate({
			rules: {
				firstname: "required",
				email: {
					required: true,
					email: true
				},
				phoneno:{
					number: true,
					required: true,
				},
			},
			messages: {
				first_name: "Please enter your Firstname",
				email_id: "Please enter a valid Email Address",
				phoneno: "Please enter a valid Phone Number"

			},
			success: function(){
				$(this).click(false);
				$(this).attr("readonly", true);				
			},
			onsubmit: function() {

			}
		});
		$("#manuscript_form").find('.btn-success').click(function(e){
			e.preventDefault();
					
		    //var data = new FormData($('#manuscript_form')[0]);
			jQuery.ajax({
			   type:"POST",
			   url:"http://localhost/avens-angular/page/save_submit_manuscript/",
			   data:$('#manuscript_form').serialize(),
			   mimeType: "multipart/form-data",
			   contentType: false,
			   cache: false,
			   processData: false,
			   success:function(data)
				{
					console.log(data);
				}
			});

		});
		
 
		$('.sort_journals').on('click',function(){
			$('.sort_journals').attr('checked',false);
			$(this).attr('checked',true);
			var sort_type = $(this).val();
			$('#journal-ajax').html('<div class="text-center" style="padding:10px;margin-top:20px;"><strong>Loading..</strong></div>');
			jQuery.get("<?php echo base_url(); ?>page/get_journals",
			{
				sort_type: sort_type			        
			},
			function(data, status){				
				$('#journal-ajax').html(data);					    			      
			});
		});

		$('#myTabs a').click(function (e) {
			e.preventDefault()
			$(this).tab('show')
		});


		$("p.month").on('click', function () {
			if($(this).hasClass("active")){
				$(this).removeClass("active");
			}else{
				$('.month').removeClass("active");
				$(this).toggleClass("active");
			}

			$(".post-archive-box-inner").not($(this).next(".post-archive-box-inner")).slideUp();
			$(this).next(".post-archive-box-inner").slideToggle();
		});

		$("#latest-article-results").load("<?php echo base_url(); ?>page/get_latest_journals/"); 
		$(".pagination").bootpag({
			total: 16,
			page: 1,
			maxVisible: 5,
			leaps: false,
			next: 'Next'       
		}).on("page", function(e, num){
			e.preventDefault();
			$("#latest-article-results").prepend('<div class="loading-indication">Loading...</div>');		
			$("#latest-article-results").load("<?php echo base_url(); ?>page/get_latest_journals/", {'page':num});
		});

		$('.nav-controls .custom-prev').on('click',function(e){
			e.preventDefault();
			$('ul.pagination .prev a').trigger('click');
		});
		$('.nav-controls .custom-next').on('click',function(e){
			e.preventDefault();
			$('ul.pagination .next a').trigger('click');
		});

		var logo_box_height = $('#logo-box').height();

		var admin_bar_height = ($('#wpadminbar').height())?$('#wpadminbar').height():'0';
		var temp_height = admin_bar_height+logo_box_height;

		$(window).scroll(function(){
			if ($(this).scrollTop() > temp_height)
				$('#navbar').addClass('fixed_top').css('top',admin_bar_height);		
			else 
				$('#navbar').removeClass('fixed_top').css('top','0');			
		});	
		$('.goto-top').hide();

		$(window).scroll(function(){
			if ($(this).scrollTop() > 200)
				$('.goto-top').show(300);		
			else 
				$('.goto-top').hide(300);	

		});	

		$('.scroll-top').on('click',function(e){
			e.preventDefault();
			$("html,body").animate({scrollTop:0}, 600);
		});
		$('#mobile-post-navbtn').on('click',function(e){
			e.stopPropagation();
			$('.mobile-post-nav').toggle(500);
		});
		/*$('body').on('click',function(e){
			e.stopPropagation();
			$('.mobile-post-nav').hide(500);
		});*/
		$('span.add-file').on('click',function(){
			$('.upload-box').append('<div class="upload-inner"><input type="file" name="uploadfile[]" value="Choose Files" size="25" class="input-file"><span class="remove-file">Remove File</span></div>');
			checking_add_filebtn();
		});
		$('.upload-box').on('click','span.remove-file',function(){

			checking_add_filebtn();
			$(this).closest('.upload-inner').remove();
		});

		function checking_add_filebtn(){
			if ($('.upload-inner .input-file').length >= 2){
				$('.add-file').hide();
			}
			else{
				$('.add-file').show();
			}

		}		
		
		$("input[type=file]").on('change',function(){
	      var file_id =$(this).attr('id');
	      var rel_id = $(this).attr('rel');                       ;
	      var data = new FormData($('#manuscript_form')[0]);     
	      jQuery.ajax({
	         type:"POST",
	         url:"<?php echo base_url('page/upload_files');?>",
	         data:data,
	         mimeType: "multipart/form-data",
	          contentType: false,
	          cache: false,
	          processData: false,
	          dataType:"json",
	         success:function(temp)
	        {         
	          $('.temp_file_upload').remove();
	          jQuery.each(temp, function(i,v){
	            console.log(v.upload_data.file_name);
	            //console.log(v[i].file_name);
	            $('#manuscript_form').find('.upload-box').append('<input class="temp_file_upload" id="'+file_id+'_uploaded" type="hidden" name="uploaded_img[]" value="'+v.upload_data.file_name+'">');
	          })
	         }
	      });     
	    });
	   	
	});

</script>

</body>
</html>