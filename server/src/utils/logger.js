const winston = require('winston');
const appRoot = require('app-root-path');

require('winston-daily-rotate-file');
require('date-utils');

const logFormatter = winston.format.printf(
    (info) =>
      `${new Date().toFormat(
        'YYYY-MM-DD HH24:MI:SS'
      )} [${info.level.toUpperCase()}] - ${JSON.stringify(info.message)}`
  );
  
  const logger = winston.createLogger({
    level: 'info',
    transports: [
      new winston.transports.DailyRotateFile({
        filename: `${appRoot}/logs/%DATE%.log`,
        zippedArchive: false,
        format: logFormatter,
        handleExceptions: true,
      }),
      new winston.transports.Console({
        format: logFormatter,
        handleExceptions: true,
        colorize: true,
      }),
    ],
  });
  
  if (process.env.NODE_ENV !== 'production') {
    logger.add(
      new winston.transports.Console({
        format: winston.format.simple(),
      })
    );
  }
  
  module.exports = logger;