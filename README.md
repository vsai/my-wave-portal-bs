# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```

# Initializing application
```shell
mkdir project_dir
cd project_dir
npm init -y  # / yarn init
npm install --save-dev hardhat       # /  yarn add hardhat -D

# Initialize hardhat project
npx hardhat

# in case npx hardhat didn’t install the dependencies
npm install --save-dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers

npm install @openzeppelin/contracts

# display list of accounts
npx hardhat accounts

# Update hardhat.config.js with the networks we want to use

```

# Testing & Deployment
```shell
# 1. Test it
npx hardhat run scripts/run.js

# 2. Deploy it
npx hardhat run scripts/deploy.js --network goerli

# 3. Update contract address in frontend App.js

# 4. Copy the new ABI
cp /artifacts/contracts/WavePortal.sol/WavePortal.json ../destination_dir/src/{some_path}
```


# Other commands
```shell
# This will start a local ethereum network and it stays alive.
npx hardhat node

# Deploy locally
npx hardhat run scripts/deploy.js --network localhost
```
