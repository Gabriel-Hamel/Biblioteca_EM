<?php
define('host', 'localhost');
define('usuario', 'root');
define('senha', '');
define('dbname', 'GEM');
$conexao = mysqli_connect(host, usuario, senha, dbname) or die ('Não foi possível conectar');
mysqli_set_charset($conexao, "utf8");
?>