<?php
session_start();
$dbUrl = 'postgres://neon:J57XpzgGhAqP@ep-quiet-frog-a5ckq1hy.us-east-2.aws.neon.tech/neondb?sslmode=require&options=project%3Dep-quiet-frog-a5ckq1hy';

$dbParts = parse_url($dbUrl);

$dbData = new stdClass();
$dbData->driver = 'pgsql';
$dbData->host = 'db'; // Substitua 'nome_ou_ip_do_conteiner' pelo nome ou IP do seu contêiner Docker
$dbData->port = 5432; // Porta padrão para PostgreSQL
$dbData->dbname = 'bdufpa'; // Nome do banco de dados
$dbData->user = 'bdufpa'; // Substitua 'nome_do_usuario' pelo nome do usuário do seu banco de dados
$dbData->password = 'admin'; // Substitua 'senha' pela senha do seu banco de dados
$dbData->options = [

    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];
$dbData->connection = new PDO($dbData->driver . ':host=' . $dbData->host . ';port=5432;dbname=' . $dbData->dbname, $dbData->user, $dbData->password);
?>