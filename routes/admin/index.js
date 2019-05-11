var express = require('express');
var router = express.Router();

router.use("/booking", require('./booking.admin'));

module.exports = router;
