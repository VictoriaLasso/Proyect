<?php

/*
 * ContentBlock Bundle
 * This file is part of the Admin.
 *
 * (c) Victoria Lasso
 *
 */

namespace Admin\ContentBlockBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Admin\ContentBlockBundle\Entity\ContentGlobalBlock
 *
 * @ORM\Table(name="content_globalblock")
 * @ORM\Entity
 */
class ContentGlobalBlock {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\ManyToOne(targetEntity="Admin\ContentBlockBundle\Entity\ContentBlock", cascade={"persist", "remove"})
     * @ORM\JoinColumn(name="contentblock", referencedColumnName="id", onDelete="CASCADE")
     */
    protected $contentblock;

    /**
     * Get id
     *
     * @return integer
     */
    public function getId() {
        return $this->id;
    }

    /**
     * Set contentblock
     *
     * @param Admin\ContentBlockBundle\Entity\ContentBlock contentblock
     * @return ContentBlock
     */
    public function setContentblock(\Admin\ContentBlockBundle\Entity\ContentBlock $contentblock = null) {
        $this->contentblock = $contentblock;
        return $this;
    }

    /**
     * Get contentblock
     *
     * @return Admin\ContentBlockBundle\Entity\ContentBlock
     */
    public function getContentblock() {
        return $this->contentblock;
    }
}
