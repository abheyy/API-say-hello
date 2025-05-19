const express = require('express');
const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Add request logging
app.use((req, res, next) => {
    console.log(`${new Date().toISOString()} - ${req.method} ${req.url}`);
    next();
});

// Hello endpoint
app.get('/sayHello', (req, res) => {
    console.log('Received request to /sayHello');
    res.json({ message: "Hello User" });
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error('Error:', err);
    res.status(500).json({ error: 'Internal Server Error' });
});

// Start server on port 80 (requires admin privileges on most systems)
const PORT = 80;
const HOST = '0.0.0.0';

const server = app.listen(PORT, HOST, (err) => {
    if (err) {
        console.error('Error starting server:', err);
        process.exit(1);
    }
    const address = server.address();
    console.log(`Server is running on http://${HOST}:${PORT}`);
    console.log('Server details:', {
        address: address,
        port: PORT,
        host: HOST,
        family: address.family
    });
});

// Handle server errors
server.on('error', (err) => {
    console.error('Server error:', err);
    if (err.code === 'EACCES') {
        console.error('Permission denied to bind to port 80. Make sure authbind is properly configured.');
    } else if (err.code === 'EADDRINUSE') {
        console.error('Port 80 is already in use. Please check running processes.');
    } else {
        console.error('Unexpected error:', err);
    }
    process.exit(1);
});

// Handle process termination
process.on('SIGTERM', () => {
    console.log('SIGTERM received. Shutting down gracefully...');
    server.close(() => {
        console.log('Server closed');
        process.exit(0);
    });
});