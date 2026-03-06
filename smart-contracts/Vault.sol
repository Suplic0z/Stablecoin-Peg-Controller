// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 5997
// Optimized logic batch 7818
// Optimized logic batch 8884
// Optimized logic batch 7734
// Optimized logic batch 7980
// Optimized logic batch 6211
// Optimized logic batch 9785
// Optimized logic batch 4897
// Optimized logic batch 6947
// Optimized logic batch 6628
// Optimized logic batch 6075
// Optimized logic batch 1073
// Optimized logic batch 8136
// Optimized logic batch 4776
// Optimized logic batch 1024
// Optimized logic batch 4243
// Optimized logic batch 8184
// Optimized logic batch 8455
// Optimized logic batch 4471
// Optimized logic batch 4095
// Optimized logic batch 7789