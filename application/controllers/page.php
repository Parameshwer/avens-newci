<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Page extends CI_Controller {
	public function __construct() { 
		parent::__construct(); 
		$this->load->helper(array('form', 'url')); 
  	}
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
	        if ( ! file_exists(APPPATH.'views/pages/journals.php'))
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

	public function get_latest_journals() {
		$this->load->model('App_model');

		//sanitize post value
		if($this->input->post("page")) {
			$page_number = $this->input->post("page");
		if(!is_numeric($page_number)){die('Invalid page number!');} //incase of invalid page number
		} else{
			$page_number = 1;
		}

		//get current starting point of records
		$position = (($page_number-1) * 5);

		$data['latest_articles'] = $this->App_model->get_latest_journals($position);

		echo $this->load->view('pages/ajax_latest_articles', $data,TRUE);	
	}
	public function save_submit_manuscript() {
				
		/*$attachment_file=$_FILES["uploadfile"];
		$output_dir = "./public/images";
		$fileName = $_FILES["uploadfile"]["name"];
		move_uploaded_file($_FILES["uploadfile"]["tmp_name"],$output_dir.$fileName);
		echo "File uploaded successfully"*/;

		$config['upload_path']          = './public/images';
        $config['allowed_types']        = 'jpg|png|doc|docx';
        $config['max_size']             = 1000;
        $config['max_width']            = 1024;
        $config['max_height']           = 768;
 	print_r($_POST);
        $this->load->library('upload', $config); 

        $all_files_uploads = true;
        foreach ($_FILES as $key => $value) {

        	if ( ! $this->upload->do_upload($key))
	        {
                $all_files_uploads = false;

	        }
	        else
	        {
	            $data = array('upload_data' => $this->upload->data());
	        }	
        }
        print_r($all_files_uploads);
        if($all_files_uploads) {
        	echo 'success';
        }

		
	}
	public function upload_files() {
		$config['upload_path']          = './public/images';
        $config['allowed_types']        = 'jpg|png|doc|docx';
        $config['max_size']             = 1000;
        $config['max_width']            = 1024;
        $config['max_height']           = 768;
 	
        $this->load->library('upload', $config); 
    	
        foreach ($_FILES as $key => $value) {        	
        	if($value['name']) {        		
	        	if ( ! $this->upload->do_upload($key))
		        {
	                $error = array('error' => $this->upload->display_errors());
	                print_r($error['error']);

		        }
		        else
		        {		        	
		            $data[] = array('upload_data' => $this->upload->data());		            

		        }
	        }	
        }               
		echo json_encode($data, true);
	}
	public function save_upload_files() {
		print_r($_POST);
	}

} 
