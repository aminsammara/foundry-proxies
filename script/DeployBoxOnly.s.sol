// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";

contract DeployBoxOnly is Script {
    BoxV1 public box;

    function run() external {
        vm.startBroadcast();
        box = new BoxV1();
        vm.stopBroadcast();
    }
}
