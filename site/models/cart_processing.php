<?php
class Cart_Model
{
    public $Database;
    public function __construct()
    {
        $this->Database = new SQL_Database();
    }
    public function Add_Product_Cart($id)
    {
        $Product = $this->Database->Get_Product_By_ID($id);
        // Lấy ID người dùng hiện tại
        $userId = $_SESSION['user']['ID'];

        // Kiểm tra xem giỏ hàng của người dùng đã tồn tại chưa
        if (!isset($_SESSION['cart'][$userId])) {
            // Nếu chưa tồn tại, tạo mới một giỏ hàng
            $_SESSION['cart'][$userId] = [];
        }

        // Lấy giỏ hàng của người dùng hiện tại
        $userCart = $_SESSION['cart'][$userId];

        // Tạo sản phẩm mới
        $newProduct = [
            'ID' => $Product[0]['ID'],
            'Name' => $Product[0]['Name'],
            'Price' => $Product[0]['Price'],
            'Image' => $Product[0]['Image'],
            'Sale' => $Product[0]['Sale'],
            'Quantity' => 1
        ];

        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
        $productExists = false;
        foreach ($userCart as &$cartProduct) {
            if ($cartProduct['ID'] == $id) {
                $cartProduct['Quantity']++;
                $productExists = true;
                break;
            }
        }

        // Nếu sản phẩm chưa tồn tại, thêm vào giỏ hàng
        if (!$productExists) {
            $userCart[] = $newProduct;
        }

        // Lưu giỏ hàng của người dùng vào session
        $_SESSION['cart'][$_SESSION['user']['ID']] = $userCart;
        header('Location: index.php?action=products&product-action=detail&id=' . $id . '&Success_Message=Sản Phẩm Được Thêm Vào Giỏ Hàng Thành Công');
        exit();
    }
    public function Delete_Product_Cart($id)
    {
        $userId = $_SESSION['user']['ID'];

        if (isset($_SESSION['cart'][$userId])) {
            $userCart = &$_SESSION['cart'][$userId]; // Truyền tham chiếu để thay đổi trực tiếp mảng

            foreach ($userCart as $key => $product) {
                if ($product['ID'] == $id) {
                    unset($userCart[$key]);
                    break; // Thoát vòng lặp khi tìm thấy và xóa sản phẩm
                }
            }
            $userCart = array_values($userCart);
        }
        header('Location: index.php?action=cart&Success_Message=Sản phẩm đã được xóa khỏi giỏ hàng');
        exit();
    }

    public function Update_Quantity_Cart($id)
    {
        $userId = $_SESSION['user']['ID'];
        if (isset($_SESSION['cart'][$userId])) {
            $userCart = &$_SESSION['cart'][$userId]; // Truyền tham chiếu để thay đ��i trực tiếp mảng
            foreach ($userCart as $key => $product) {
                if ($product['ID'] == $id) {
                    $userCart[$key]['Quantity'] = $_POST['quantity'];
                    break;
                }

                if ($userCart[$key]['Quantity'] <= 0) {
                    unset($userCart[$key]);
                }
            }
            if (empty($userCart)) {
                unset($_SESSION['cart'][$userId]);
                header('Location: index.php?action=cart&Success_Message=Gi�� hàng của bạn đã trống');
                exit();
            }
            $_SESSION['cart'][$userId] = $userCart;
            header('Location: index.php?action=cart&Success_Message=Sản phẩm đã được cập nhật');
            exit();
        }
    }

    public function Update_Quantity_All_Product_On_Cart()
    {
        $userId = $_SESSION['user']['ID'];
        if (isset($_SESSION['cart'][$userId])) {
            $userCart = &$_SESSION['cart'][$userId]; // Truyền tham chiếu để thay đổi trực tiếp mảng
            foreach ($userCart as $key => $product) {
                $userCart[$key]['Quantity'] = $_POST['quantity'];
                if ($userCart[$key]['Quantity'] <= 0) {
                    unset($userCart[$key]);
                }
            }
            if (empty($userCart)) {
                unset($_SESSION['cart'][$userId]);
                header('Location: index.php?action=cart&Success_Message=Giỏ hàng của bạn đã trống');
                exit();
            }
            $_SESSION['cart'][$userId] = $userCart;

            header('Location: index.php?action=cart&Success_Message=Sản phẩm đã được cập nhật');
            exit();
        }
    }
}
