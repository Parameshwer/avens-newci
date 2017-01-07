<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Medical extends CI_Controller {
	public function index() {
		$this->load->model('App_model');
        $data['title'] = "Post Info";        
		if((strpos($this->uri->segment(3), 'current-issue') !== false) || (strpos($this->uri->segment(3), 'articles-in-press') !== false) || (strpos($this->uri->segment(3), 'archive') !== false) || (strpos($this->uri->segment(3), 'special-issues') !== false)) {
			$data['archive_info'] = $this->App_model->get_archive_info($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));
			$data['get_sidebar_links'] = $this->App_model->get_sidebar_links($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));
			$data['links_info'] = $this->App_model->get_sidebar_slugs($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));
			$this->load->view('templates/header', $data);
			$this->load->view('pages/archive_info.php', $data);
        	$this->load->view('templates/footer', $data);
    	} /*elseif($this->uri->segment(3) == 'aims-scope' || $this->uri->segment(3) == 'home' || $this->uri->segment(3) == 'editorial-board' || $this->uri->segment(3) == 'instructions-to-author' || $this->uri->segment(3) == 'manuscript-work-flow' || $this->uri->segment(3) == 'special-issues') {    		
			$data['post_info'] = $this->App_model->get_journal_post($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));        	
			$this->load->view('templates/header', $data);
	        $this->load->view('pages/post_info.php', $data);
        	$this->load->view('templates/footer', $data);
    	}*/ else if((strpos($this->uri->segment(3), 'home') !== false) || (strpos($this->uri->segment(3), 'aims-scope') !== false) || (strpos($this->uri->segment(3), 'editorial-board') !== false) || (strpos($this->uri->segment(3), 'manuscript-work-flow') !== false) || (strpos($this->uri->segment(3), 'current-issue') !== false) || (strpos($this->uri->segment(3), 'articles-in-press') !== false) || (strpos($this->uri->segment(3), 'archive') !== false) || (strpos($this->uri->segment(3), 'instructions-to-author') !== false)) {    		
    		$data['post_info'] = $this->App_model->get_journal_post($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));
    		$data['links_info'] = $this->App_model->get_sidebar_slugs($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));
    		//print_r($data['links_info']);exit();
			$this->load->view('templates/header', $data);
	        $this->load->view('pages/post_info.php', $data);
        	$this->load->view('templates/footer', $data);
    	}
    	 else {
    		$this->load->view('404');
    	}
        
	}
}