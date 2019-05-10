var express = require('express');
var router = express.Router();

router.use("/", require('./home'));
router.use("/contact", require('./contact'));
router.use("/aboutus", require('./aboutus'));
router.use("/services", require('./service'));

router.use("/admin", require('./admin/index'));


module.exports = router;