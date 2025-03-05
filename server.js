const express = require('express');
const cors = require('cors');
const sequelize = require('./config/database');
const homeworkRoutes = require('./routes/homework');
const studentRoutes = require('./routes/students');
const assignmentRoutes = require('./routes/assignments');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Setează header-ul Content-Type pentru toate răspunsurile
app.use((req, res, next) => {
    res.header('Content-Type', 'application/json; charset=utf-8');
    next();
});

// Routes
app.use('/api/homework', homeworkRoutes);
app.use('/api/students', studentRoutes);
app.use('/api/assignments', assignmentRoutes);

// Database connection and server start
const PORT = process.env.PORT || 3000;

async function startServer() {
    try {
        await sequelize.authenticate();
        console.log('Database connection has been established successfully.');

        app.listen(PORT, () => {
            console.log(`Server is running on port ${PORT}`);
        });
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

startServer();
