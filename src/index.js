const express = require('express');
const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Hello endpoint
app.get('/sayHello', (req, res) => {
    res.json({ message: "Hello User" });
});

// Start server on port 80
const PORT = 80;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
}); 