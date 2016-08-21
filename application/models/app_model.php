<?php

class App_model extends CI_Model {

    /**
    * Validate the login's data with the database
    * @param string $user_name
    * @param string $password
    * @return void
    */    
	function get_journals($sort_type) {		
		if($sort_type == 'category-wise') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'atoz') {
			$query = $this->db->query("SELECT * FROM wp_journals WHERE deleted='1'");
		} else if($sort_type == 'atozincat') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'medical') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' AND wp_journal_main_categories.category_name = 'Medical' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'biotechnology'){
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' AND wp_journal_main_categories.category_name = 'Biotechnology' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'biology') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' AND wp_journal_main_categories.category_name = 'Biology' ORDER BY wp_journals.journal_name ASC");
		} else if($sort_type == 'pharmaceutical') {
			$query = $this->db->query("SELECT * FROM wp_journals INNER JOIN wp_journal_main_categories ON wp_journals.main_category_id = wp_journal_main_categories.category_id WHERE wp_journals.deleted ='1' AND wp_journal_main_categories.category_name = 'Pharmaseutical' ORDER BY wp_journals.journal_name ASC");
		}		
		return $query->result_array();
	}	
}

