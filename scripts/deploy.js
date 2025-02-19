const hre = require("hardhat");

async function main() {
  // Get the contract factory for Voting contract
  const Voting = await hre.ethers.getContractFactory("Voting");

  // Deploy the contract
  const voting = await Voting.deploy();

  // Wait for deployment to finish
  await voting.waitForDeployment();  // Correct method to wait for deployment

  // Get the deployed contract address
  console.log(`Voting contract deployed to: ${await voting.getAddress()}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
