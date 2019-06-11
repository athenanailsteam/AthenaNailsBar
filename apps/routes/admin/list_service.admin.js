var express = require('express');
var router = express.Router();
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
var multer = require('multer');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './publics/img/upload');
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    }
})

var upload = multer({ storage });

router.post('/upload', (req, res, next) => {
    upload.single('fuMain')(req, res, err => {
        var filename = path.basename(req.file.path);
        var dir = './img/upload/' + filename;
        console.log(dir);
        if (err) {
            return res.json({               
                error: err.message
            });
        }
        else {
            return res.send(dir);
            return res.render({dir: dir});
            return res.json({dir:dir})
        }

    })
})
router.post("/add", (req, res) => {
    var entity = req.body;
    if (entity) {
        var rs = listAdminServiceModel.addListService(entity);
        rs.then(row => {
            console.log("Add service success");
            res.json(row.insertId);
        }).catch(err => {
            console.log('Add service failed cause: ' + err);
        });
    }
})
module.exports = router;
