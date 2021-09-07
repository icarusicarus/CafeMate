require("module-alias/register");

const express = require('express');
const session = require('express-session');
const morgan = require('morgan');
const helmet = require('helmet');
const cors = require('cors');
const xss = require('xss-clean');
const compression = require('compression');
const router = require('@router');
const logger = require('@utils/logger');

require('dotenv').config();

const app = express();

app.enable('trust proxy');

app.use(helmet());
app.use(cors());
app.options('*', cors());

if(process.env.NODE_ENV === 'development') {
    app.use(morgan('dev', { stream: logger.stream.write }));
} else {
    app.use(morgan('combined', { stream: logger.stream.write }));
}

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(xss());
app.use(compression());

app.use(session({ secret: process.env.SECRET, resave: true, saveUninitialized: true }));

app.use(router);

app.use(function(err, req, res, next) {
    res.status(500).json({ code: 500, data: { msg: "Internal Server Error", err: err }});
});

module.exports = app;