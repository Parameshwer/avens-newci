<?php include('static_values.php'); ?>
<div id="main" class="site-main">	<div id="primary" class="content-area">
	<div id="content" class="site-content" role="main">


		<style type="text/css">
			.journal-name h1{
				text-align: center;
				text-shadow: 0px 0px 9px rgba(0, 0, 0, 1);
				font-size: 2em;
				color: #ffffff;
			}
			.issn-num{background-color: #fe6d01;padding: 8px;color: #ffffff;border-top:1px solid #ffffff;font-size: 1.1em;text-align: right;}	
			.issn-num p{margin: 0;}
			.site-header{background: none;height: auto;}
			.site-header .home-link{display: none;}
			.journal-info-box{position: relative;color: #ffffff;}
			.journal-info-box h1.entry-title{  position: absolute;top: 0;font-size: 2em;padding: 20px;text-shadow: 0 0 6px #222;}
			.journal-info-box .issn-number{font-size: 0.5em;overflow: hidden;top: 10px;position: relative;}
			.affix{position: fixed;top: 0;}
		</style>

		<style type="text/css">
			.journal-name{background: url("http://www.avensonline.org/wp-content/uploads/2015/05/glycemic_banner.jpg") no-repeat scroll center top / 1600px auto;text-align: center;padding: 90px;position:relative;
			background-repeat:no-repeat;
			-webkit-background-size:cover;
			-moz-background-size:cover;
			-o-background-size:cover;
			background-size:cover;
			background-position:center;
		}
	}
</style>

<div class="journal-name">		
	<div class="container">
		<h1 class="entry-title"><?php echo $post_info[0]['journal_name']; ?></h1>									
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-4">
			<!-- <div class=" affix-top" data-spy="affix" data-offset-top="300" > -->
			<div class="mobile-category-nav visible-xs">
				<a href="#" id="mobile-post-navbtn">Menu</a>
				<ul class="mobile-post-nav">
					<?php
						foreach ($static_page as $key => $value) {
							echo '<li><a class="" href="">'.$key.'</a></li>';
						}
					?>
				</ul>
			</div>
			<div>
				<div id="journal-sidebar-wrapper">


					<div id="journal-sidebar">
						<div id="nav-post">
							<ul class="post-nav">
							<?php
							
								foreach ($static_page as $key => $value) {
									echo '<li><a class="" href="'.base_url().''.strtolower($post_info[0]['category_name']).'/'.$post_info[0]['journal_url_slug'].'/'.$value.'/">'.$key.'</a></li>';
								}
							 ?>
							</ul>
						</div>
					</div>
				</div>
				<div class="journal-info-box">


					<img src="http://www.avensonline.org/wp-content/uploads/2015/05/glycemic_sidenav.jpg" class="img-responsive">
					<h1 class="entry-title"><?php echo $post_info[0]['journal_name']; ?></h1>
				</div>
			</div>
		</div>		
		<div class="col-sm-8">		
			<div class="post-text-box">				
				<div id="post-content">

					<h1>Archive</h1>  <span class="rss-button ddddd"><a target="_blank" href="http://www.avensonline.org/diabetes-endocrinology/archive-11/feed/?withoutcomments=1">Rss Feed&nbsp;<img src="http://www.avensonline.org/wp-content/themes/twentythirteen/images/rss.png" alt="Rss Feed"></a></span>
				</div>  	
			</div>
		</div>
	</div>
<!--
</div>
</div>
</div>
</div>


</div><!-- #content -->
</div><!-- #primary -->


</div><!-- #main -->