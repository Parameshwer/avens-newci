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
		<h1 class="entry-title"><?php echo $get_sidebar_links[0]['journal_name']; ?></h1>									
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
									echo '<li><a class="" href="'.base_url().''.strtolower($this->uri->segment(1)).'/'.$this->uri->segment(2).'/'.$value.'/">'.$key.'</a></li>';
								}
								?>
							</ul>
						</div>
					</div>
				</div>
				<div class="journal-info-box">

					<?php if(isset($archive_info) && !empty($archive_info)){ ?>
					<img src="http://www.avensonline.org/wp-content/uploads/2015/05/glycemic_sidenav.jpg" class="img-responsive">
					<h1 class="entry-title"><?php echo $archive_info[0]['journal_name']; ?></h1>
					<?php } ?>
				</div>
			</div>
		</div>		
		<div class="col-sm-8">		
			<div class="post-text-box">				
				<div id="post-content">
					<?php
					if($this->uri->segment(3) == 'current-issue') {
						echo '<h1>Current Issue</h1>';
					}else if($this->uri->segment(3) == 'article-in-press'){
						echo '<h1>Article In Press</h1>';	
					}
					else if($this->uri->segment(3) == 'archive'){
						echo '<h1>Archive</h1>';	
					}
					?>

					<?php 

					if($this->uri->segment(3) == 'archive') {
//print_r($archive_info);exit;
						$year_arr = array();
						$volume_arr = array();
						foreach ($archive_info as $key => $value) {						
							array_push($year_arr, $value['archive_year']);
							array_push($volume_arr, $value['archive_volume']);
						}


						echo '<ul id="myTabs" class="nav nav-tabs" role="tablist">';
						$f_flag = true;
						foreach (array_unique($year_arr) as $key => $value) {
							if($f_flag) {
								echo '<li class="dddddd active"><a href="#'.$value.'" id="'.$value.'-tab" role="tab" data-toggle="tab" aria-controls="'.$value.'" aria-expanded="false">'.$value.'</a></li>';
							} else {
								echo '<li><a href="#'.$value.'" id="'.$value.'-tab" role="tab" data-toggle="tab" aria-controls="'.$value.'" aria-expanded="false">'.$value.'</a></li>';
							}
							$f_flag = false;
						}								
						echo '</ul>';
						$s_flag = true;
						echo '<div id="myTabContent" class="tab-content">';
						foreach (array_unique($year_arr) as $k => $v) {
							if($s_flag) {
								echo '<div class="tab-pane fade active in" id="'.$v.'" aria-labelledby="'.$v.'-tab">';		
							} else {
								echo '<div class="tab-pane fade active " id="'.$v.'" aria-labelledby="'.$v.'-tab">';		
							}
							echo '<div class="post-archive-box"><p class="month"><strong>volume 1 issue 1</strong></p>';
							echo '<div class="post-archive-box-inner">';
							foreach ($archive_info as $key => $value) {									
								if($v == $value['archive_year']) {
									echo $value['archive_desc'];
									echo '<div class="btn-wrapper">
<p><a href="'.$value['archive_fulltext'].'" target="_blank" class="icon-fulltext">Full Text</a><a href="'.$value['archive_pdf'].'" target="_blank" class="icon-pdf">PDF</a></p></div>';
								}
							}
							echo '</div>';
							echo '</div></div>';
							$s_flag = false;
						};

						echo '</div>';
					} else {
						$i = 0;
						foreach ($archive_info as $key => $value) {
							if($i == '0') {
								echo '<p><b>'.$value['archive_volume'].'</b></p>';								
							}
							echo '<div class="archive-box"><div>'.$value['archive_desc'].'</div>';
							if(!empty($value['archive_fulltext']) && !empty($value['archive_pdf'])) {
								echo '<div class="btn-wrapper">
								<p><a href="'.$value['archive_fulltext'].'" target="_blank" class="icon-fulltext">Full Text</a><a href="'.$value['archive_pdf'].'" target="_blank" class="icon-pdf"> PDF</a></p></div>';
							}
							echo '</div>';
							$i++;
						}					

					}

					?>
				</div>  	
			</div>
		</div>
	</div>
</div><!-- #primary -->


</div><!-- #main -->