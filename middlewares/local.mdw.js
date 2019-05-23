var servicesDB = require('../model/list_services');
var employeesDB = require('../model/employees');

module.exports = (req, res, next) => {
    servicesDB.findAll().then(rows =>{
        res.locals.lcListServices = rows;
    }).catch(err => {
        console.log(err);
    })

    employeesDB.findAll().then(rows =>{
        res.locals.lcListEmployees = rows;
        next();
    }).catch(err => {
        console.log(err);
    });    
}