<?php  
class ControllerModuleManufacturers extends Controller {
	protected function index() {
		$this->language->load('module/manufacturers');	
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_select'] = $this->language->get('text_select');
		
		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['manufacturer_id'] = $this->request->get['manufacturer_id'];
		} else {
			$this->data['manufacturer_id'] = 0;
		}
		
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/seo_url'); 
		 
		$this->data['manufacturers'] = array();
		
		$results = $this->model_catalog_manufacturer->getManufacturers();
		
		foreach ($results as $result) {
			$this->data['manufacturers'][] = array(
				'manufacturer_image' => $result['image'],
				'manufacturer_id' => $result['manufacturer_id'],
				'name'            => $result['name'],
				'href'            => $this->model_tool_seo_url->rewrite(HTTP_SERVER . 'index.php?route=product/manufacturer&manufacturer_id=' . $result['manufacturer_id'])
			);
		}
		
		$this->id = 'manufacturers';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturers.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/manufacturers.tpl';
		} else {
			$this->template = 'default/template/module/manufacturers.tpl';
		}
		
		$this->render(); 
	}
}
?>