// SPDX-License-Identifier: MIT;
pragma solidity =0.6.12;

import "./uniswapv2/libraries/TransferHelper.sol";
import "./uniswapv2/interfaces/IUniswapV2Router02.sol";
import "./uniswapv2/interfaces/IERC20.sol";
import "./uniswapv2/interfaces/IWETH.sol";

contract EasySwap {

    address public swapRouter = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506;
    
    address public constant DAI = 0xc2118d4d90b274016cB7a54c03EF52E6c537D957;
    address public constant WETH9 = 0xc778417E063141139Fce010982780140Aa0cD5Ab;
    
	function swapWETHToDAI(uint256 amountIn) external {
		// msg.sender must approve this contract to spend their WETH

        // Transfer the specified amount of WETH to this contract.
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);

        // Approve the router to spend WETH.
        TransferHelper.safeApprove(WETH9, swapRouter, amountIn);
		
        address[] memory path = new address[](2);
        path[0] = WETH9;
        path[1] = DAI;
        
        IUniswapV2Router02(swapRouter).swapExactTokensForTokens(amountIn, 0, path, msg.sender, block.timestamp);
    }
	
	function swapDAIToWETH(uint256 amountIn) external {
		// msg.sender must approve this contract to spend their DAI

        // Transfer the specified amount of DAI to this contract.
        TransferHelper.safeTransferFrom(DAI, msg.sender, address(this), amountIn);

        // Approve the router to spend DAI.
        TransferHelper.safeApprove(DAI, swapRouter, amountIn);
		
        address[] memory path = new address[](2);
        path[0] = DAI;
        path[1] = WETH9;
        
        IUniswapV2Router02(swapRouter).swapExactTokensForTokens(amountIn, 0, path, msg.sender, block.timestamp);
    }
}

