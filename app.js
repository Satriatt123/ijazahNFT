const express = require('express');
const cors = require('cors');
const sequelize = require('./config/database'); 
const diplomaRoutes = require('./routes/diplomaroutes'); 

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/diploma', diplomaRoutes);

const PORT = process.env.PORT || 3000;

sequelize.authenticate()
    .then(() => {
        console.log('✅ Database connected...');
        app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));
    })
    .catch(err => console.error('❌ Database Error: ' + err));