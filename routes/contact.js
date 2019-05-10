var express = require('express');
var router = express.Router();

router.get('/', (req, res)=>{
    res.render('contact_us', {layout: 'main'});
});
module.exports = router;