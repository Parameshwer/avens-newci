<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	function index() {					
		$this->load->view('templates/admin/header');
	    //$this->load->view('pages/'.$page, $data);
	    $this->load->view('templates/admin/content');
	    $this->load->view('templates/admin/footer');
	}
	function login()
	{		
		$this->load->view('templates/admin/header');
	    //$this->load->view('pages/'.$page, $data);
	    $this->load->view('templates/admin/content');
	    $this->load->view('templates/admin/footer');
	}
	function validate_credentials()
	{			
		$this->load->model('Users_model');

		$user_name = $this->input->post('user_name');
		$password = $this->__encrip_password($this->input->post('password'));

		$is_valid = $this->Users_model->validate($user_name, $password);
		
		if($is_valid)
		{
			echo 'if';
			$data = array(
				'user_name' => $user_name,
				'is_logged_in' => true
			);
			$this->session->set_userdata($data);
			redirect('admin/dashboard');
		}
		else // incorrect username or password
		{
			echo 'else';
			$data['message_error'] = TRUE;
			$this->login();	
		}
	}
	function __encrip_password($password) {
        return md5($password);
    }	
	function dashboard() {		
		$this->load->view('templates/admin/header');
	    //$this->load->view('pages/'.$page, $data);
	    $this->load->view('templates/admin/content');
	    $this->load->view('templates/admin/footer');
	}
}