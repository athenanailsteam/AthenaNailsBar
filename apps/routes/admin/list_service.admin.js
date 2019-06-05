var express = require('express');
var router = express.Router();
var listAdminServiceModel = require('../../model/list_services');
var app = express.Router();
var multer = require('multer');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './publics/img/upload/');
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    }
})

var upload = multer({ storage });

app.post('/upload', (req, res, next) => {
    upload.array('fuMain')(req, res, err => {
        if (err) {
            console.log(err);
            return res.json({
                error: err.message
            });
        }

        res.json({});
    })
})

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
