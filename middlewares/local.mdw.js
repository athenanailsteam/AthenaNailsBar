var listServicesModel = require('../model/list_services');

module.exports = (req, res, next) => {
    listServicesModel.findAll().then(rows =>{
        res.locals.lcListServices = rows;
        next();
    })
}