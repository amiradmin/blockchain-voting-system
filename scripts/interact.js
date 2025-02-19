const hre = require("hardhat");

async function main() {
  const [owner] = await hre.ethers.getSigners();

  // Contract instance
  const Voting = await hre.ethers.getContractFactory("Voting");

  // Attach to the deployed contract address
  const voting = await Voting.attach("0xaF43d3a2e8B84386328DDF95Ac77A354C20050C3"); // Replace with actual address

  // Add a candidate
  const tx = await voting.addCandidate("John Doe");
  await tx.wait(); // Wait for the transaction to be mined

  // Get total candidates
  const totalCandidates = await voting.candidatesCount();
  console.log(`Total candidates: ${totalCandidates}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
