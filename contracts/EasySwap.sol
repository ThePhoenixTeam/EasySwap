// SPDX-License-Identifier: MIT;
pragma solidity =0.7.6;

import "./uniswapv2/libraries/TransferHelper.sol";
import "./uniswapv2/interfaces/IUniswapV2Router02.sol";
import "./uniswapv2/interfaces/IERC20.sol";
import "./uniswapv2/interfaces/IWETH.sol";

contract EasySwap {

    address public swapRouter = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506;
    
    address public constant DAI = 0xc2118d4d90b274016cB7a54c03EF52E6c537D957;
    address public constant WETH9 = 0xc778417E063141139Fce010982780140Aa0cD5Ab;
    
	function deposit(uint256 amountIn) external {
        uint amountIn = _amountIn * 10 ** 18;
		// msg.sender must approve this contract to spend their DAI

        // Transfer the specified amount of DAI to this contract.
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);

        // Approve the router to spend DAI.
        TransferHelper.safeApprove(WETH9, swapRouter, amountIn);
        
        address[] memory path = new address[](2);
        path[0] = WETH9;
        path[1] = DAI;
        
        IUniswapV2Router02(swapRouter).swapExactETHForTokens(0, path, address(this), block.timestamp);
    }
	
    function deposit(uint256 amountIn) external {
        uint amountIn = _amountIn * 10 ** 18;
		// msg.sender must approve this contract to spend their DAI

        // Transfer the specified amount of DAI to this contract.
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);

        // Approve the router to spend DAI.
        TransferHelper.safeApprove(WETH9, swapRouter, amountIn);
		
        address[] memory path = new address[](2);
        path[0] = WETH9;
        path[1] = DAI;
        
        IUniswapV2Router02(swapRouter).swapExactTokensForTokens(amountIn, 0, path, address(this), block.timestamp);
    }
	
	// Allows user to withdraw their stableCoins
	function withdraw(uint256 _amount) external returns (
		uint amount = _amount * 10 ** 18;
		TransferHelper.safeTransfer(DAI, msg.sender, amount);
	}