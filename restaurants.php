<?php

$connection = mysqli_connect("sql12.freemysqlhosting.net", "sql12200828", "nX2XUeRkSK", "sql12200828");

$search_query = $_REQUEST['q'];
$query_result = $connection->query("SELECT * FROM restaurants WHERE name LIKE '%$search_query%' ");

$restaurants = [];
// looping semua data hasil query

while ($data = $query_result->fetch_assoc()) {
	$restaurants[] = $data;
}

header('Content-Type: application/json');
print json_encode($restaurants);

?>