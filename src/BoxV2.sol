//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BoxV2 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal number;

    // this is a constructor which disables constructors. See BoxV1
    /// @custom:oz-upgrades-unsafe-allow-constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender); // sets owner to msg.sender
        __UUPSUpgradeable_init(); // doesn't do anything but it just says "hey this is UUPS upgradeable and we're gonna treat it as such"
    }

    function setNumber(uint256 _number) external {
        number = _number;
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 2;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}

// 127.0.0.1:8545
// 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
// BoxV2 0x5FC8d32690cc91D4c39d9d3abcBD16989F875707
// proxy 0xe7f1725e7734ce288f8367e1bb143e90bb3f0512
