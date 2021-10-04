'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('gifticon', {
      id: {
        autoIncrement: true,
        primaryKey: true,
        allowNull: false,
        type: Sequelize.INTEGER,
      },
      user_id: {
        allowNull: false,
        type: Sequelize.INTEGER,        
      },
      g_4000: {
        allowNull: false,
        type: Sequelize.INTEGER,
      },
      g_6000: {
        allowNull: false,
        type: Sequelize.INTEGER,
      },
      g_8000: {
        allowNull: false,
        type: Sequelize.INTEGER,
      },
      g_10000: {
        allowNull: false,
        type: Sequelize.INTEGER,
      },
      updated_at: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },

  down: async (queryInterface, _) => {
    await queryInterface.dropTable('gifticon');
  }
};
