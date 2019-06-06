<?php 
class ControllerInformationBrands extends Controller {
	private $error = array(); 
	    
  	public function index() {
	    $this->load->model('setting/store');
		$this->language->load('information/brands');

    	$this->document->title = $this->language->get('heading_title');  
	 
    	
      	$this->document->breadcrumbs = array();

      	$this->document->breadcrumbs[] = array(
        	'href'      => HTTP_SERVER . '',
        	'text'      => $this->language->get('text_home'),
        	'separator' => FALSE
      	);

      	$this->document->breadcrumbs[] = array(
        	'href'      => HTTP_SERVER . 'index.php?route=information/brands',
        	'text'      => $this->language->get('heading_title'),
        	'separator' => $this->language->get('text_separator')
      	);	
			
    	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['action'] = HTTP_SERVER . 'index.php?route=information/brands';
		
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/brands.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/brands.tpl';
		} else {
			$this->template = 'default/template/information/brands.tpl';
		}
		
		$this->children = array();
		
		$this->load->model('checkout/extension');
		
		$module_data = $this->model_checkout_extension->getExtensionsByPosition('module', 'brands');
		
		$this->data['modules'] = $module_data;
		
		foreach ($module_data as $result) {
			$this->children[] = 'module/' . $result['code'];
		}
		
		$this->children[] = 'common/column_right';
		$this->children[] =	'common/column_left';
		$this->children[] =	'common/footer';
		$this->children[] =	'common/header';
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	
  	}
  	
}
?>
