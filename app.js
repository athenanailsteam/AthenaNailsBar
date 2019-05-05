var express = require('express');
var app = express();
var path = require('path');
var index = require('./routes/index');
var admin = require('./routes/admin/index');
var config = require('./config/config');
var port = process.env.PORT|| config.port;
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//static folder
app.use(express.static(__dirname + '/publics'));
app.use(express.static(__dirname + '/publics/js/default-assets'));

app.use(index);
app.use(admin);

// ****************************
// Move JS Files to src/js
// ****************************
app.use('/publics/js', express.static(__dirname + '/node_modules/bootstrap/dist/js')); // redirect bootstrap JS
app.use('/publics/js', express.static(__dirname + '/node_modules/jquery/dist')); // redirect JS jQuery
app.use('/publics/js', express.static(__dirname + '/node_modules/popper.js/dist/umd'));
app.use('/publics/js', express.static(__dirname + '/node_modules/owl.carousel2/dist'));
app.use('/publics/css', express.static(__dirname + '/node_modules/owl.carousel2/dist/assets'));

app.listen(port, ()=>{
    console.log('app is listening at %d', port);
})