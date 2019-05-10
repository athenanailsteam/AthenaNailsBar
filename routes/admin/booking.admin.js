var express = require('express');
var router = express.Router();
var bookingModel = require('../../model/schedule_book');
router.get('/', (req, res)=>{
    var b = bookingModel.getAllScheduleBook();
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