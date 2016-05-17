<?php

namespace AndresProject\LoginBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        //return $this->render('LoginBundle:Default:index.html.twig');
        return $this->redirect($this->generateUrl('sonata_user_admin_security_login'));
    }
}
