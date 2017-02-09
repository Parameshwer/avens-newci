<?php

class Users_model extends CI_Model {

    /**
    * Validate the login's data with the database
    * @param string $user_name
    * @param string $password
    * @return void
    */
	function validate($user_name, $password)
	{	
		
		$this->db->where('user_name', $user_name);
		$this->db->where('pass_word', $password);
		$query = $this->db->get('membership');
		//print_r($query->result_id->num_rows);exit();
		if($query->result_id->num_rows == 1)
		{
			return true;
		}		
	}

    /**
    * Serialize the session data stored in the database, 
    * store it in a new array and return it to the controller 
    * @return array
    */
	function get_db_session_data()
	{
		$query = $this->db->select('user_data')->get('ci_sessions');
		$user = array(); /* array to store the user data we fetch */
		foreach ($query->result() as $row)
		{
		    $udata = unserialize($row->user_data);
		    /* put data in array using username as key */
		
		    $user['user_name'] = $udata['user_name']; 
		    $user['is_logged_in'] = $udata['is_logged_in']; 
		}
		return $user;
	}
	
    /**
    * Store the new user's data into the database
    * @return boolean - check the insert
    */	
	function create_member()
	{

		$this->db->where('user_name', $this->input->post('username'));
		$query = $this->db->get('membership');

        if($query->num_rows > 0){
        	echo '<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a><strong>';
			  echo "Username already taken";	
			echo '</strong></div>';
		}else{

			$new_member_insert_data = array(
				'first_name' => $this->input->post('first_name'),
				'last_name' => $this->input->post('last_name'),
				'email_addres' => $this->input->post('email_address'),			
				'user_name' => $this->input->post('username'),
				'pass_word' => md5($this->input->post('password'))						
			);
			$insert = $this->db->insert('membership', $new_member_insert_data);
		    return $insert;
		}
	      
	}//create_member
	function get_count() {
		$query = $this->db->query('SELECT count(DISTINCT wp_journals.journal_name) as journal_count, count(DISTINCT wp_journal_main_categories.category_name) as category_count FROM wp_journals INNER JOIN wp_journal_main_categories on wp_journals.main_category_id = wp_journal_main_categories.category_id ORDER BY wp_journals.journal_name');				
		return $query->result_array();
	}
	function get_categories() {
		$query = $this->db->query('SELECT * FROM `wp_journal_main_categories` WHERE deleted = "1"');				
		return $query->result_array();
	}
	function get_journals() {
		$query = $this->db->query('SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id');				
		return $query->result_array();
	}
	function get_LatestArticles() {
		$query = $this->db->query('SELECT wp_latest_articles.id,wp_latest_articles.article_image,wp_latest_articles.article_name,wp_latest_articles.created_date,wp_latest_articles.author_name,wp_latest_articles.pdf_link,wp_journals.journal_name FROM wp_latest_articles INNER JOIN wp_journals ON wp_journals.id = wp_latest_articles.article_category WHERE wp_latest_articles.deleted = "1"');				
		return $query->result_array();	
	}
	function get_SubmitManuscript() {
		$query = $this->db->query('SELECT * FROM wp_manuscript');				
		return $query->result_array();	
	}
	function get_journals_posts() {
		//$query = $this->db->query('SELECT * FROM wp_journal_posts WHERE deleted="1" ORDER BY updated_date DESC');	
		//$query = $this->db->query('SELECT * FROM wp_journal_posts WHERE deleted="1"');	

		$query = $this->db->query('SELECT jp.id, jp.post_name, j.journal_name, mc.category_name,jp.created_date, jp.updated_date FROM wp_journal_posts jp INNER JOIN wp_journals j on jp.journal_id = j.id INNER JOIN wp_journal_main_categories mc on mc.category_id = j.main_category_id WHERE jp.deleted="1"');
		//print_r($query);				
		return $query->result_array();
	}
	function get_journals_archives() {
		$query = $this->db->query('SELECT a.id, a.archive_doi,a.archive_year,a.archive_volume, a.archive_fulltext,a.archive_pdf,a.archive_in, a.created_date,b.journal_name, c.category_name FROM wp_journal_archives a, wp_journals b, wp_journal_main_categories c WHERE a.journal_id = b.id AND b.main_category_id = c.category_id AND a.deleted = 1');	
		//print_r($query);				
		return $query->result_array();
	}
	function get_journal_archive($archive_id) {
		$query = $this->db->query('SELECT * FROM  wp_journal_archives WHERE id = "'.$archive_id.'" AND deleted = 1');	
		//print_r($query);				
		return $query->result_array();
	}
	function get_latest_Article($article_id) {
		
		$query = $this->db->query('SELECT * FROM  wp_latest_articles WHERE id = "'.$article_id.'" AND deleted = 1');	
		//print_r($query);				
		return $query->result_array();
	}

	function get_main_category($cat_id) {		
		//echo "SELECT * FROM wp_journal_main_categories WHERE category_id=".$cat_id."";exit;
		$query = $this->db->query("SELECT * FROM wp_journal_main_categories WHERE category_id=$cat_id");
		return $query->result_array();
	}
	function insert_main_category($id,$name) {		
		if($id) {
		$query = $this->db->query("UPDATE wp_journal_main_categories SET category_name='".$name."', updated_date ='".date('Y-m-d')."' WHERE category_id=$id");
		} else {
		   $query = $this->db->query("INSERT INTO wp_journal_main_categories (category_name, created_date, updated_date, deleted) VALUES ('".$name."','".date('Y-m-d')."','".date('Y-m-d')."','1')");
		}
		return $query;
		//return $query->result_array();
	}
	function get_jounal($journal_id) {		
		$query = $this->db->query("SELECT * FROM wp_journals WHERE id=$journal_id");
		return $query->result_array();
	}
	function get_journalPage($page_id) {		
		$query = $this->db->query("SELECT * FROM wp_journal_posts WHERE id=$page_id");
		return $query->result_array();
	}
	function insert_journal($data) {
				
		if($data->id) {
		$query = $this->db->query("UPDATE wp_journals SET journal_url_slug='".$data->journal_url_slug."',journal_name='".$data->journal_name."', updated_date ='".date('Y-m-d')."',issn_number ='".$data->issn_number."',journal_meta_keywords ='".$data->journal_meta_keywords."',journal_ic_value ='".$data->journal_ic_value."',main_category_id ='".$data->main_category_id."',journal_description ='".$data->journal_description."', banner_image ='".$data->banner_image."',sidebar_image ='".$data->sidebar_image."' WHERE id=$data->id");
		} else {
		   $query = $this->db->query("INSERT INTO wp_journals (journal_url_slug,journal_name, created_date, updated_date, issn_number,journal_meta_keywords,journal_ic_value,main_category_id,journal_description,deleted, banner_image, sidebar_image) VALUES ('".$data->journal_url_slug."','".$data->journal_name."','".date('Y-m-d')."','".date('Y-m-d')."','".$data->issn_number."','".$data->journal_meta_keywords."','".$data->journal_ic_value."','".$data->main_category_id."','".$data->journal_description."','1',banner_image ='".$data->banner_image."',sidebar_image ='".$data->sidebar_image."')");
		}
		return $query;
		//return $query->result_array();
	}
	function get_journals_and_categories() {
		$query = $this->db->query("SELECT wp_journals.journal_name,wp_journals.id, wp_journal_main_categories.category_id, wp_journal_main_categories.category_name FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id=wp_journal_main_categories.category_id GROUP BY wp_journals.journal_name");
		return $query->result_array();
	}
	function update_journal_page($data) {			
		if(isset($data->id) && !empty($data->id)) {
			
		$query = $this->db->query("UPDATE wp_journal_posts SET post_name='".$data->post_name."', updated_date ='".date('Y-m-d')."',category_id ='".$data->category_id."',post_slug ='".$data->post_slug."',journal_slug ='".$data->journal_slug."',post_content ='".$data->post_content."',journal_id ='".$data->journal_id."' WHERE id=$data->id");
		} else {
		   $query = $this->db->query("INSERT INTO wp_journal_posts (post_name, created_date, updated_date, category_id,post_slug,post_content,journal_id,deleted) VALUES ('".$data->post_name."','".date('Y-m-d')."','".date('Y-m-d')."','".$data->category_id."','".$data->post_slug."','".$data->post_content."','$data->journal_id','1')");
		}
		return $query;
		//return $query->result_array();
	}
	function update_archive($data) {		
		if(isset($data->id) && !empty($data->id)) {
			
		$query = $this->db->query("UPDATE wp_journal_archives SET journal_id='".$data->journal_id."',category_id='".$data->category_id."',archive_desc='".$data->archive_desc."', archive_doi='".$data->archive_doi."',archive_year='".$data->archive_year."',archive_volume='".$data->archive_volume."',archive_fulltext='".$data->archive_fulltext."',archive_pdf='".$data->archive_pdf."',journal_slug='".$data->journal_slug."',updated_date='".date('Y-m-d')."',archive_in='".$data->archive_in."' WHERE id=$data->id");
		} else {
		   $query = $this->db->query("INSERT INTO wp_journal_archives (journal_id, category_id, archive_desc,archive_doi, archive_year, archive_volume, archive_fulltext, archive_pdf, archive_in, journal_slug,created_date, updated_date, deleted) VALUES ('".$data->journal_id."','".$data->category_id."','".$data->archive_desc."','".$data->archive_doi."','".$data->archive_year."','".$data->archive_volume."','".$data->archive_fulltext."','".$data->archive_pdf."','".$data->archive_in."','".$data->journal_slug."','".date('Y-m-d')."','".date('Y-m-d')."','1')");
		}
		return $query;
		//return $query->result_array();
	}
	function update_latest_article($data) {
	//print_r($data);exit;		
		if(isset($data->id) && !empty($data->id)) {
			
		$query = $this->db->query("UPDATE wp_latest_articles SET article_name='".$data->article_name."', pdf_link='".$data->pdf_link."',article_category='".$data->article_category."', article_image='".$data->article_image."',author_name	='".$data->author_name	."',updated_date='".date('Y-m-d')."' WHERE id=$data->id");
		} else {
		   $query = $this->db->query("INSERT INTO wp_latest_articles (article_name, pdf_link, article_category,article_image, author_name, updated_date, created_date, deleted) VALUES ('".$data->article_name."','".$data->pdf_link."','".$data->article_category."','".$data->article_image."','".$data->author_name."','".date('Y-m-d')."','".date('Y-m-d')."','1')");
		}
		return $query;
		//return $query->result_array();
	}	
}

