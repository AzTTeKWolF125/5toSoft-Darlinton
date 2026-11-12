<?php
class Conexion {
    private $conexion;
    public function __construct() {
        $host = "127.0.0.1";
        $puerto = 3306;
        $dbname = "csn_inventario2";
        $usuario = "root";
        $clave = "";
        $this->conexion = new PDO(
            "mysql:host=$host;port=$puerto;dbname=$dbname;charset=utf8mb4",
            $usuario,
            $clave,
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false
            ]
        );
    }
    public function getConexion() {
        return $this->conexion;
    }
}