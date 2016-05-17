<?php

/*
 * PageBundle Bundle
 * This file is part of the Admin.
 *
 * Victoria Lasso
 *
 */

namespace Admin\PageBundle\Services;

use Symfony\Component\HttpFoundation\RequestStack;

class AjaxDetection {

    public function __construct(RequestStack $requestStack) {

        $this->requestStack = $requestStack;
    }

    // Test if request is AJAX
    public function isAjaxRequest() {
        $request = $this->requestStack->getCurrentRequest();

        return $request->isXmlHttpRequest();
    }
}
