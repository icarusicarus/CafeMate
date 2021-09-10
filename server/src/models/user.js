const moment = require('moment');

module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define(
        'user',
        {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: DataTypes.INTEGER,
            },
            user_id: {
                allowNull: false,
                unique: true,
                type: DataTypes.STRING(30),
            },
            password: {
                allowNull: false,
                type: DataTypes.STRING(60),
            },
            nickname: {
                allowNull: false,
                type: DataTypes.STRING(30)
            },
            sex: {
                type: DataTypes.INTEGER
            },
            phone: {
              allowNull: true,
              type: DataTypes.STRING(12)
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

    return User;
}