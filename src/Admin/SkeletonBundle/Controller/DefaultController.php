<?php

/*
 * Skeleton Bundle
 * This file is part of the Admin.
 *
 * (c) Victoria Lasso
 *
 */

namespace Admin\SkeletonBundle\Controller;

use Admin\SkeletonBundle\Form\Type\FilterResultsFormType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\DependencyInjection\ContainerInterface;

use Admin\PageBundle\Entity\Page as Page;

class DefaultController extends Controller {

    // Adding variables required for the rendering of pages
    protected $container;
    private $pageRequest;
    private $alias;
    private $id;
    private $extraParams;
    private $currentpage;
    private $totalpageitems;
    private $linkUrlParams;
    private $page;
    private $publishStates;
    private $userName;
    private $settings;
    private $serveMobile;
    private $userRole;
    private $enableHTTPCache;

    // Override the ContainerAware setcontainer to accomodate the extra variables
    public function setContainer(ContainerInterface $container = null) {
        $this->container = $container;

        // Setting the scoped variables required for the rendering of the page
        $this->alias = null;
        $this->id = null;
        $this->extraParams = null;
        $this->currentpage = null;
        $this->totalpageitems = null;
        $this->linkUrlParams = null;
        $this->page = null;
        $this->userName = null;

        // Get the settings from setting bundle
        $this->settings = $this->get('admin_settings.load_settings')->loadSettings();
        // Get the highest user role security permission
        $this->userRole = $this->get('sonata_user.services.helpers')->getLoggedUserHighestRole();
        // Check if mobile content should be served
        $this->serveMobile = $this->get('admin_mobile_detect.device_detection')->testMobile();

        // Set the flag for allowing HHTP cache
        $this->enableHTTPCache = $this->container->getParameter('kernel.environment') == 'prod' && $this->settings->getActivateHttpCache();

        // Set the publish statuses that are available for the user
        $this->publishStates = $this->get('admin_page.services.helpers')->getAllowedPublishStates($this->userRole);
    }

    // Get the Skeleton page id based on alias from route
    public function aliasAction($alias, $extraParams = null, $currentpage = 0, $totalpageitems = 0, Request $request) {

        $this->pageRequest = $request;
        $this->alias = $alias;
        $this->extraParams = $extraParams;
        $this->linkUrlParams = $extraParams;
        $this->currentpage = $currentpage;
        $this->totalpageitems = $totalpageitems;

        $page = $this->getDoctrine()->getRepository('SkeletonBundle:Skeleton')->findOneByAlias($alias);

        if (!$page) {
            return $this->get('admin_page.services.show_error_page')->errorPageAction(Page::ERROR_404);
        }

        $this->page = $page;
        $this->id = $this->page->getId();

        return $this->showPageAction();
    }

    // Display a page based on the id and the render variables from the settings and the routing
    public function showPageAction() {

        // Simple publishing ACL based on publish state and user role
        if ($this->page->getPublishState() == 0) {
            return $this->get('admin_page.services.show_error_page')->errorPageAction(Page::ERROR_404);
        }

        if ($this->page->getPublishState() == 2 && $this->userRole == "") {
            return $this->get('admin_page.services.show_error_page')->errorPageAction(Page::ERROR_404);
        }

        // Return cached page if enabled
        if ($this->enableHTTPCache) {

            $response = $this->setResponseCacheHeaders(new Response());

            if (!$response->isNotModified($this->pageRequest)) {
                // Marks the Response stale
                $response->expire();
            } else {
                // return the 304 Response immediately
                return $response;
            }
        }

        // Set the website settings and metatags
        $this->page = $this->get('admin_settings.set_page_settings')->setPageSettings($this->page);

        // Set the pagination variables
        if (is_object($this->settings)) {
            if (!$this->totalpageitems) {
                $this->totalpageitems = $this->settings->getItemsPerPage();
            }
        } else {
            $this->totalpageitems = 10;
        }

        // Render the correct view depending on pagetype
        return $this->renderPage();
    }

    // Get the required data to display to the correct view depending on pagetype
    protected function renderPage() {

        switch ($this->page->getPagetype()) {

            case 'category_page':
                $response = $this->renderCategoryPage();
                break;

            case 'skeleton_filtered_list':
                $response = $this->renderFilteredListPage();
                break;

            case 'skeleton_home':
                $response = $this->renderSkeletonHomePage();
                break;

            default:
                // Render normal page type
                $response = $this->render('SkeletonBundle:Default:page.html.twig', array('page' => $this->page, 'mobile' => $this->serveMobile));
        }

        if ($this->enableHTTPCache) {
            $response = $this->setResponseCacheHeaders($response);
        }

        return $response;
    }

    // Get and format the filtering arguments to use with the actions
    public function filterPagesAction(Request $request) {

        $filterTags = 'all';
        $filterCategories = 'all';

        // Create the filters form
        $filterForm = $this->createForm(new FilterResultsFormType());
        $filterData = null;

        // If the filter form has been submited
        if ($request->getMethod() == 'POST') {

            // Bind the data with the form
            $filterForm->handleRequest($request);

            // Get the data from the form
            $filterData = $filterForm->getData();

            // Assign the filters to categories and tags
            $filterTags = $this->get('admin_skeleton.services.helpers')->getTagFilterTitles($filterData['tags']);
            $filterCategories = $this->get('admin_skeleton.services.helpers')->getCategoryFilterTitles($filterData['categories']);
        }

        // Use the filters based on the routing structure
        $this->extraParams = urlencode($filterTags) . '|' . urlencode($filterCategories);

        // Generate the proper route for the required results
        $url = $this->get('router')->generate(
                'SkeletonBundle_tagged_noslash', array('extraParams' => $this->extraParams), true
        );

        // Redirect to the results
        return $this->redirect($url);
    }

    // Render the home page
    protected function renderSkeletonHomePage() {

        // Get all items to display in home page
        $pageList = $this->getDoctrine()->getRepository('SkeletonBundle:Skeleton')->getAllItems($this->id, $this->publishStates, $this->currentpage, $this->totalpageitems);
        $pages = $pageList['pages'];
        $totalPages = $pageList['totalPages'];

        $response = $this->render('SkeletonBundle:Default:page.html.twig', array('page' => $this->page, 'pages' => $pages, 'totalPages' => $totalPages, 'extraParams' => $this->extraParams, 'currentpage' => $this->currentpage, 'linkUrlParams' => $this->linkUrlParams, 'totalpageitems' => $this->totalpageitems, 'mobile' => $this->serveMobile));

        return $response;
    }

    // Render filtered list page type
    protected function renderFilteredListPage() {

        $filterForm = $this->createForm(new FilterResultsFormType());
        $filterData = $this->get('admin_skeleton.services.helpers')->getRequestedFilters($this->extraParams);
        $tagIds = $this->get('admin_skeleton.services.helpers')->getTagFilterIds($filterData['tags']->toArray());
        $categoryIds = $this->get('admin_skeleton.services.helpers')->getCategoryFilterIds($filterData['categories']->toArray());

        $filterForm->setData($filterData);

        if (!empty($categoryIds)) {
            $pageList = $this->getDoctrine()->getRepository('SkeletonBundle:Skeleton')->getTaggedCategoryItems($categoryIds, $this->id, $this->publishStates, $this->currentpage, $this->totalpageitems, $tagIds);
        } else {
            $pageList = $this->getDoctrine()->getRepository('SkeletonBundle:Skeleton')->getTaggedItems($tagIds, $this->id, $this->publishStates, $this->currentpage, $this->totalpageitems);
        }

        $pages = $pageList['pages'];
        $totalPages = $pageList['totalPages'];

        $response = $this->render('SkeletonBundle:Default:page.html.twig', array('page' => $this->page, 'pages' => $pages, 'totalPages' => $totalPages, 'extraParams' => $this->extraParams, 'currentpage' => $this->currentpage, 'linkUrlParams' => $this->linkUrlParams, 'totalpageitems' => $this->totalpageitems, 'filterForm' => $filterForm->createView(), 'mobile' => $this->serveMobile));

        return $response;
    }

    // Render category list page type
    protected function renderCategoryPage() {
        $tagIds = $this->get('admin_skeleton.services.helpers')->getTagFilterIds($this->page->getTags()->toArray());
        $categoryIds = $this->get('admin_skeleton.services.helpers')->getCategoryFilterIds($this->page->getCategories()->toArray());

        if (!empty($tagIds)) {
            $pageList = $this->getDoctrine()->getRepository('SkeletonBundle:Skeleton')->getTaggedCategoryItems($categoryIds, $this->id, $this->publishStates, $this->currentpage, $this->totalpageitems, $tagIds);
        } else {
            $pageList = $this->getDoctrine()->getRepository('SkeletonBundle:Skeleton')->getCategoryItems($categoryIds, $this->id, $this->publishStates, $this->currentpage, $this->totalpageitems);
        }

        $pages = $pageList['pages'];
        $totalPages = $pageList['totalPages'];

        $response = $this->render('SkeletonBundle:Default:page.html.twig', array('page' => $this->page, 'pages' => $pages, 'totalPages' => $totalPages, 'extraParams' => $this->extraParams, 'currentpage' => $this->currentpage, 'linkUrlParams' => $this->linkUrlParams, 'totalpageitems' => $this->totalpageitems, 'mobile' => $this->serveMobile));

        return $response;
    }

    // set a custom Cache-Control directives
    protected function setResponseCacheHeaders(Response $response) {

        $response->setPublic();
        $response->setLastModified($this->page->getDateLastModified());
        $response->setVary(array('Accept-Encoding', 'User-Agent'));
        $response->headers->addCacheControlDirective('must-revalidate', true);
        $response->setSharedMaxAge(3600);

        return $response;
    }
}
