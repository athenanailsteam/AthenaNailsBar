var db = require("../utils/db");

function addScheduleBook(entity){
    return db.add('schedule_booking', entity);
}

module.exports = {
    getAllScheduleBook: () => {       
        return db.findAll('schedule_booking');      
    },
    addScheduleBook: addScheduleBook
};