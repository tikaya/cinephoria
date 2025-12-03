module.exports = {
  testEnvironment: 'node',
  transform: {
    '^.+\\.js$': 'babel-jest'
  },
  setupFilesAfterEnv: ['./tests/setup.js'],  // ← Ajoute ça
  testMatch: ['**/tests/**/*.test.js'],
  forceExit: true
};