# EasySwap

Swaps WETH to DAI on SushiSwap and vice versa

## Install dependencies

    npm install
	
## Deploy to ropsten testnet

    npx truffle migrate --network ropsten

## test

    npm test
    
# Active deployment

    contract address: 0x8054bFDd35Af94549e1F559ae0A8816d911AcB39
    
    abi: [{"inputs": [], "name": "DAI", "outputs": [ { "internalType": "address", "name": "", "type": "address" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "WETH9", "outputs": [ { "internalType": "address", "name": "", "type": "address" } ], "stateMutability": "view", "type": "function" }, { "inputs": [ { "internalType": "uint256", "name": "amountIn", "type": "uint256" } ], "name": "swapDAIToWETH", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [], "name": "swapRouter", "outputs": [ { "internalType": "address", "name": "", "type": "address" } ], "stateMutability": "view", "type": "function" }, { "inputs": [ { "internalType": "uint256", "name": "amountIn", "type": "uint256" } ], "name": "swapWETHToDai", "outputs": [], "stateMutability": "nonpayable", "type": "function" } ]
    
    
 ## Successful transaction hash

    WETH to DAI swap: 0xe18bd2954d1275bf1f98b2ba199d2c660b4e4cd88077eefe5df877eea424286b
    
    DAI to WETH swap: 0x6e771bad595f0df1fbc7c91f3223ff204e3a48da25c25497c4f7f6e3676f94a2
