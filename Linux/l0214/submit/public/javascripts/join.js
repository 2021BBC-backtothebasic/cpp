function frmsubmit(){
    let frm = document.getElementById("frm");
    let add = document.getElementById("addUser");
    
    if(add.onclick()){
        
        frm.action="/addUser";
    frm.method="post";
        frm.submit();
    }else{
        alert("계정 정보를 다시 확인해주세요")
    }
}