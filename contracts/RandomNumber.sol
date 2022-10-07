//SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract RandomNumber is VRFConsumerBase{
    bytes32 internal keyHash; //identifies which Chainlink oracle to use
    uint internal fee; //fee to get random number from chainlink
    uint public randomResult;

    constructor() 
        VRFConsumerBase(
            0x2Ca8E0C643bDe4C2E08ab1fA0da3401AdAD7734D, //VRF coordinator - address of the smart contract that verifies the random number returned by chainlink
            0x326C977E6efc84E512bB9C30f76E30c160eD06FB //Link token
        ) {
            keyHash = 0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;
            fee = 0.25 * 10 ** 18; //0.25 Link
        }
    

    function getRandomNumber() public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough Link in contract" );
        return requestRandomness(keyHash, fee);
    }

    function fulfillRandomness(bytes32 requestId, uint randomness) internal override {
        randomResult = randomness.mod(10).add(1);
    } 
    
}