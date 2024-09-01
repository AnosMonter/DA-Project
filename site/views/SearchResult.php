<div class="Background-All">
    <div class="container">
        <div class="Title" style="color: yellowgreen;">
            <h1>Kết Quả Tìm Kiếm Các Sản Phẩm Có "<?php echo $Key_Search; ?>"</h1>
        </div>
        <div class="Product-Page-Products-Frame">
            <?php
            $Product = '';
            foreach ($List_Products as $Pro) {
                $Product .= '
                        <a href="index.php?action=products&product-action=detail&id=' . $Pro['ID'] . '" class="Product-Page-Product">
                            <img src="public/img/Products/' . $Pro['Image'] . '" alt="">
                            <h2>' . $Pro['Name'] . '</h2>
                            <p><del>' . number_format($Pro['Price']) . ' VNĐ </del> <br>' . number_format(($Pro['Price']) - ($Pro['Price'] * $Pro['Sale']) / 100, 0, ',', '.') . ' VNĐ </p>
                    </a>
                    ';
            }
            echo $Product;
            ?>
        </div>
    </div>
</div>