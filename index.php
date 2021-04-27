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
<main>
    <?php 
    session_start();
    if(isset($_SESSION['user'])){
        echo '<h1>Bonjour '.$_SESSION['user']."</h1>";
    }else{

 
    
    ?>
<form>

</form>
<!-- <form method='post'>
<div class='containerinput' id='containerEmail'>
<label for='email'>Email :
</label>
<input type='email' name='email' id='email'>
</div>
<div class='containerinput' id='containerLogin'>
<label for='login'>Login :
</label>
<input type='text' name='login' id='login'>
</div>
<div class='containerinput' id='containerPassword'>
<label for='password'>Mot de passe :
</label>
<input type='password' name='password' id='password'>
</div>
<div class='containerinput' id='containerCPassword'>
<label for='cpassword'> Confirmer le Mot de Passe :
</label>
<input type='password' name='password' id='cpassword'>
</div>
<button type='button' name='submit' id='submit'>S'inscrire</button>
</form> -->
<div>
<button class="btn btn-primary"  id='inscriptionlink'>Inscription</button>
<button class="btn btn-primary" id='connexionlink'>Connexion</button>
<div>
<?php    }?>
</main>  
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src='script.js'></script>
</html>