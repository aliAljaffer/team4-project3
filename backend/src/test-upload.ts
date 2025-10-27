import * as fs from "fs";
import * as path from "path";
import FormData from "form-data";
import fetch from "node-fetch";

const API_URL = process.env.API_URL || "http://localhost:4001";

async function testUpload() {
  try {
    // Path to a test image (adjust this to your test file)
    const testImagePath = path.join(__dirname, "..", "test-image.png");

    // Check if file exists
    if (!fs.existsSync(testImagePath)) {
      console.error(`Test image not found at: ${testImagePath}`);
      console.log("Please create a test image or update the path");
      return;
    }

    // Read the file
    const fileBuffer = fs.readFileSync(testImagePath);
    const fileName = path.basename(testImagePath);

    // Create form data
    const formData = new FormData();
    formData.append("file", fileBuffer, {
      filename: fileName,
      contentType: "image/png", // adjust based on your file type
    });

    console.log("Uploading file...");
    console.log(`File: ${fileName}`);
    console.log(`Size: ${fileBuffer.length} bytes`);
    console.log(`API: ${API_URL}/api/upload\n`);

    // Make the request
    const response = await fetch(`${API_URL}/api/upload`, {
      method: "POST",
      body: formData,
      headers: formData.getHeaders(),
    });

    const data = await response.json();

    if (response.ok) {
      console.log("Upload successful!");
      console.log("Public URL:", data.url);
    } else {
      console.error("Upload failed");
      console.error("Status:", response.status);
      console.error("Error:", data.error || data);
    }
    console.log(data);
  } catch (error) {
    console.error("Error during upload test:", error);
  }
}

// Run the test
testUpload();
