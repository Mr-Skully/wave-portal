// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint totalWaves;

    constructor( ) {
        console.log("Hey, the WavePortal smart contract is up and running!!");
    }

    function wave( ) public {
        totalWaves += 1;
        console.log("%s just waved!", msg.sender);
    }

    function getTotalWaves( ) public view returns (uint) {
        console.log("We have a total of %d waves.", totalWaves);
        return totalWaves;
    }

}