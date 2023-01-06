<?php
namespace DB;

class DBAccess{
   
    private const HOST_DB = "127.0.0.1";
    private const DATABASE_NAME = "poptech";
    private const USERNAME = "root";
    private const PASSWORD = "";
    private $connection;

    public function open_connection(){

        mysqli_report(MYSQLI_REPORT_ERROR);

        $this->connection = mysqli_connect(DBAccess::HOST_DB, DBAccess::USERNAME, DBAccess::PASSWORD, DBAccess::DATABASE_NAME);

        if(mysqli_connect_errno()) {
            echo "Errore di connessione al database: " . mysqli_connect_error();
            return false;
        }
        else{
            return true;
        }
    }

    public function exec_select_query($query){

        $res = mysqli_query($this->connection, $query) or die("Errore DB: ".mysqli_error($this->connection));
 
        if(mysqli_num_rows($res)==0){
            return array();
        }else{
            
            $resArray = array();
            
            while($row = mysqli_fetch_assoc($res)){
                array_push($resArray,$row);
            }
            
            $res->free();
            
            return $resArray;
        }
    }

    //Esegui query che alterano il sistema
    public function exec_alter_query($query){
        $res = mysqli_query($this->connection, $query) or die("Errore DB: ".mysqli_error($this->connection));
        return $res;
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