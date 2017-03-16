<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Feed extends CI_Controller {
	public function index() {		
		$this->load->helper('xml');
		$this->load->helper('text');
		$this->load->model('Feed_model');

		$data['feed_name'] = 'MyWebsite.com';
        $data['encoding'] = 'utf-8';
        $data['feed_url'] = 'http://www.MyWebsite.com/feed';
        $data['page_description'] = 'What my site is about comes here';
        $data['page_language'] = 'en-en';
        $data['creator_email'] = 'mail@me.com';          
        $data['archive_info'] = $this->Feed_model->get_archive_info();
        header("Content-Type: application/rss+xml");
         
        $this->load->view('rss', $data);

	}
}