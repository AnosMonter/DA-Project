<?php 
class User_Processing_Model {
    public $Database;
    public $SQL_Database;
    public function __construct() {
        $this->Database = new Database_Model();
        $this->SQL_Database = new SQL_Database();
    }

    public function List_Users() {
        return $this->SQL_Database->Get_User();
    }

    public function Edit_User() {
        if (isset($_POST['Sub-Edit'])){
            $New_Role = $_POST['Role'];
            $New_Status = $_POST['Status'];
            $ID = $_POST['ID'];
            if ($this->SQL_Database->Update_Role_Status_User_By_ID($ID, $New_Role, $New_Status) == true) {
                header('Location: admin.php?Admin_Action=users&Success_Masage=Cập Nhật Thành Công');
                exit();
            } else {
                header('Location: admin.php?Admin_Action=users&Error_Massage=Cập Nhật Thất Bại');
                exit();
            }
        }
    }
}