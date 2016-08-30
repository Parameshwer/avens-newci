<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Medical extends CI_Controller {
	public function index() {
		$this->load->model('App_model');
		$data['post_info'] = $this->App_model->get_journal_post($this->uri->segment(1),$this->uri->segment(2),$this->uri->segment(3));
        $data['title'] = "Post Info";
        $this->load->view('templates/header', $data);
        $this->load->view('pages/post_info.php', $data);
        $this->load->view('templates/footer', $data);
	}
}