// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ProofChain
 * @notice Immutable document certification registry
 */
contract ProofChain {
    error AlreadyCertified();
    error NotFound();

    event DocumentCertified(bytes32 indexed hash, address indexed certifier, uint256 timestamp);

    struct Certificate {
        address certifier;
        uint256 timestamp;
        string metadata;
    }

    mapping(bytes32 => Certificate) public certificates;

    function certify(bytes32 docHash, string calldata metadata) external {
        if (certificates[docHash].certifier != address(0)) revert AlreadyCertified();
        certificates[docHash] = Certificate({
            certifier: msg.sender,
            timestamp: block.timestamp,
            metadata: metadata
        });
        emit DocumentCertified(docHash, msg.sender, block.timestamp);
    }

    function verify(bytes32 docHash) external view returns (bool) {
        return certificates[docHash].certifier != address(0);
    }

    function getCertificate(bytes32 docHash) external view returns (address, uint256, string memory) {
        Certificate memory cert = certificates[docHash];
        if (cert.certifier == address(0)) revert NotFound();
        return (cert.certifier, cert.timestamp, cert.metadata);
    }
}
