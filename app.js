var express = require('express');
var exphbs = require('express-handlebars');
var index = require('./routes/index');
var bodyParser = require("body-parser");
var session = require('express-session');
var passport = require('passport');
var morgan = require('morgan');
var flash = require("connect-flash");
var port = process.env.PORT|| 3000;

var app = express();

app.use(morgan('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(session({
    secret: '"cats"',
    resave: true,
    saveUninitialized: true
}));

app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
app.use((req, res, next) =>{
    res.locals.currentUser = req.user;
    res.locals.success = req.flash('success');
    res.locals.error = req.flash('error');
    next();
});

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
