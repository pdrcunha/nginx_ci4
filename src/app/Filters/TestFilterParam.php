<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\HTTP\Response;

class TestFilterParam implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $response = service('response');
        return $response->setBody("CATCH IN FILTER")->setStatusCode(200);
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Aqui você pode adicionar lógica após o processamento da requisição, se necessário.
    }
}
