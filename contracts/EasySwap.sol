// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "https://github.com/sushiswap/sushiswap/blob/canary/contracts/uniswapv2/libraries/TransferHelper.sol";
import "https://github.com/sushiswap/sushiswap/blob/canary/contracts/uniswapv2/interfaces/IUniswapV2Router02.sol";

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// This contract swap WETH to DAI token using the sushiswap router on ropsten testnet

contract EasySwap {
    
    address public swapRouter = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506;
    
    address public constant DAI = 0xc2118d4d90b274016cB7a54c03EF52E6c537D957;
    address public constant WETH9 = 0xc778417E063141139Fce010982780140Aa0cD5Ab;
    
    function swapWethToDai(uint256 _amountIn) external {
        uint amountIn = _amountIn * 10 ** 18;
        // msg.sender must have approved this contract first

        // Transfer the specified amount of DAI to this contract.
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);

        // Approve the router to spend DAI.
        TransferHelper.safeApprove(WETH9, swapRouter, amountIn);
        
        address[] memory path = new address[](2);
        path[0] = WETH9;
        path[1] = DAI;
        
        IUniswapV2Router02(swapRouter).swapExactTokensForTokens(amountIn, 0, path, msg.sender, block.timestamp);
    }
    
}