const express = require('express');
const cors = require("cors");

const app = express();

// TODO: Only in development
app.use(cors());

app.get("/api", (req, res, next) => {
  res.json({
    message: "all works!"
  });
});

app.listen(3042, () => {
  console.log(`
      ################################################
      🛡️  Server listening on port: ${3042} 🛡️ 
      ################################################
    `);
});
