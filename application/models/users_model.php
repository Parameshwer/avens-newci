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
	function get_journals_posts() {
		$query = $this->db->query('SELECT * FROM wp_journal_posts WHERE deleted="1"');	
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
		$query = $this->db->query("UPDATE wp_journal_main_categories SET category_name='.$name.' WHERE category_id='.$id.'");
		} else {
		   $query = $this->db->query("SELECT * FROM wp_journal_main_categories WHERE category_id=$cat_id");
		}
		return $query;
		//return $query->result_array();
	}
	
}

