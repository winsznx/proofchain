// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/Uproofchain.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        vm.startBroadcast(deployerPrivateKey);
        
        Uproofchain registry = new Uproofchain();
        
        console.log("Uproofchain deployed to:", address(registry));
        
        vm.stopBroadcast();
    }
}
