<?php

/*
 * Settings Bundle
 * This file is part of the Admin.
 *
 * Victoria Lasso
 *
 */

namespace Admin\SettingsBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Admin\SettingsBundle\Entity\Settings;

class SettingsFixtures extends AbstractFixture implements OrderedFixtureInterface {

    public function load(ObjectManager $manager) {
        $settings = new Settings();
        $settings->setMetaDescription('Default Meta Description');
        $settings->setMetaKeywords('Default Meta Keywords');
        $settings->setFromTitle('Owner');
        $settings->setWebsiteTitle('Andres proyect');
        $settings->setWebsiteAuthor('Author');
        $settings->setUseWebsiteAuthor(1);
        $settings->setEnableGoogleAnalytics(0);
        $settings->setGoogleAnalyticsId('UA-XXX-XXXXX');
        $settings->setEmailSender('musicaexodo5@gmail.com');
        $settings->setEmailRecepient('musicaexodo5@gmail.com');
        $settings->setItemsPerPage(2);
        $settings->setBlogItemsPerPage(2);
        $settings->setActivateSettings(1);
        $manager->persist($settings);

        $manager->flush();

        $this->addReference('settings', $settings);
    }

    public function getOrder() {
        return 1;
    }

}
