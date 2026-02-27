/** @type {import('next').NextConfig} */
const nextConfig = {
    reactStrictMode: true,
    transpilePackages: ['@proofchain/shared', '@proofchain/base-adapter', '@proofchain/stacks-adapter'],
};

export default nextConfig;
