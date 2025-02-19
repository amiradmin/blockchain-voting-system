require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",  // Match the version in your Solidity contract
  networks: {
    ganache: {
      url: "http://127.0.0.1:8545", // Ensure Ganache is running
      accounts: ["0x3268002942961ef18ec0c268af4486ed865dcdca5eee78735f22efa3f16be7b0"], // Replace with one of your Ganache test account keys
    },
  },
};
