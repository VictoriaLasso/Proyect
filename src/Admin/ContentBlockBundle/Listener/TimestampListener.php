<?php

/*
 * ContentBlock Bundle
 * This file is part of the Admin.
 *
 * Victoria Lasso
 *
 */

namespace Admin\ContentBlockBundle\Listener;

use Doctrine\ORM\Event\OnFlushEventArgs;

class TimestampListener {

    public function onFlush(OnFlushEventArgs $args) {
        $em = $args->getEntityManager();
        $uow = $em->getUnitOfWork();

        $entities = array_merge(
                $uow->getScheduledEntityInsertions(), $uow->getScheduledEntityUpdates()
        );

        foreach ($entities as $entity) {
            if (!(get_class($entity) == 'Admin\ContentBlockBundle\Entity\ContentBlock')) {
                continue;
            }

            $contentBlockSlots = array(
                array('contentBlockSlot' => $entity->getMaincontents(), 'classMetadata' => 'Admin\PageBundle\Entity\Page'),
                array('contentBlockSlot' => $entity->getSecondarycontents(), 'classMetadata' => 'Admin\PageBundle\Entity\Page'),
                array('contentBlockSlot' => $entity->getExtracontents(), 'classMetadata' => 'Admin\PageBundle\Entity\Page'),
                array('contentBlockSlot' => $entity->getModalcontents(), 'classMetadata' => 'Admin\PageBundle\Entity\Page'),
                array('contentBlockSlot' => $entity->getBannercontents(), 'classMetadata' => 'Admin\PageBundle\Entity\Page'),
                array('contentBlockSlot' => $entity->getBlogMaincontents(), 'classMetadata' => 'Admin\BlogBundle\Entity\Blog'),
                array('contentBlockSlot' => $entity->getBlogExtracontents(), 'classMetadata' => 'Admin\BlogBundle\Entity\Blog'),
                array('contentBlockSlot' => $entity->getBlogModalcontents(), 'classMetadata' => 'Admin\BlogBundle\Entity\Blog'),
                array('contentBlockSlot' => $entity->getBlogBannercontents(), 'classMetadata' => 'Admin\BlogBundle\Entity\Blog')
            );

            foreach ($contentBlockSlots as $contentBlockSlot) {

                foreach ($contentBlockSlot['contentBlockSlot'] as $contentBlockHolder) {

                    $contentBlockHolder->setDateLastModified($entity->getDateLastModified());

                    $em->persist($contentBlockHolder);
                    $md = $em->getClassMetadata($contentBlockSlot['classMetadata']);
                    $uow->recomputeSingleEntityChangeSet($md, $contentBlockHolder);
                }
            }
        }
    }

}
