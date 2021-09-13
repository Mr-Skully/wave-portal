// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    
    uint totalWaves;
    uint private seed;

    event NewWave(address indexed from, uint timestamp, string message);

    struct Wave {
        address waver;
        uint timestamp;
        string message;
    }

    Wave[] waves;

    constructor( ) payable {
        console.log("Hey, the WavePortal smart contract is up and running!!");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s just waved, and recommended: %s", msg.sender, _message);
        waves.push(Wave(msg.sender, block.timestamp, _message));
        emit NewWave(msg.sender, block.timestamp, _message);

        uint randomNumber = (block.difficulty + block.timestamp + seed) % 100;
        console.log("Random number generated: %s", randomNumber);
        seed = randomNumber;
        if (randomNumber < 10) {
            uint basePrize = 0.0001 ether;
            uint prizeWon = basePrize * (randomNumber + 1);
            console.log("%s won %s wei.", msg.sender, prizeWon);
            require(prizeWon <= address(this).balance, "Trying to withdraw more than the contract's balance.");
            (bool success,) = (msg.sender).call{value: prizeWon}("");
            require(success, "Failed to withdraw from contract's balance.");
        }
    }

    function getWaves( ) public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves( ) public view returns (uint) {
        console.log("We have a total of %d waves.", totalWaves);
        return totalWaves;
    }

}