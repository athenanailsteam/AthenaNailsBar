var db = require("../utils/db");

module.exports = {
    getAllScheduleBook: () => {       
        return db.findAll(schedule_booking);      
    }
};