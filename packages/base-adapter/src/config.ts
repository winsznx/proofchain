import { base, baseSepolia } from '@reown/appkit/networks';

export const baseConfig = {
    projectId: process.env.NEXT_PUBLIC_REOWN_PROJECT_ID || '',
    networks: [base, baseSepolia],
    defaultNetwork: baseSepolia,
    metadata: {
        name: 'ProofChain',
        description: 'Immutable document certification with verification API on Base and Stacks blockchains.',
        url: 'https://proofchain.app',
        icons: ['https://proofchain.app/icon.png']
    }
};

export const CONTRACT_ADDRESSES = {
    [base.id]: process.env.NEXT_PUBLIC_BASE_CONTRACT_ADDRESS || '',
    [baseSepolia.id]: process.env.NEXT_PUBLIC_BASE_SEPOLIA_CONTRACT_ADDRESS || ''
};
