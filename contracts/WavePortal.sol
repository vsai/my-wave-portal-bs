// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) wavers;

    constructor() {
        console.log("YSM Hello World Smart Contract");
    }

    function wave() public {
        totalWaves += 1;
        wavers[msg.sender] += 1;
        console.log("%s has waved!", msg.sender);
        console.log("%s: wave count: %d", msg.sender, wavers[msg.sender]);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We had %d total waves!", totalWaves);
        return totalWaves;
    }
}
