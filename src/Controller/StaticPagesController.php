<?php

namespace App\Controller;

use App\Annotation\SiteMap;
use App\Breadcrumbs\AboutUs;
use Exception;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class StaticPagesController extends AbstractController
{
    #[Route('')]
    public function home()
    {
        // Removed dump
        return $this->render('base.html.twig', []);
    }
}
