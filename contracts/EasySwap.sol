// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.0;

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

contract EasySwap {
    
    address swapRouter = 0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F;
    address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public constant WETH9 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    
    function swapWETHToDai(uint256 amountIn) external returns (uint256[] amountOut) {
        // msg.sender must approve this contract

        // Transfer the specified amount of DAI to this contract.
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);

        // Approve the router to spend DAI.
        TransferHelper.safeApprove(WETH9, swapRouter, amountIn);
        
        address[] memory path;
        path[0] = DAI;
        pth[1] = WETH9;
        
        amountOut = IUniswapV2Router02(swapRouter).swapExactTokensForTokens(amount In, 0, path, msg.sender, block.timestamp);
        return amountOut;
    }
}
