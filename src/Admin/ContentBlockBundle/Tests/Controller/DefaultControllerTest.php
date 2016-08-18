<?php

/*
 * ContentBlock Bundle
 * This file is part of the Admin.
 *
 * (c) Victoria Lasso
 *
 */

namespace Admin\ContentBlockBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class DefaultControllerTest extends WebTestCase {

    public function testIndex() {
        $client = static::createClient();

        $crawler = $client->request('GET', '/hello/ContentBlock');

        $this->assertTrue($crawler->filter('html:contains("Hello ContentBlock")')->count() > 0);
    }

}
