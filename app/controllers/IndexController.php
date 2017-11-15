<?php

class IndexController extends ControllerBase
{

	public function indexAction()
	{


		$this->view->logoutField = "";
		$this->view->profileField = "";

		if (!$this->session->has('user')) {
			return $this->response->redirect('login');
		}

		$this->view->usergreeting = "Hello ".$this->session->get('user') . "!";
		$this->view->profileField = "<a href='profile'>My Profile</a>";
		$this->view->logoutField = "<a href='index/logout' class='btn btn-simple btn-white btn-just-icon'>Logout</a>";

		// For condition control. If its true, redirects to the main.
		$context_control = true;
		$id = $this->request->get('id');
		
		if ($id != null) {
			$singerDat = Singers::findFirst($id);
			
			if ($singerDat) {
				$context_control = false;

				$this->view->singerName  = $singerDat->name;
				$this->view->singerBio   = $singerDat->bio;
				$this->view->singerTitle = $singerDat->title;
				$this->view->singerPhoto = $singerDat->pic_url;
				$allVideos = "";

				// Get videos with that id, order them with their id.
				$singerVideos = Videos::find(
					[
						"oid = '$id'",
						'order' => 'date',
					]
				);

				// Iter in array to get meaningful data.
				for($i = 0; $i < count($singerVideos); $i++ ){
					$allVideos = $allVideos . "<div class='col-md'>" . $singerVideos[$i]->embedData . "</div>";
				}

				// Last video should be the hottest one, right?
				$this->view->singerHotVideos = $singerVideos[0]->embedData;
				// Get all videos..
				$this->view->singerAllVideos = $allVideos;
			}
		}


		if ($context_control)
			$this->GetWelcomePage();
	}


	public function logoutAction() {
		 // Destroy the whole session
		$this->session->destroy();

		return $this->response->redirect("index");
	}

	private function GetWelcomePage() {
		$this->view->pick('layouts/welcome');

	// Get all singers.
		$singerDat = Singers::find();

		$singerCards = ""; 
		for ($i = 0; $i < count($singerDat); $i++) {
		//	if ($i%3 == 0) {
			$singerCards = $singerCards . "<div class='row'>";
			for ($a = 0; $a < 3; $a++) {
				$f = $i + $a;
				if ($f < count($singerDat)) {
					$singerCards = $singerCards . "<div class='col-md-4'><div class='team-player'><a href='index?id=".($f+1)."'> <div class='main main-raised'><img src='". $singerDat[$f]->pic_url . "' alt='Thumbnail Image' class='img-raised img-circle' style='margin-top: 4%;'><h4 class='title'>" . $singerDat[$f]->name . "<br/><small class='text-muted'>" . $singerDat[$f]->title . "</small></h4><p class='bio-field'>" . substr($singerDat[$f]->bio, 0, 150). "..."  ."</p></div></a></div></div>";
				}
			}

			$i = $i + 2;
			$singerCards = $singerCards . "</div>";
			//}
		}

		$this->view->singerList = $singerCards;
	}
}

