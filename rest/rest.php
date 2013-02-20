<?php

require '../app/CrazyApp.php';
CrazyApp::Autoload_Register();


$app = new CrazyApp;

$app->routes();

$app->goCrazy();

?>