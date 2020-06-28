<?php
$servername = "localhost";
    $username = "root";
    $password = "";

$dbname = "employee";
    // Create connection
    $conn = mysqli_connect($servername, $username, $password);
    


// Create connection

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql= 'SELECT * FROM productmodel'

$result = mysqli_query($conn, $sql);

$display = mysqli_fetch_all($result, MYSQLI_ASSOC); 

mysqli_free_result($result);

print_r($display);

$conn->close();
?>

<!DOCTYPE html>
<html>

	<h4 class="center grey-text">Pizzas!</h4>

	<div class="container">
		<div class="row">

			<?php foreach($display as $pizza){ ?>

				<div class="col s6 md3">
					<div class="card z-depth-0">
						<div class="card-content center">
							<h6><?php echo htmlspecialchars($pizza['title']); ?></h6>
							<div><?php echo htmlspecialchars($pizza['ingredients']); ?></div>
						</div>
						<div class="card-action right-align">
							<a class="brand-text" href="#">more info</a>
						</div>
					</div>
				</div>

			<?php } ?>

		</div>
	</div>


</html>

