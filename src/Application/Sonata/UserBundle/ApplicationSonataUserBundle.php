<?php

/*
 * Sonata User Bundle Overrides
 * This file is part of the Admin.
 * Manage the extended Sonata User entity with extra information for the users
 *
 * (c) Victoria Lasso
 *
 */

namespace Application\Sonata\UserBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;


class ApplicationSonataUserBundle extends Bundle {

    /**
     * {@inheritdoc}
     */
    public function getParent() {
        return 'SonataUserBundle';
    }

}
