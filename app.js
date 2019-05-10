var express = require('express');
var exphbs = require('express-handlebars');
var index = require('./routes/index');

var port = process.env.PORT|| 3000;

var app = express();

app.engine('hbs', exphbs({
    extname: 'hbs',
    defaultLayout: 'main',
    layoutsDir: __dirname + '/views/layouts/',
    partialsDir: [
        'views/admin',
        'views/client'
    ]
})
);

app.set('view engine', 'hbs');

//static folder
app.use(express.static(__dirname + '/publics'));

app.use('/',index);

app.listen(port, function () {
    console.log('express-handlebars example server listening on: %d', port);
});
