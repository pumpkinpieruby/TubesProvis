# main.py
from fastapi import HTTPException
from app import app
import user  # Import the user module to register routes

@app.get("/")
def read_root():
    return {"FastAPI CareWave": "Berhasil dijalankan!"}

# Include user router
app.include_router(user.router)
