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
	function login()
	{
	    $this->load->view('admin-template/header');
        $this->load->view('admin/login');
        $this->load->view('admin-template/footer');
	}
	function validate_credentials()
	{	

		$this->load->model('Users_model');

		$user_name = $this->input->post('user_name');
		$password = $this->__encrip_password($this->input->post('password'));
		
		$is_valid = $this->Users_model->validate($user_name, $password);
		
		if($is_valid)
		{
			$data = array(
				'user_name' => $user_name,
				'is_logged_in' => true
			);
			$this->session->set_userdata($data);
			redirect('admin/products');
		}
		else // incorrect username or password
		{
			$data['message_error'] = TRUE;
			$this->login();	
		}
	}	
	function __encrip_password($password) {
        return md5($password);
    }
    function signup() {
    	$this->load->view('admin-template/header');
		$this->load->view('admin/signup_form');
		$this->load->view('admin-template/footer');	
	}
}
