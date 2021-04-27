<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title>Document</title>
</head>
<body>
    <?php session_start();
   if (isset($_POST['disconnect'])){
       session_destroy();
   }


    if(isset($_SESSION['user'])){
        if (isset($_POST['disconnect'])){
            session_destroy();
        }?>
<form method='post'>
<label class="form-label" for='tache'>Ajouter une tâche</label>
<textarea class="form-control" id='tache' name='tache'></textarea>
<button class="btn btn-primary" type="button" onclick='ajoutTache()'>Ajouter Tache</button>
</form>
<div id='afaire'>
<?php 
$db=new PDO('mysql:host=localhost;dbname=todo', 'root', '');
$query=$db->prepare("SELECT * FROM `tache` WHERE `id_utilisateur`='{$_SESSION['userid']}' AND `statut`=0");
$query->execute();
$allresult=$query->fetchAll();
echo "<h2>Tache a faire</h2>";
for($i=0;isset($allresult[$i]);$i++){
?>
<div  class="card" id='containerTask<?=$allresult[$i]['id']?>'>
<div class='card-body'>
<form>
    <input class="form-check-input" type='checkbox' id='closeTaskCheckBox<?=$allresult[$i]['id']?>' name='closed' onclick="closeTask(<?=$allresult[$i]['id']?>)">
</form>
<p class="card-title"  id='description<?=$allresult[$i]['id']?>'><?=$allresult[$i]['description']?>
<p class="card-subtitle mb-2 text-muted">Commencé le : <?=$allresult[$i]['date_debut']?>
</div>
</div>
   <?php }
   $query=$db->prepare("SELECT * FROM `tache` WHERE `id_utilisateur`='{$_SESSION['userid']}' AND `statut`=1");
   $query->execute();
   $allresult=$query->fetchAll();
   echo "</div><div id='terminees'><h2>Tache Terminées</h2>";
   for($i=0;isset($allresult[$i]);$i++){
   ?>
   <div  class="card" id='containerTask<?=$allresult[$i]['id']?>'>
   <div class="card-body">
<form>
    <input class="form-check-input" type='checkbox' id='closeTaskCheckBox<?=$allresult[$i]['id']?>' name='closed' onclick="closeTask(<?=$allresult[$i]['id']?>)">
</form>
<p class="card-title"><?=$allresult[$i]['description']?>
<p class="card-subtitle mb-2 text-muted" >Commencé le : <?=$allresult[$i]['date_debut']?>
<p class="card-subtitle mb-2 text-muted" id='dateFin<?=$allresult[$i]['id']?>'>Terminé le : <?=$allresult[$i]['date_fin']?>
</div>
</div>

    <?php }?>
</div>
<form method='post' action='todolist.php'>
<input class="btn btn-primary" type='submit' name='disconnect' value='Deconnectez-Moi'>   
</form>
    <?php }else{  
        header("Location:index.php");
    }
    ?>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src='script.js'></script>
</html>