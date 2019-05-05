/**
 * Module dependencies.
 */
var express = require('express');
var router = express.Router();

router.get('/admin', (req, res)=>{
    res.render("../views/admin/admin");
});

module.exports = router;