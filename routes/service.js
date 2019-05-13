var express = require('express');
var router = express.Router();
var listServiceSModel = require('../model/list_services');
var listDetailsServicesModel = require('../model/service_detail');
var id;
router.get('/', (req, res)=>{  
    if(req.query.id != null){
        id = req.query.id; clearImmediate    
    }else{
        id = 1;
    }
    console.log(id);
    var l = listServiceSModel.findAll();
    var d = listDetailsServicesModel.loadServiceDescription('service_detail', id);
    l.then(a =>{
        d.then(b =>{
            res.render('service', {
                layout: 'main',
                listServices: a,
                serviceDescription: b
            });
        }).catch(err =>{
            console.log(err);
        });

    }).catch(err => {
        console.log(err);
    });
});

module.exports = router;