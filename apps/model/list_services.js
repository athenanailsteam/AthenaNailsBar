var db = require("../../utils/db");
function addListService(entity){
    return db.add('list_services', entity);
}
function updateListService(idField,entity){
    return db.update('list_services',idField, entity);
}
module.exports = {
   findAll: () => {
       return db.findAll('list_services');
   },
   addListService: addListService,
   updateListService: updateListService,

}