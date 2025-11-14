# HS-Roku

A custom Roku app for streaming movies and TV shows from a personal home media server.

---
### How to use
Before installing the app, update the server IP address in the code so the Roku device can access your media server on the network.

### Running the media server

This project includes a simple FastAPI-based server to expose your local video files.

1. Install the required dependencies:

`pip install fastapi uvicorn` 


2. Edit the `VIDEO_DIR` path inside `server.py` to point to the folder where your videos are stored.

3. Start the server:

`uvicorn server:app --host 0.0.0.0 --port 8000`


4. Make sure your Roku device and your PC are on the same local network.

You can test the server by opening in your browser:

- `http://YOUR_PC_IP:8000/videos`
- `http://YOUR_PC_IP:8000/stream/filename.mp4`

### Installing the Roku channel (Dev Mode)

1. Enable Developer Mode on your Roku device.
2. Open your browser and go to: `http://ROKU_IP_ADDRESS`.
3. Log in to the development interface.
4. Click "Upload".
5. Zip the entire project folder.
6. Upload the `.zip` file through the Roku interface to install the channel.

---

