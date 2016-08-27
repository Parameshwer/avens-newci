<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Page extends CI_Controller {

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
	/*public function view($page = 'home')
	{			
	        if ( ! file_exists(APPPATH.'views/pages/'.$page.'.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = ucfirst($page); // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/'.$page, $data);
	        $this->load->view('templates/footer', $data);
	}*/
	public function index()
	{			
	        if ( ! file_exists(APPPATH.'views/pages/home.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = "Home Page"; // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/home.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function about_us()
	{						
	        if ( ! file_exists(APPPATH.'views/pages/about_us.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = "Home Page"; // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/about_us.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function journals()
	{						
	        if ( ! file_exists(APPPATH.'views/pages/submit_manuscript.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }
			$this->load->model('App_model');		        
	        $data['title'] = "journal Page"; // Capitalize the first letter
	        $data['j_info'] = $this->App_model->get_journals('category-wise');	        
	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/journals.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function submit_manuscript()
	{						
	        if ( ! file_exists(APPPATH.'views/pages/submit_manuscript.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = "Home Page"; // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/submit_manuscript.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function processing_fee()
	{						
	        if ( ! file_exists(APPPATH.'views/pages/processing_fee.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = "Home Page"; // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/processing_fee.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function collaborations()
	{						
	        if ( ! file_exists(APPPATH.'views/pages/collaborations.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = "Home Page"; // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/collaborations.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function membership()
	{						
	        if ( ! file_exists(APPPATH.'views/pages/membership.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = "Home Page"; // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/membership.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function policies()
	{						
	        if ( ! file_exists(APPPATH.'views/pages/policies.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = "Home Page"; // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/policies.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function contact()
	{						
	        if ( ! file_exists(APPPATH.'views/pages/contact.php'))
	        {
	                // Whoops, we don't have a page for that!
	                show_404();
	        }

	        $data['title'] = "Home Page"; // Capitalize the first letter

	        $this->load->view('templates/header', $data);
	        $this->load->view('pages/contact.php', $data);
	        $this->load->view('templates/footer', $data);
	}
	public function get_journals() {			
		$this->load->model('App_model');	
		$data['j_info'] = $this->App_model->get_journals($this->input->get('sort_type'));
		$data['sort_type'] = $this->input->get('sort_type');		
		/*$temp = array();
		foreach ($data as $key => $value) {
			if($value['category_name'] == 'Medical') {
				$temp['medical'][] = $value;
			} else if($value['category_name'] == 'Biotechnology') {
				$temp['biotechnology'][] = $value;
			} else if($value['category_name'] == 'Pharmaseutical') {
				$temp['pharmaceutical'][] = $value;
			} else if($value['category_name'] == 'Biology') {
				$temp['biology'][] = $value;
			}
		}*/		
		/*if(is_array($data)){
			echo json_encode($data);
		}	*/
		echo $this->load->view('pages/ajax_journals', $data,TRUE);	
	}	
}
