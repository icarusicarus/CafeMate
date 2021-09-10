'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('user', [{
      user_id: 'testttt',
      password: '1234',
      nickname: 'asd',
      created_at: '2021-09-09 02:53:17+00',
    }]);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('user', null, {});
  }
};
