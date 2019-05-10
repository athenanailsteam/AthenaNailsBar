var express = require('express');
var router = express.Router();
var bookingModel = require('../../model/booking.admin');
router.get('/', (req, res)=>{
    var b = bookingModel.all();
    b.then(rows =>{
        console.log(rows);
        res.render('schedule_appointment', {
            layout: 'main_admin', 
            booking : rows
        });
    }).catch(err =>{
        console.log(err);
    });
});

module.exports = router;