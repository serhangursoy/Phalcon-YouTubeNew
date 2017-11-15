<?php

class RegisterController extends \Phalcon\Mvc\Controller
{

	public function indexAction()
	{
		$this->view->pick('layouts/register');
		$this->view->logoutField = "";
		$this->view->profileField = "";
		$this->view->usergreeting ="";
	}

	public function registerAction() {
		$username = $this->request->get('username');
		$password = $this->request->get('password');
		$email    = $this->request->get('email');


		$newUser = new Users();
		$newUser->username = $username;
		$newUser->password = $password;
		$newUser->email    = $email;

		if ($newUser->save() === false) {
			echo "Umh, We can't store that user right now: \n";
		} else {
			// Create session 
			$this->session->set("user", $username);


			$this->view->profileField =  "<a href='profile'>My Profile</a>";
			$this->view->logoutField = "<a href='index/logout' class='btn btn-simple btn-white btn-just-icon'>Logout</a>";
			
			$this->view->usergreeting = "Hello ".$this->session->get('user') . "!";
			return $this->response->redirect("index");
		}
	}

}

