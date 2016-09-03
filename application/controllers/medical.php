<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Medical extends CI_Controller {
	public function index() {
		$this->load->model('App_model');
        $data['title'] = "Post Info";
		if($this->uri->segment(3) == 'current-issue' || $this->uri->segment(3) == 'article-in-press' || $this->uri->segment(3) == 'archive') {
			$data['archive_info'] = $this->App_model->get_archive_info($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));
			print_r($data);exit;			
			$this->load->view('templates/header', $data);
			$this->load->view('pages/archive_info.php', $data);
        	$this->load->view('templates/footer', $data);
    	} else {    		
			$data['post_info'] = $this->App_model->get_journal_post($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));        	
			$this->load->view('templates/header', $data);
	        $this->load->view('pages/post_info.php', $data);
        	$this->load->view('templates/footer', $data);
    	}
        
	}
}