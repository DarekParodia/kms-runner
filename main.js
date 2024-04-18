const {exec} = require("child_process");
const express = require('express');
const path = require('path');
const app = express();
const port = 8080;

var isWin = process.platform === "win32";

console.log("Is Windows?: " + isWin);

function runProcessInLoop(processPath) {
    const child = exec(processPath, (error, stdout, stderr) => {
        if (error) {
            console.error(`error: ${error.message}`);
            return;
        }

        if (stderr) {
            console.error(`stderr: ${stderr}`);
            return;
        }
    });

    child.on("exit", (code, signal) => {
        console.log(`Child process exited with code ${code} and signal ${signal} at: ${new Date().toISOString()}`);
        runProcessInLoop(processPath);
    });
}

if (isWin) runProcessInLoop("KMS.exe");
else runProcessInLoop("./kms/KMS.x86_64");

// server

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, "site", "index.html"));
});
   
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});