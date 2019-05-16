var express = require('express');
var router = express.Router();
var listDetailsAdminServicesModel = require('../../model/service_details.admin');
var id;
router.get('/', (req, res) => {
    if (req.query.id != null) {
        id = req.query.id; clearImmediate;
    } else {
        id = 1;
    }
    console.log(id);
    var d = listDetailsAdminServicesModel.loadServiceDescription('service_detail', id);
    d.then(a => {
        console.log(a);
        res.render('service_detail_admin', {
            layout: 'main_admin',
            servicesDetail: a,
            id: id
        });
    }).catch(err => {
        console.log(err);
    });
});
module.exports = router;