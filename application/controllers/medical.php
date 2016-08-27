<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Medical extends CI_Controller {
	public function index() {
		print_r($this->uri->segment(1));
	}
}