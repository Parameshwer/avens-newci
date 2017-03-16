<?php

class Feed_model extends CI_Model {
    function get_archive_info()
    {
        $query  = $query  = $this->db->query('SELECT * FROM wp_journal_archives jp JOIN wp_journals j on jp.journal_id = j.id INNER JOIN wp_journal_main_categories mc on mc.category_id = j.main_category_id WHERE jp.archive_in = "2" AND mc.category_name = "medical" AND j.journal_url_slug = "addiction-prevention" ORDER BY jp.archive_year ASC');		
		return $query->result_array();
    }
}

