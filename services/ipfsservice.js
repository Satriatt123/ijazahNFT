const path = require('path');
// Memastikan dotenv membaca file .env yang ada di folder 'backend'
require('dotenv').config({ path: path.join(__dirname, '../.env') });

const pinataSDK = require('@pinata/sdk');
const fs = require('fs');

// Inisialisasi menggunakan objek konfigurasi agar lebih stabil
const pinata = new pinataSDK({
    pinataApiKey: process.env.PINATA_API_KEY,
    pinataSecretApiKey: process.env.PINATA_API_SECRET
});

const uploadToIPFS = async (filePath, name) => {
    try {
        const readableStreamForFile = fs.createReadStream(filePath);
        const options = { pinataMetadata: { name: name } };
        const result = await pinata.pinFileToIPFS(readableStreamForFile, options);
        return result.IpfsHash;
    } catch (error) {
        throw new Error("Gagal upload file ke IPFS: " + error.message);
    }
};

const uploadMetadataToIPFS = async (metadata) => {
    try {
        const result = await pinata.pinJSONToIPFS(metadata);
        return result.IpfsHash;
    } catch (error) {
        throw new Error("Gagal upload metadata ke IPFS: " + error.message);
    }
};

module.exports = { uploadToIPFS, uploadMetadataToIPFS };