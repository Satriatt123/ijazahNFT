const { ethers } = require('ethers');
require('dotenv').config();

const provider = new ethers.JsonRpcProvider(process.env.RPC_URL);
const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

// ABI sederhana untuk fungsi mintIjazah
const ABI = [
    "function mintIjazah(address to, uint256 tokenId, string memory uri) public"
];

const contract = new ethers.Contract(process.env.CONTRACT_ADDRESS, ABI, wallet);

const mintNFT = async (toAddress, tokenId, tokenURI) => {
    try {
        const tx = await contract.mintIjazah(toAddress, tokenId, tokenURI);
        await tx.wait(); // Tunggu konfirmasi blok
        return tx.hash;
    } catch (error) {
        console.error("Blockchain Minting Error:", error);
        throw error;
    }
};

module.exports = { mintNFT };