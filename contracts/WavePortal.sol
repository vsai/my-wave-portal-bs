// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) wavers;

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver;
        uint256 timestamp;
        string message;
    }

    Wave[] waves;

    constructor() {
        console.log("YSM Hello World Smart Contract");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        wavers[msg.sender] += 1;
        console.log("%s has waved!", msg.sender);
        console.log("%s: wave count: %d", msg.sender, wavers[msg.sender]);

        waves.push(Wave(msg.sender, block.timestamp, _message));

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We had %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }
}
