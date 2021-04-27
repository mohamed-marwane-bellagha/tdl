function inscription() {
    console.log($("form").is(':empty'))
    let email = $("#email").val();
    let login = $("#login").val();
    let password = $("#password").val();
    let cpassword = $("#cpassword").val();
    var specialchars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    var number = /[0-9]/;
    if (email.length < 6 || login.length < 6 || password.length < 6 || cpassword.length < 6) {
        if ($("#alertlength").length == 0) {
            $("form").append("<p id='alertlength'> Un ou plusieurs champs sont trop courts</p>")
            checklength=false
        }
    } else {
        $("#alertlength").empty()
        checklength=true

    }
    if (email.includes('@') == false) {
        if ($('#alertinputmail').length == 0) {
            $('#containerEmail').append("<p id='alertinputmail'>Email pas au bon format</p>");
            checkemail= false
        }
    } else {
        let emailsplit = email.split('@')
        if (emailsplit[1].includes('.') == false) {
            if ($('#alertinputmail').length == 0) {
                $('#containerEmail').append("<p id='alertinputmail'>Email pas au bon format </p>");
            }
            checkemail = false
        }else{
            $('#alertinputmail').empty()
            checkemail=true
        }
    }
    if (specialchars.test(password) == false) {
        if ($('#alertinputpassword').length == 0) {
            $('#containerPassword').append("<p id='alertinputpassword'>Votre password doit contenir un caractere special</p>");
        }
        checkpassword = false
    } else {
        $('#alertinputpassword').empty();
        checkpassword = true
    }
    if(number.test(password)==false){
        if($('#alertinputpassword').length==0){
        $('#containerPassword').append("<p id='alertinputpassword'>Votre password doit contenir un chiffre</p>");
        checkpassword=false
    }
    }else{
        $('#alertinputpassword').empty();
        checkpassword=true
    }
    if (cpassword != password) {
        if ($('#alertinputCpassword').length == 0) {
            $('#containerCPassword').append("<p id='alertinputcpassword'>Password ne correspondent pas</p>");
        }
        checkcpassword = false
    } else {
        $('#alertinputcpassword').empty();
        checkcpassword = true

    }
    console.log("check password:"+checkpassword);
    console.log("check cpassword:"+checkcpassword);
    console.log("check email:"+checkemail);
    if(checkpassword== true && checkcpassword==true && checkemail==true && checklength){
        $.ajax({
            type: "POST",
            url: "ajax.php",
            data: {
                mail:email,
                username:login,
                mdp:password
            },
            dataType: "text",
        }).done(function(data){
            if(data==''){
                $("form").append("<p id='loginpris'>Le login "+login+" est déja pris</p>")
            }else{
                $("form").empty()
                console.log($("form").is(':empty'))
                if($("form").is(':empty')){
                    $.ajax({
                        type:"GET",
                        url:"connexion.html",
                        dataType:"text",
                    }).done(function(data){
                        $('form').append(data)
                    });
                }
            }
        });
    }
    if($("form").is(':empty')){
        console.log('caca')
        $("form").append("<div class='containerinput id='containerLogin'><label for='login'>Login :</label><input type='text' name='login' id='login'></div><div class='containerinput'id='containerPassword'><label for='password'></label><input type='password' name='password' id='password'></div><button type='button' name='submit id='submit'></button>");  
    }
};
$('#inscriptionlink').click(function(){
    $('form').empty()
    $.ajax({
        type:"GET",
        url:"inscription.html",
        dataType:"text",
    }).done(function(data){
        $('form').append(data)
    });
})
$('#connexionlink').click(function(){
    $('form').empty()
    $.ajax({
        type:"GET",
        url:"connexion.html",
        dataType:"text",
    }).done(function(data){
        $('form').append(data)
    });
})
$('#submitconnexion').click(function(){
    let inputval=$('#loginconnexion').val()
    console.log(inputval)
})
function connexion () {
    let loginconnexion=document.getElementById('loginconnexion').value;
    let mdpconnexion=document.getElementById('passwordconnexion').value;
    if(loginconnexion.length>6 && mdpconnexion.length>6){
        $.ajax({
            type:"POST",
            url:"ajax.php",
            data:{
                usernamelogin:loginconnexion,
                passwordconnexion:mdpconnexion,
            },
            dataType:"text",
        }).done(function(data){
            if(data.length==0){
                window.location.href='todolist.php'
            }
            
        })

    }    
}
function ajoutTache(){
    let tache=$("#tache").val();
    if(tache.length>0){
        $.ajax({
            type:"POST",
            url:"ajax.php",
            data:{
                tache:tache,
            },
            dataType:"text",
        }).done(function(data){
            let dataparsed=JSON.parse(data)
            console.log(dataparsed[0].description)
            $("#afaire").append("<div class='card' id='containerTask"+dataparsed[0].id+"'><div class='card-body'><form><input class='form-check-input' type='checkbox' id='closeTaskCheckBox"+dataparsed[0].id+"' name='closed' onclick='closeTask("+dataparsed[0].id+")'></form><p class='card-title' id='description"+dataparsed[0].id+"'>"+dataparsed[0].description+"<p class='card-subtitle mb-2 text-muted'>Commencé le : "+dataparsed[0].date_debut+"</div></div>")
        })
    }
}

function closeTask(id){
    let isChecked = $('#closeTaskCheckBox'+id).is(':checked');
    $.ajax({
        type:"POST",
        url:"ajax.php",
        data:{
            idTask:id,
            check:isChecked,
        },
        dataType:"text",
    }).done(function(data){
        let datefin;
        if(data.length>0){
            console.log("entre ici");
        let dataParsed=JSON.parse(data);
        datefin=dataParsed[0].date_fin
        }
        let isafaire = $('#containerTask' + id).parent().attr('id') == 'afaire';
        if(isafaire){
            $("#terminees").append($('#containerTask' + id));
            $('#containerTask' + id).append("<p  class='card-subtitle mb-2 text-muted' id=dateFin"+id+">Terminé le : "+datefin+"</p>");
            if($("#closeTaskCheckBox"+ id).is( ':checked' )){
                $("#closeTaskCheckBox"+ id).prop("checked", false)
            }

        } else if($('#containerTask' + id).parent().attr('id') == 'terminees'){
            $("#afaire").append($("#containerTask" + id));
            $("#dateFin"+ id).remove()
            if($("#closeTaskCheckBox"+ id).is( ':checked' )){
                $("#closeTaskCheckBox"+ id).prop("checked", false)
            }  
        }
        
    })
}