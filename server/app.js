const logger = require('./src/utils/logger');
const db = require('./src/models');

require('dotenv').config();

process.on('uncaughtException', (err) => {
    logger.error('UNCAUGHT EXCEPTION');
    logger.error(err.name, err.message);
    process.exit(1);
});

const server = require('./src/server');

db.sequelize
    .sync({ force: false, logging: false })
    .then(() => {
        server.listen(process.env.PORT, () => {
            logger.info(`App listening on PORT ${process.env.PORT}`);
        });
    });

process.on('unhandleRejection', (err) => {
    logger.error('UNHANDLE REJECTION');
    logger.error(err.name, err.message);
    server.close(() => {
        process.exit(1);
    });
});

process.on('SIGTERM', () => {
    logger.error('SIGTERM RECEIVED');
    server.close(() => {
        logger.error('Process terminated');
    });
});