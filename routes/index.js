var express = require('express');
var router = express.Router();

router.get('/', (req, res)=>{
    res.render('home', {layout: 'main'});
});
router.get('/contact', (req, res)=>{
    res.render('contact_us', {layout: 'main'});
});

router.get('/aboutus', (req, res)=>{
    res.render('about_us', {layout: 'main'});
});

router.get('/services', (req, res)=>{
    res.render('service', {layout: 'main'});
});

module.exports = router;