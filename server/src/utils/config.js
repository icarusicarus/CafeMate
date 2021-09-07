require('dotenv').config();

const { env } = process;

const common = {
    database: env.DATABASE,
    host: env.HOST,
    username: env.USERNAME,
    password: env.PASSWORD,
    dialect: 'postgres',
    define: {
        timestamps: false,
        underscored: false,
        freezeTableName: true
    },
};

const config = {
    development: {
        ...common,
    },
    production: {
        ...common,
        pool: {
            max: 10,
            min: 0,
            acqure: 30000,
            idle: 10000,
        },
    },
};

module.exports = config;