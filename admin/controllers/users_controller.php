<?php
class Users_Controller
{
    public $SQL_Database;
    public $User_Processing_Model;
    public $User_Action;
    public $id;
    public function __construct($Action, $id)
    {
        $this->User_Action = $Action;
        $this->id = $id;
        include_once 'admin/models/user_processing_model.php';
        $this->User_Processing_Model = new User_Processing_Model();
        $this->SQL_Database = new SQL_Database;
    }

    public function Users()
    {
        switch ($this->User_Action) {
            case '':
                $List_Users = $this->User_Processing_Model->List_Users();
                include_once 'admin/views/users.php';
                break;
            case 'edit':
                $Profile = $this->SQL_Database->Get_User_By_ID($this->id);
                $this->User_Processing_Model->Edit_User();
                include_once 'admin/views/edit_user.php';
                break;
            case 'delete':
                if (isset($_SESSION['admin_u'])) {
                    $ID_Login = $_SESSION['admin_u']['ID'];
                } else if (isset($_SESSION['admin_a'])) {
                    $ID_Login = $_SESSION['admin_a']['ID'];
                } else {
                    $ID_Login = null;
                }
                if ($ID_Login == $this->id){
                    header('Location: admin.php?Admin_Action=users&Error= Bạn Không Thể Xóa Chính Mình');
                    exit();
                } else {
                    $this->SQL_Database->Delete_User_By_ID($this->id);
                    header('Location: admin.php?Admin_Action=users&Success=Xóa Thành Công');
                    exit();
                }
                break;
        }
    }
}
