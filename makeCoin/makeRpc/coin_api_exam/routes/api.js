/* routsapi.js */

const express = require("express");
const router = express.Router();

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
const URL= "https://awsmake-iflto.run.goorm.io"
router.get("/test", (req, res)=>{res.json({msg: "backend works"})});
router.get("/getblockcount", (req, res)=>{
	let dataString = `{ "jsonrpc":"1.0", "id": ${ID_STRING}", "method": "getblockcount", "params":[]"}`
	let options = {
		url:`http://${USER}:${PASS}@${URL}:${PORT}`,
		method: "POST",
		headers: headers,
		body: dataString
	}

	callback = (error, response, body) =>{
		if(!err && response.statusCode == 200){
			const data = JSON.parse(body);
			res.send(data);
		}
	};
	request(options, callback);
});

router.get("/stop_result", (req, res)=>{
	let dataString = `{ "jsonrpc":"1.0", "id": ${ID_STRING}", "method": "stop", "params":[]}`
	let options = {
		url:`http://${USER}:${PASS}@{URL}:${PORT}`,
		method: "POST",
		headers: headers,
		body: dataString
	}

	callback = (error, response, body) =>{
		if(!err && response.statusCode == 200){
			const data = JSON.parse(body);
			res.send(data);
		}
	};
	request(options, callback);
});
module.exports = router;
