// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV2} from "../src/BoxV2.sol";

contract DeployBoxV2Only is Script {
    BoxV2 public box;

    function run() external {
        vm.startBroadcast();
        box = new BoxV2();
        vm.stopBroadcast();
    }
}
