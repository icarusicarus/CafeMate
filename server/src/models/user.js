const moment = require('moment');

'use strict';
module.exports = (sequelize, DataTypes) => {
    const user = sequelize.define(
        'user',
        {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: DataTypes.INTEGER,
            },
            userNumber: {
                allowNull: false,
                unique: true,
                type: DataTypes.STRING(60),
            },
            kind: {
                allowNull: false,
                type: DataTypes.INTEGER,
            },
            name: {
                allowNull: false,
                type: DataTypes.STRING(60)
            },
            email: {
              allowNull: true,
              type: DataTypes.STRING(30)
            },
            created_at: {
                allowNull: false,
                type: DataTypes.DATE,
                get: function() {
                    const time = this.getDataValue('date');
                    if(moment(time, moment.ISO_8601, true).isValid()) {
                        return {
                            day: moment(time).format('YYYY-MM-DD'),
                            time: moment(time).format('HH:mm:ss'),
                        };
                    }
                    return time;
                },
            },
        },
        {
            tableName: 'user',
        }
    );

    return user;
}