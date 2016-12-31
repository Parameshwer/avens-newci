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

								/*foreach ($static_page as $key => $value) {
									echo '<li><a class="" href="'.base_url().''.strtolower($this->uri->segment(1)).'/'.$this->uri->segment(2).'/'.$value.'/">'.$key.'</a></li>';
								}*/
								foreach ($links_info as $key => $value) {									
									echo '<li><a class="" href="'.base_url().''.strtolower($value['category_name']).'/'.$value['journal_slug'].'/'.$value['post_slug'].'/">'.$value['post_name'].'</a></li>';	
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
					if(strpos($this->uri->segment(3), 'current-issue') !== false) {
						echo '<h1>Current Issue</h1>';
					}else if(strpos($this->uri->segment(3), 'articles-in-press') !== false) {
						echo '<h1>Article In Press</h1>';	
					}
					else if(strpos($this->uri->segment(3), 'archive') !== false) {
						echo '<h1>Archive</h1>';	
					}else if(strpos($this->uri->segment(3), 'special-issues') !== false) {
						echo '<h1>Special Issues</h1>';	
					}
					?>

					<?php 

					if($this->uri->segment(3) == 'archive') {

						$year_arr = array();
						foreach ($archive_info as $key => $value) {						
							array_push($year_arr, $value['archive_year']);							
						}


						$temp_arr = array();
						foreach ($archive_info as $key => $value) {
							$temp_arr[$value['archive_year']][$value['archive_volume']][] = $value;
						}
						$f_flag = true;
						echo '<ul id="myTabs" class="nav nav-tabs" role="tablist">';
						foreach ($temp_arr as $key => $value) {
							//print_r($key);
							//echo $key;
							if($f_flag) {
								echo '<li class="active"><a href="#'.$key.'" id="'.$key.'-tab" role="tab" data-toggle="tab" aria-controls="'.$key.'" aria-expanded="false">'.$key.'</a></li>';
							} else {
								echo '<li><a href="#'.$key.'" id="'.$key.'-tab" role="tab" data-toggle="tab" aria-controls="'.$key.'" aria-expanded="false">'.$key.'</a></li>';
							}
							$f_flag = false;							
						}
						echo '</ul>';
						$s_flag = true;
						echo '<div id="myTabContent" class="tab-content">';
						foreach ($temp_arr as $key => $value) {							
							/*foreach ($value as $k => $v) {
								echo '<div class="post-archive-box"><p class="month"><strong>'.$k.'</strong></p>';
							}*/
							
							if($s_flag) {
								echo '<div class="tab-pane fade active in" id="'.$key.'" aria-labelledby="'.$key.'-tab">';		
							} else {
								echo '<div class="tab-pane fade active " id="'.$key.'" aria-labelledby="'.$key.'-tab">';		
							}
							//echo '</div>';
							foreach ($value as $k => $v) {
								echo '<div class="post-archive-box"><p class="month"><strong>'.$k.'</strong></p>';
								echo '<div class="post-archive-box-inner" style="display:none">';
								foreach ($v as $a => $b) {
									echo '<div class="archive-info">';
									//if($v == $value['archive_year']) {
									echo $b['archive_desc'];
									echo '<div class="btn-wrapper">
<p><a href="'.$b['archive_fulltext'].'" target="_blank" class="icon-fulltext">Full Text</a><a href="'.$b['archive_pdf'].'" target="_blank" class="icon-pdf">PDF</a></p></div>';
								//}
									echo '</div>';
								}
								echo '</div></div>';
							}
							echo '</div>';
							$s_flag = false;
						}
						echo '</div>';
					}
					 else {
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