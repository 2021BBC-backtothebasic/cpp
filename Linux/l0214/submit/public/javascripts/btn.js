
function sbmt(){
    let frm = document.getElementById("frm");
    let login = document.getElementById("login");
    let join = document.getElementById("join");

    if(join.onclick()){
        alert("get join")
        frm.action="/join";
    frm.method="GET";
        frm.submit();
    }
    else if(login.onclick()){
        alert("get login")
        frm.action="/login";
        frm.method="post";
        frm.submit();
    }else{ alert("repeat"); return ;}
    
}