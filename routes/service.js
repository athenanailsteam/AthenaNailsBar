var express = require('express');
var router = express.Router();
var listServiceSModel = require('../model/list_services');
var listDetailsServicesModel = require('../model/service_detail');
var id;
router.get('/', (req, res) => {
    if (req.query.id != null) {
        id = req.query.id; clearImmediate;
    } else {
        id = 1;
    }
    for (const c of res.locals.lcListServices) {
        if(c.id === +id){
            c.isActive = true;
        }
    }
    console.log(id);
    var d = listDetailsServicesModel.loadServiceDescription('service_detail', id);
    d.then(a => {
        console.log(a);
        res.render('service', {
            layout: 'main',
            serviceDescription: a,
            id: id
        });
    }).catch(err => {
        console.log(err);
    });
});
module.exports = router;