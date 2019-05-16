var express = require('express');
var router = express.Router();
var listAdminServiceModel = require('../../model/list_service.admin');
router.get('/', (req, res)=>{
    var s = listAdminServiceModel.getListAdminService();
    s.then(rows =>{
        console.log(rows);
        res.render('service_admin', {
            layout: 'main_admin', 
            services : rows
        });
    }).catch(err =>{
        console.log(err);
    });
});
module.exports = router;