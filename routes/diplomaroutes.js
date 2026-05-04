const express = require('express');
const router = express.Router();
const multer = require('multer'); // Import library multer
const { v4: uuidv4 } = require('uuid');

// Pastikan path menggunakan '../' karena route berada di dalam subfolder
const { uploadToIPFS, uploadMetadataToIPFS } = require('../services/ipfsService');
const { mintNFT } = require('../services/blockchainService');
const sequelize = require('../config/database'); 

// --- TAMBAHKAN BAGIAN INI ---
// Konfigurasi tujuan unggah file sementara
const upload = multer({ dest: 'uploads/' }); 
// ----------------------------

router.post('/mint', upload.single('ijazah_file'), async (req, res) => {
    const { alumni_id, certificate_number, wallet_address, name, nim, prodi } = req.body;
    const file = req.file;

    // Validasi apakah file ada
    if (!file) {
        return res.status(400).json({ success: false, error: "File ijazah tidak ditemukan" });
    }

    try {
        console.log(`Menerima permintaan minting untuk NIM: ${nim}`);

        // 1. Upload Gambar ke IPFS[cite: 4]
        const imageHash = await uploadToIPFS(file.path, `ijazah-${nim}`);

        // 2. Buat & Upload Metadata JSON ke IPFS[cite: 4]
        const metadata = {
            name: `Ijazah NFT - ${name}`,
            description: `Ijazah resmi institusi untuk ${name}`,
            image: `ipfs://${imageHash}`,
            attributes: [
                { trait_type: "NIM", value: nim },
                { trait_type: "Prodi", value: prodi },
                { trait_type: "Nomor Ijazah", value: certificate_number }
            ]
        };
        const metadataHash = await uploadMetadataToIPFS(metadata);

        // 3. Minting ke Blockchain[cite: 4]
        const tokenId = Date.now(); 
        const txHash = await mintNFT(wallet_address, tokenId, `ipfs://${metadataHash}`);

        // 4. Simpan ke Database menggunakan query manual[cite: 4]
        const diplomaId = uuidv4();
        await sequelize.query(`
            INSERT INTO diplomas (id, alumni_id, certificate_number, ipfs_hash_image, ipfs_hash_metadata, token_id, tx_hash, status, minted_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, 'MINTED', NOW())
        `, {
            replacements: [diplomaId, alumni_id, certificate_number, imageHash, metadataHash, tokenId.toString(), txHash]
        });

        res.json({ success: true, message: "Ijazah minted successfully!", txHash });

    } catch (error) {
        console.error("Minting Error:", error);
        res.status(500).json({ success: false, error: error.message });
    }
});

module.exports = router;