/* app.js */
const express = require("express");
const bodyParser = require("body-parser");
const rpcMethods = require("./routes/api");

var app = express();
var apis = require("./routes/api.js");
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use("/", rpcMethods);

var request = require("request");

const dotenv = require("dotenv");
dotenv.config();

const USER = process.env.RPC_USER;
const PASS = process.env.RPC_PASSWORD;
const PORT = 9776;
const ACCOUNT = "kbpark";
const ID_STRING = "kigacoin_id";
const headers = {
	"content-type": "text/plain;" // ; 필수
};

app.set("view engine", "pug");
app.get("/", (req, res)=>{
	res.render("index");
});


app.listen(3000, ()=>{
	console.log(`litecoin API Tutorial is running at http://localhost:3000/`);
});
