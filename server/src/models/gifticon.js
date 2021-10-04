const moment = require('moment');

'use strict';
module.exports = (sequelize, DataTypes) => {
    const gifticon = sequelize.define(
        'gifticon',
        {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: DataTypes.INTEGER,
            },
            user_id: {
                allowNull: false,
                type: DataTypes.INTEGER,
            },
            g_4000: {
                allowNull: false,
                type: DataTypes.INTEGER,
            },
            g_6000: {
                allowNull: false,
                type: DataTypes.INTEGER,
            },
            g_8000: {
                allowNull: false,
                type: DataTypes.INTEGER,
            },
            g_10000: {
                allowNull: false,
                type: DataTypes.INTEGER,
            },
            updated_at: {
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
        }
    );

    return gifticon;
}