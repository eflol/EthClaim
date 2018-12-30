var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
//var ejs = require('ejs'); // add

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
/*
var DP0initRouter = require('./routes/DP0init');
var DP1medi_findRouter = require('./routes/DP1medi_find');
var DP2medi_chartRouter = require('./routes/DP2medi_chart');
var DP2medi_uploadRouter = require('./routes/DP2medi_upload');
var DP3claim_issueRouter = require('./routes/DP3claim_issue');
var DP4claim_doctranRouter = require('./routes/DP4claim_doctran');
var DP5claim_listRouter = require('./routes/DP5claim_list');
*/

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
//app.set('view engine', 'jade');
app.set('view engine', 'ejs');


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use('/', indexRouter);
app.use('/users', usersRouter);
/*
app.use('/DP0init', DP0initRouter);
app.use('/DP1medi_find', DP1medi_findRouter);
app.use('/DP2medi_chart', DP2medi_chartRouter);
app.use('/DP2medi_upload', DP2medi_uploadRouter);
app.use('/DP3claim_issue', DP3claim_issueRouter);
app.use('/DP4claim_doctran', DP4claim_doctranRouter);
app.use('/DP5claim_list', DP5claim_listRouter);
*/

app.use(express.static(path.join(__dirname, 'public')));
//app.engine('html',ejs.renderFile); // html사용하려면 활성화

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler

app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});


module.exports = app;
