var express = require('express');
var router = express.Router();

router.get('/', (req, res)=>{
    res.render('schedule_appointment', {layout: 'main_admin'});
});

module.exports = router;