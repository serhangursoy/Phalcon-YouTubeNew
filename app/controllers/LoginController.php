<?php

class LoginController extends \Phalcon\Mvc\Controller
{

	public function indexAction()
	{
		$this->view->pick('layouts/login');
		$this->view->logoutField = "";
		$this->view->usergreeting = "";
		$this->view->profileField = "";
	}

	public function loginAction(){
		$password = $this->request->get('password');
		$email    = $this->request->get('email');

		$userControl = Users::findFirst(
			[
				"email = '$email'",
				"password = '$password'",
			]
		);

		if ($userControl) {
			$this->session->set("user", $userControl->username);
			$this->view->profileField =  "<a href='profile'>My Profile</a>";
			$this->view->logoutField = "<a href='index/logout' class='btn btn-simple btn-white btn-just-icon'>Logout</a>";
			
			$this->view->usergreeting = "Hello ".$this->session->get('user') . "!";
			return $this->response->redirect("index");
		}
	}

}

