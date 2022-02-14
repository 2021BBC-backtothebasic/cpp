var express = require('express');
var router = express.Router();

const crypto = require('crypto');
const secret = 'Key1$1$234';

const dao = require("./dao");


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


function auth(req, res, next){ //인증
    let id = req.body.id;
    let pw = req.body.pw;
    if(dao.getId(id)==1){
        next();    
    }
    else{
        res.redirect("/");
    }
}

router.post("/login", auth, (req, res)=>{ //로그인
    let id = req.body.id;
    res.send("로그인 성공" +id, {id:id})
});

router.get("/join", (req, res)=>{
    res.render("join") 
});

function joinchk(req, res, next){
    let id = req.body.id;
    let pw1 = req.body.pw;
    let pw2 = req.body.pw2;
    
    if(pw1==pw2){
        if(dao.getId(id)==0){//아이디도 없으면
            const hashed = crypto.createHmac('sha256', secret).update(pw1).digest('hex');
            console.log(hashed); 
            dao.addUser(id, hashed);
        }else{
            res.redirect("/join", {id:id, pw:pw1});
        }
        
    }else if(pw1!=pw2){
        res.redirect("/join");
    }
    
    next();
}

router.post("/addUser",joinchk, (req, res)=>{
    
    res.render("index", {title: "express"})
});

module.exports = router;
