// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint totalWaves;

    event NewWave(address indexed from, uint timestamp, string message);

    struct Wave {
        address waver;
        uint timestamp;
        string message;
    }

    Wave[] waves;

    constructor( ) {
        console.log("Hey, the WavePortal smart contract is up and running!!");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s just waved, and recommended: %s", msg.sender, _message);
        waves.push(Wave(msg.sender, block.timestamp, _message));
        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getWaves( ) public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves( ) public view returns (uint) {
        console.log("We have a total of %d waves.", totalWaves);
        return totalWaves;
    }

}