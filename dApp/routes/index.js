var express = require('express');
var formidable = require('formidable');
const swarm = require("swarm-js").at("http://localhost:8500/");

var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/DP0init', function(req, res, next) {
  res.render('DP0init', { title: 'Express' });
});

router.get('/DP1medi_find', function(req, res, next) {
  res.render('DP1medi_find', { title: 'Express' });
});

router.get('/DP2medi_chart', function(req, res, next) {
  res.render('DP2medi_chart', { p1addr: req.query.p1addr });
});

router.get("/DP2medi_upload", function(req, res, next) {
  res.render("DP2medi_upload", { p1addr: req.query.p1addr , name: req.query.name, birth: req.query.birth});
});

router.post("/upload", function(req, res, next) {
  var form = new formidable.IncomingForm();
  form.uploadDir = "./upload";
  form.keepExtensions = true;
  form.parse(req, function(err, fields, files) {
    //files.file.path; // "upload_8821f71e276ff01319da109af1fc60a6.png"
    swarm.upload({
      path: files.file.path,      // path to data / file / directory
      kind: "file"}) // optional, and only for kind === "directory"
      .then(hash => {
        console.log("Uploaded file. Address:", hash);
        res.render("upload", { hash: hash });
      })
      .catch(console.log);

  });
});

router.get('/DP3claim_issue', function(req, res, next) {
  res.render('DP3claim_issue', { title: 'Express' });
});

router.get('/DP4claim_doctran', function(req, res, next) {
  res.render('DP4claim_doctran', { title: 'Express' });
});

router.get('/DP5claim_list', function(req, res, next) {
  res.render('DP5claim_list', { title: 'Express' });
});

module.exports = router;
