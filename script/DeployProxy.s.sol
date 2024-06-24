//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {BoxV1} from "../src/BoxV1.sol";

contract DeployProxy is Script {
    ERC1967Proxy proxy;

    function run() external {
        // address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BoxV1", block.chainid);
        vm.startBroadcast();
        proxy = new ERC1967Proxy(
            0x5FbDB2315678afecb367f032d93F642f64180aa3, abi.encodeWithSelector(BoxV1.initialize.selector)
        );
        vm.stopBroadcast();
    }
}
