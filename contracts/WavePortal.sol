// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) wavers;

    uint256 private seed;

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver;
        uint256 timestamp;
        string message;
    }

    Wave[] waves;

    constructor() payable {
        console.log("YSM Hello World Smart Contract");

        seed = (block.timestamp + block.difficulty) % 100;
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        wavers[msg.sender] += 1;
        console.log("%s has waved!", msg.sender);
        console.log("%s: wave count: %d", msg.sender, wavers[msg.sender]);

        waves.push(Wave(msg.sender, block.timestamp, _message));

        emit NewWave(msg.sender, block.timestamp, _message);

        seed = (block.timestamp + block.difficulty) % 100;
        console.log("Random # generated: %d", seed);

        if (seed < 50) {
            console.log("%s won!", msg.sender);

            // Send Prize money to people who called the function
            uint256 prizeAmount = 0.0001 ether;
            require(
                prizeAmount <= address(this).balance,
                "Trying to withdraw more money than the contract has."
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}("");
            require(success, "Failed to withdraw money from contract.");
        }
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We had %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }
}
