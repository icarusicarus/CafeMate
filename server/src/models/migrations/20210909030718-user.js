'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('user', {
      id: {
        autoIncrement: true,
        primaryKey: true,
        allowNull: false,
        type: Sequelize.INTEGER,
      },
      user_id: {
        allowNull: false,
        unique: true,
        type: Sequelize.STRING(30)
      },
      password: {
        allowNull: false,
        type: Sequelize.STRING(60)
      },
      nickname: {
        allowNull: false,
        type: Sequelize.STRING(30)
      },
      sex: {
        type: Sequelize.INTEGER
      },
      phone: {
        allowNull: true,
        type: Sequelize.STRING(12)
      },
      created_at: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('user');
  }
};