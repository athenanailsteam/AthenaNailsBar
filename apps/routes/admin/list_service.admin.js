var express = require('express');
var router = express.Router();
var multer = require('multer');
const path = require('path');
var listAdminServiceModel = require('../../model/list_services');
router.get('/', (req, res) => {
    var s = listAdminServiceModel.findAll();
    s.then(rows => {
        console.log(rows);
        res.render('admin/service_admin', {
            layout: 'layouts/main_admin',
            services: rows,
        });
    }).catch(err => {
        console.log(err);
    });
});

var storage = multer.diskStorage({
    destination: './publics/img/upload/',
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    }
});
var upload = multer({ storage: storage }).single('file');
router.post('/', (req, res) => {
    var s = listAdminServiceModel.findAll();
    s.then(rows => {
        upload(req, res, (err) => {
            var filename = path.basename(req.file.path);
            var dir = './img/upload/' + filename;
            console.log(dir);
            if (err) {
                req.flash('error', 'No File Selected');
                res.render('admin/service_admin', {
                    layout: 'layouts/main_admin',
                    services: rows,
                });
            } else {
                req.flash('success', 'File Uploaded!');
                res.render('admin/service_admin', {
                    layout: 'layouts/main_admin',
                    services: rows,
                });
            }
        })
    }).catch(err => {
        console.log(err);
    });

});
router.get('/edit', (req, res) => {
    console.log(req.query.id);
    res.render('admin/edit_services_admin', {
        layout: 'layouts/main_admin',
    });
});
router.get('/add', (req, res) => {
    res.render('admin/add_services_admin', {
        layout: 'layouts/main_admin',
    });
});
module.exports = router;
