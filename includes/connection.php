<?php
namespace DB;
class DB_A{
    private const HOST_DB = "127.0.0.1";
    private const DATABASE_NAME = "tecweb";
    private const USERNAME = "user";
    private const PASSWORD = "user";

    private $connection;

    public function open_connection(){
        $this->connection = mysqli_connect(DB_A::HOST_DB, DB_A::USERNAME, DB_A::PASSWORD, DB_A::DATABASE_NAME);
        if(mysqli_connect_errno()) {
            echo "Errore di connessione al database: " . mysqli_connect_error();
            return false;
        }
        else{
            return true;
        }
    }

    public function close_connection(){
        if($this->connection != null){
            $this->connection->close();
        }
    }

    public function get_connection_state(){
        return $this->connection;
    }
    
}
?>