<?php

/*
 * CommentBundle Bundle
 * This file is part of the Admin.
 *
 * (c) Victoria Lasso
 *
 */

namespace Admin\CommentBundle\Services;

use Doctrine\ORM\EntityManager as EntityManager;

class CommentHelper {
    private $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }

    // Get the approved comments for the blog post
    public function getBlogPostComments($associated_object_id) {
        $comments = $this->em->getRepository('CommentBundle:Comment')->getCommentsForBlogPost($associated_object_id);

        return $comments;
    }
}
