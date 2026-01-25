# ProofChain

Immutable document certification with verification API on Base and Stacks blockchains.

## Features

- Certify documents with cryptographic hash
- Immutable timestamp proof
- Verify document authenticity
- Metadata storage for additional context
- Multi-chain certification

## Smart Contract Functions

### Base (Solidity)
- `certify(bytes32 docHash, string metadata)` - Certify document
- `verify(bytes32 docHash)` - Check if certified
- `getCertificate(bytes32 docHash)` - Get certification details

### Stacks (Clarity)
- `(certify (doc-hash (buff 32)) (metadata (string-ascii 256)))` - Certify
- `(verify (doc-hash (buff 32)))` - Verify certification
- `(get-certificate (doc-hash (buff 32)))` - Get details

## Tech Stack

- **Frontend**: Next.js 14, TypeScript, Tailwind CSS
- **Base**: Solidity 0.8.20, Foundry, Reown wallet
- **Stacks**: Clarity v4, Clarinet, @stacks/connect

## Getting Started

```bash
pnpm install
pnpm dev
```

## License

MIT License
