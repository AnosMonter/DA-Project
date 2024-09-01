<form action="admin.php?Admin_Action=users&User_Action=edit" method="post">
    <label for="">
        <p>ID: <?php echo isset($Profile[0]['ID'])? $Profile[0]['ID']:'' ?></p>
        <p>UserName: <?php echo isset($Profile[0]['Username'])? $Profile[0]['Username']:'' ?></p>
        <p>Name: <?php echo isset($Profile[0]['Name'])? $Profile[0]['Name']:'' ?></p>
        <p>Email: <?php echo isset($Profile[0]['Email'])? $Profile[0]['Email']:'' ?></p>
        <p>Phone: <?php echo isset($Profile[0]['Phone'])? $Profile[0]['Phone']:'' ?></p>
        <input type="hidden" value="<?php echo isset($Profile[0]['ID'])? $Profile[0]['ID']:'' ?>" name="ID">
    </label>
    <label for="Sta-Select">
        <select name="Status" id="Sta-Select" required>
            <?php if (isset($Profile[0]['Status'])) {
                echo $Profile[0]['Status'] == 0 ? '<option value="0" selected>Active</option>' : '<option value="0">Active</option>';
                echo $Profile[0]['Status'] == 1? '<option value="1" selected>Deactive</option>' : '<option value="1">Deactive</option>';
            } ?>
        </select>
    </label>
    <label for="Role-Select">
        <select name="Role" id="Role-Select" required>
            <?php if (isset($Profile[0]['Role'])){
                echo $Profile[0]['Role'] == 0? '<option value="0" selected>Admin</option>' : '<option value="0">Admin</option>';
                echo $Profile[0]['Role'] == 1? '<option value="1" selected>Manager</option>' : '<option value="1">Manager</option>';
                echo $Profile[0]['Role'] == 2? '<option value="2" selected>User</option>' : '<option value="2">User</option>';
            } ?>
        </select>
    </label>
    <input type="submit" name="Sub-Edit" value="Update">
</form>