<?php 
$db=new PDO('mysql:host=localhost;dbname=todo', 'root', '');
if(isset($_POST['mail'])){
    $mail=htmlspecialchars(trim($_POST['mail']));
    $login=htmlspecialchars(trim($_POST['username']));
    $password=htmlspecialchars(trim($_POST['mdp']));
    $cryptedpass=password_hash($password,PASSWORD_BCRYPT);
    $query=$db->prepare("SELECT * FROM `utilisateur` WHERE `login`='{$login}'");
    $query->execute();
    $allresult=$query->fetchAll();
    if($allresult==null){
    $query=$db->prepare("INSERT INTO `utilisateur`(`email`, `login`, `password`) VALUES ('{$mail}','{$login}','{$cryptedpass}')");
    $query->execute();
    echo 'Inscription Reussie';
    }
}
// var_dump($_POST);
if(isset($_POST['usernamelogin'])){
    $login=htmlspecialchars(trim($_POST['usernamelogin']));
    $password=htmlspecialchars(trim($_POST['passwordconnexion']));
    $query=$db->prepare("SELECT * FROM `utilisateur` WHERE `login`='{$login}'");
    $query->execute();
    $allresult=$query->fetchall();
    if(count($allresult)==0){
        echo "Inscrivez-vous d'abord";
    }else{
        if(password_verify($password,$allresult[0]['password'])){
            session_start();
           $_SESSION['user']=$login;
           $_SESSION['userid']=$allresult[0]['id'];
        }else{
            echo "Mot de Passe incorrect";
        }
    }
}
if(isset($_POST['tache'])){
    $tache=htmlspecialchars(trim($_POST['tache']));
    $date=date("Y/m/d H:i:s");
    session_start();
    $query=$db->prepare("INSERT INTO `tache`(`description`, `date_debut`,`statut`, `id_utilisateur`) VALUES ('{$tache}','{$date}',0,'{$_SESSION['userid']}')");
    $query->execute();
    $query=$db->prepare("SELECT * FROM `tache` WHERE `description`='{$tache}'");
    $query->execute();
    $allresult=$query->fetchAll();
    echo json_encode($allresult);

}
if(isset($_POST['idTask'])){
    $idTask=htmlspecialchars(trim($_POST['idTask']));
    $isChecked=htmlspecialchars(trim($_POST['check']));
    $query=$db->prepare("SELECT * FROM `tache` WHERE `id`='{$idTask}'");
    $query->execute();
    $allresult=$query->fetchAll();
    if($allresult[0]['statut']==0){
       if($isChecked=='true'){
        $date=date("Y/m/d H:i:s");
        $query=$db->prepare("UPDATE `tache` SET `date_fin`='{$date}',`statut`=1 WHERE `id`='{$idTask}'");
        $query->execute();
        $query=$db->prepare("SELECT * FROM `tache` WHERE `id`='{$idTask}'");
        $query->execute();
        $allresult=$query->fetchAll();
        echo json_encode($allresult);
    }else{
      
        $query=$db->prepare("UPDATE `tache` SET`statut`=0 WHERE `id`='{$idTask}'");
        $query->execute();
    }
}else{
    if($isChecked=='true'){
        $query=$db->prepare("UPDATE `tache` SET`statut`=0 WHERE `id`='{$idTask}'");
        $query->execute();
    }else{
        $date=date("Y/m/d H:i:s");
        $query=$db->prepare("UPDATE `tache` SET `date_fin`='{$date}',`statut`=1 WHERE `id`='{$idTask}'");
        $query->execute();
        $query=$db->prepare("SELECT * FROM `tache` WHERE `id`='{$idTask}'");
        $query->execute();
        $allresult=$query->fetchAll();
        echo json_encode($allresult);
    }
}
}
?>