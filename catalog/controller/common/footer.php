<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		
		/*my*/
		$data['address'] = nl2br($this->config->get('config_address'));
		$data['my_email'] = $this->config->get('config_email');
		$data['open'] = nl2br($this->config->get('config_open'));
		$this->document->addScript('catalog/view/javascript/phone.js');
		$this->document->addScript('catalog/view/javascript/jquery.inputmask.bundle.js');
		$this->document->addScript('catalog/view/javascript/script_form.js');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['phone_link'] = preg_replace("/[^,.0-9]/", '', $this->config->get('config_telephone'));
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		$data['name_logo'] = $this->config->get('config_name');
		
		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}
		
		/*end*/
		
		
		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		//$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));
		$data['powered'] = " &copy " . date('Y', time()) . " " .$this->config->get('config_name');

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}
		
		// Menu
		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$data['categories'] = array();
		
		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();
				
				$children = $this->model_catalog_category->getCategories($category['category_id']);
				
				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}
				
				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		/*feedback*/
		$this->load->language('extension/module/feedback');
		
		if (isset($this->config->get('feedback_title')[$this->config->get('config_language_id')])) {
			$data['heading_title'] = html_entity_decode($this->config->get('feedback_title')[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		} else {
			$data['heading_title'] = '';
		}
		
		if (isset($this->config->get('feedback_main')[$this->config->get('config_language_id')])) {
			$data['text_main'] = html_entity_decode($this->config->get('feedback_main')[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		} else {
			$data['text_main'] = '';
		}
		
		if (!empty($this->config->get('feedback_email'))) {
			$data['email_active'] = $this->config->get('feedback_email');
		} else {
			$data['email_active'] = '';
		}
		
		$data['entry_name']             = $this->language->get('entry_name');
		$data['entry_phone']            = $this->language->get('entry_phone');
		$data['entry_email']            = $this->language->get('entry_email');
		$data['entry_enquiry']          = $this->language->get('entry_enquiry');
		
		$data['text_button']            = $this->language->get('text_button');
		$data['text_button_callback']   = $this->language->get('text_button_callback');
		$data['text_send']              = $this->language->get('text_send');
		$data['text_loading']           = $this->language->get('text_loading');
		
		$data['email_subject']          = $this->language->get('email_subject');
		$data['email_subject_callback'] = $this->language->get('email_subject_callback');
		
		// Captcha
		if (!$this->customer->isLogged() && $this->config->get($this->config->get('config_captcha') . '_status') && in_array('feedback', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
		} else {
			$data['captcha'] = '';
		}
		
		if ($this->customer->isLogged()) {
			$data['name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
		} else {
			$data['name'] = '';
		}
		
		if ($this->customer->isLogged()) {
			$data['phone'] = $this->customer->getTelephone();
		} else {
			$data['phone'] = '';
		}
		
		if (!empty($this->config->get('feedback_email')) && $this->customer->isLogged()) {
			$data['email'] = $this->customer->getEmail();
		} else {
			$data['email'] = '';
		}
		/*end*/

		return $this->load->view('common/footer', $data);
	}
}
