const hre = require("hardhat");

async function main() {
    const [deployer] = await hre.ethers.getSigners();  // Get deployer's wallet
    console.log("Deploying contracts with the account:", deployer.address);

    // Deploy the Voting contract
    const Voting = await hre.ethers.getContractFactory("Voting");
    const voting = await Voting.deploy();  // Deploy contract
    console.log("Voting contract deployed to:", voting.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
