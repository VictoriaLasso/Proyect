<?php

namespace Admin\PageBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class DefaultControllerTest extends WebTestCase {

    public function testIndex() {
        $client = static::createClient();

        $crawler = $client->request('GET', '/hello/Admin');

        $this->assertTrue($crawler->filter('html:contains("Hello Admin")')->count() > 0);
    }

}
