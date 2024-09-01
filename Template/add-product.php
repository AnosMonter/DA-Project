<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
</head>
<body>
    <form action="" method="post">
        <label for="">
            <p>Name Product</p>
            <input type="text" name="Name_Product" id="">
        </label>
        <label for="">
            <p>Price Product</p>
            <input type="number" name="Price_Product" id="">
        </label>
        <label for="">
            <p>Image</p>
            <input type="file" name="Image_Product" id="">
        </label>
        <label for="">
            <p>More Image</p>
            <input type="file" name="More_Image_Product[]" multiple id="">
        </label>
        <input type="submit" value="Add Product" name="Sub">
    </form>
</body>
</html>

<?php 
if (isset($_POST['Sub'])){
    $Name_Product = $_POST['Name_Product'];
    $Price_Product = $_POST['Price_Product'];
    $Image_Product = $_FILES['Image_Product']['name'];
    $More_Image_Product = $_FILES['More_Image_Product'];
    
    // Upload Image
    $target_dir = "uploads/";
    $target_file = $target_dir. basename($Image_Product);
    move_uploaded_file($_FILES["Image_Product"]["tmp_name"], $target_file);
    
    // Upload More Image
    $filecount = 1;
    foreach ($More_Image_Product as $key => $value) {
        $target_file = $target_dir.'sanpham'.$value['name'] . pathinfo($value);
        if (move_uploaded_file($value['tmp_name'], $target_file) == true ){};
    }
    
}
?>