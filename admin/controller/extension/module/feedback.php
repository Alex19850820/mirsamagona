<?php
class ControllerExtensionModuleFeedback extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/feedback');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('feedback', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title']       = $this->language->get('heading_title');

		$data['text_edit']           = $this->language->get('text_edit');
		$data['text_enabled']        = $this->language->get('text_enabled');
		$data['text_disabled']       = $this->language->get('text_disabled');

		$data['button_save']         = $this->language->get('button_save');
		$data['button_cancel']       = $this->language->get('button_cancel');

		$data['entry_name']          = $this->language->get('entry_name');
		$data['entry_heading_title'] = $this->language->get('entry_heading_title');
		$data['entry_text_main']     = $this->language->get('entry_text_main');
		$data['entry_email_status']  = $this->language->get('entry_email_status');
		$data['entry_header_status'] = $this->language->get('entry_header_status');
		$data['entry_status']        = $this->language->get('entry_status');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/feedback', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/feedback', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['feedback_title'])) {
			$data['feedback_title'] = $this->request->post['feedback_title'];
		} else {
			$data['feedback_title'] = $this->config->get('feedback_title');
		}

		if (isset($this->request->post['feedback_main'])) {
			$data['feedback_main'] = $this->request->post['feedback_main'];
		} else {
			$data['feedback_main'] = $this->config->get('feedback_main');
		}

		if (isset($this->request->post['feedback_email'])) {
			$data['feedback_email'] = $this->request->post['feedback_email'];
		} else {
			$data['feedback_email'] = $this->config->get('feedback_email');
		}

		if (isset($this->request->post['feedback_header'])) {
			$data['feedback_header'] = $this->request->post['feedback_header'];
		} else {
			$data['feedback_header'] = $this->config->get('feedback_header');
		}

		if (isset($this->request->post['feedback_status'])) {
			$data['feedback_status'] = $this->request->post['feedback_status'];
		} else {
			$data['feedback_status'] = $this->config->get('feedback_status');
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/feedback', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/feedback')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}