<?php

session_start();
include "db.php";
/* include "process_payment.php"; */
// initializing a client url which we will be used to send the reference to the paystack server for verification
$curl = curl_init();

// setting the options for the curl session including the url, headers, timeout, etc
/* curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.paystack.co/transaction/verify/{$_GET['reference']}",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: sk_live_497a3a223893acf3ff8ecfd4dce1158b2fc9b088",
    "Cache-Control: no-cache",
  ),
));


// get the response and store
$response = curl_exec($curl);
// if there are any errors
$err = curl_error($curl);
// close the session
curl_close($curl);

// convert the response to PHP object
$decodedResponse = json_decode($response);


// checking  if verification was successful
if (isset($decodedResponse->data->status) && $decodedResponse->data->status === 'success') {
  // get form values
  $email = $_GET['email'];
  $total_amt = $_GET['total_amt'];
  $invoice = mt_rand(1000, 10000);
  $expdate = $_GET['expdate'];
  $reference = $_GET['reference'];
  $user_id=$_SESSION['uid'];
  $status = "Not fulfil"; */
  
if (isset($_SESSION['uid'])) {

  
	$email = $_POST['email'];
	$address = $_POST['address'];
   
    $state = $_POST['state'];
   
    $expdate= $_POST['expdate'];
   
    $user_id=$_SESSION["uid"];
   
    $total_count=$_POST['total_count'];
    $prod_total = $_POST['total_price'];
    $product_id=$_POST["product_id"];
   

    
    $sql0="SELECT order_id from `orders_info`";
    $runquery=mysqli_query($con,$sql0);
    if (mysqli_num_rows($runquery) == 0) {
        echo( mysqli_error($con));
        $order_id=1;
    }else if (mysqli_num_rows($runquery) > 0) {
        $sql2="SELECT MAX(order_id) AS max_val from `orders_info`";
        $runquery1=mysqli_query($con,$sql2);
        $row = mysqli_fetch_array($runquery1);
        $order_id= $row["max_val"];
        $order_id=$order_id+1;
        echo( mysqli_error($con));
    }

	$sql = "INSERT INTO `orders_info` (`order_id`,`user_id`, `email`, `expdate`,`total_amt`) VALUES ('$order_id', '$user_id', '$email', '$expdate', '$total_amt')";
  
    if(mysqli_query($con,$sql)){
        $i=1;
        $prod_id_=0;
        $prod_price_=0;
        $prod_qty_=0;
       /*  $total_count=0; */
       /*  $total_count=$_POST['total_count'];
        $prod_total = $_POST['total_price'];  */
        while($i<=$total_count){
            $str=(string)$i;
            $prod_id_+$str = $_POST['prod_id_'.$i];
            $prod_id=$prod_id_+$str;		
            $prod_price_+$str = $_POST['prod_price_'.$i];
            $prod_price=$prod_price_+$str;
            $prod_qty_+$str = $_POST['prod_qty_'.$i];
            $prod_qty=$prod_qty_+$str;
            $sub_total=(int)$prod_price*(int)$prod_qty;
            $sql1="INSERT INTO `order_products` 
            (`order_pro_id`,`order_id`,`product_id`,`qty`,`amt`) 
            VALUES (NULL, '$order_id','$prod_id','$prod_qty','$sub_total')";
            if(mysqli_query($con,$sql1)){
                $del_sql="DELETE from cart where user_id=$user_id";
                if(mysqli_query($con,$del_sql)){
                     echo"<script>window.location.href='payment_success.php'</script>"; 
                    /* header("Location: payment_success.php"); */
                }else{
                    echo(mysqli_error($con));
                }

            }else{
                echo(mysqli_error($con));
            }
            $i++;


        }
    }else{

        echo(mysqli_error($con));
        
    }
    
}else{
     echo"<script>window.location.href='payment_success.php'</script>"; 
  /*   header("Location: payment_success.php"); */
}


   


?>