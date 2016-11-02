<?php

class App_model extends CI_Model {

    /**
    * Validate the login's data with the database
    * @param string $user_name
    * @param string $password
    * @return void
    */    
	function get_journals($sort_type) {
			if($sort_type == 'category-wise' || $sort_type == 'atoz' || $sort_type == 'atozincat') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'medical') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' AND wp_journal_main_categories.category_name = 'Medical' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'biotechnology') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' AND wp_journal_main_categories.category_name = 'Biotechnology' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'biology') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' AND wp_journal_main_categories.category_name = 'Biology' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'pharmaceutical') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' AND wp_journal_main_categories.category_name = 'Pharmaceutical' ORDER BY wp_journals.journal_name ASC");
		}		
		return $query->result_array();
	}
	function get_journal_post($cat_name,$journal_name,$post_name) {
		$query = $this->db->query('SELECT * FROM wp_journal_posts jp INNER JOIN wp_journals j on jp.journal_id = j.id INNER JOIN wp_journal_main_categories mc on mc.category_id = j.main_category_id WHERE jp.post_slug = "'.$post_name.'" AND mc.category_name = "'.$cat_name.'" AND j.journal_url_slug = "'.$journal_name.'"');
		return $query->result_array();
	}
	function get_archive_info($cat_name,$journal_name,$post_name) {
		if($post_name == 'article-in-press') {
			$archive_type = '1';			
			$query  = $this->db->query('SELECT * FROM wp_journal_archives jp JOIN wp_journals j on jp.journal_id = j.id INNER JOIN wp_journal_main_categories mc on mc.category_id = j.main_category_id WHERE jp.archive_in = "'.$archive_type.'" AND mc.category_name = "'.$cat_name.'" AND j.journal_url_slug = "'.$journal_name.'"');
		} else if($post_name == 'current-issue') {
			$archive_type = '2';			
			$query  = $this->db->query('SELECT * FROM wp_journal_archives jp JOIN wp_journals j on jp.journal_id = j.id INNER JOIN wp_journal_main_categories mc on mc.category_id = j.main_category_id WHERE jp.archive_in = "'.$archive_type.'" AND mc.category_name = "'.$cat_name.'" AND j.journal_url_slug = "'.$journal_name.'"');
		} else if($post_name == 'archive') {			
			$archive_type = '3';			
			$query  = $this->db->query('SELECT * FROM wp_journal_archives jp JOIN wp_journals j on jp.journal_id = j.id INNER JOIN wp_journal_main_categories mc on mc.category_id = j.main_category_id WHERE jp.archive_in = "'.$archive_type.'" AND mc.category_name = "'.$cat_name.'" AND j.journal_url_slug = "'.$journal_name.'"');
		}
		
		return $query->result_array();
	}
	function get_sidebar_links($cat_name,$journal_name,$post_name) {
		if($post_name == 'article-in-press') {
			$archive_type = '1';
		} else if($post_name == 'current-issue') {
			$archive_type = '2';
		} else if($post_name == 'archive') {
			$archive_type = '3';
		}
		if($archive_type == '3') {
			$query = $this->db->query('SELECT * FROM wp_journal_archives jp INNER JOIN wp_journals j on jp.journal_id = j.id INNER JOIN wp_journal_main_categories mc on mc.category_id = j.main_category_id WHERE mc.category_name = "'.$cat_name.'" AND j.journal_url_slug = "'.$journal_name.'"');
		} else {
			$query  = $this->db->query('SELECT * FROM wp_journal_archives jp INNER JOIN wp_journals j on jp.journal_id = j.id INNER JOIN wp_journal_main_categories mc on mc.category_id = j.main_category_id WHERE mc.category_name = "'.$cat_name.'" AND j.journal_url_slug = "'.$journal_name.'"');
		}
		
		return $query->result_array();
	}
	
}

