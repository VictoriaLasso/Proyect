<?php

namespace SecurityBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('SecurityBundle:Default:index.html.twig');
    }
}
