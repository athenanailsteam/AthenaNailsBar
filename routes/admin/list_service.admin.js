var express = require('express');
var router = express.Router();
var multer = require('multer');
const path = require('path');
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
var root = path.dirname(require.main.filename);


var storage = multer.diskStorage({
    destination: './publics/img/upload/',
    filename: function(req,file,cb){
        cb(null,file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});
var upload = multer({storage:storage}).single('file');

router.post('/',(req,res) => {
    var s = listAdminServiceModel.getListAdminService();
    s.then(rows =>{
        upload(req,res,(err) => {
            console.log(err);
            if(err)
            {
                res.render('service_admin', {
                    layout: 'main_admin', 
                    services : rows,
                    msg: err
                });
            } else {
                if(req.file == undefined){
                    res.render('service_admin', {
                        layout: 'main_admin', 
                        services : rows,
                        msg: 'Error: No File Selected!'
                    });
                } else {
                    res.render('service_admin', {
                        layout: 'main_admin', 
                        services : rows,
                        msg: 'File Uploaded!'
                    });
                }
            }
            console.log(err);
        })
    });

});

