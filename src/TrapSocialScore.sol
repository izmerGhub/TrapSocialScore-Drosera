// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ITrap} from "drosera-contracts/interfaces/ITrap.sol";

contract TrapSocialScore is ITrap {
    address public constant RESPONSE_CONTRACT = 0x25E2CeF36020A736CF8a4D2cAdD2EBE3940F4608;

    string constant discordName = "izmers";

    function collect() external view returns (bytes memory) {
        uint256 mockScore = 1337;
        return abi.encode(mockScore, discordName);
    }

    function shouldRespond(bytes[] calldata data) external pure returns (bool, bytes memory) {
        (uint256 score, string memory name) = abi.decode(data[0], (uint256, string));
        if (score < 1000 || bytes(name).length == 0) {
            return (false, bytes(""));
        }

        return (true, abi.encode(name));
    }
}
