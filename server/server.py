from fastapi import FastAPI
from fastapi.responses import FileResponse
from pathlib import Path
import platform

app = FastAPI()

# Detecta o sistema
system = platform.system()

if system == "Windows":
    VIDEO_DIR = Path("C:/seus_videos")
elif system == "Darwin":  # macOS
    VIDEO_DIR = Path("/Users/iury/Movies")
else:
    VIDEO_DIR = Path("./videos")

@app.get("/videos")
def list_videos():
    files = []
    for f in VIDEO_DIR.iterdir():
        if f.suffix.lower() in [".mp4", ".mkv", ".avi"]:
            files.append({"name": f.name, "url": f"/stream/{f.name}"})
    return files

@app.get("/stream/{filename}")
def stream_video(filename: str):
    file_path = VIDEO_DIR / filename
    return FileResponse(file_path)
    
