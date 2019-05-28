var express = require('express');
var router = express.Router();
var listDetailsAdminServicesModel = require('../../model/service_detail');
var id;
router.get('/', (req, res) => {
    if (req.query.id != null) {
        id = req.query.id; clearImmediate;
    } else {
        id = 1;
    }
    var d = listDetailsAdminServicesModel.loadServiceDescription('service_detail', id)
    d.then(a => {
        console.log(a);
        res.render('admin/service_detail_admin', {
            layout: 'layouts/main_admin',
            servicesDetail: a,
            id: id
        });
    }).catch(err => {
        console.log(err);
    });
});
module.exports = router;