from fastapi import APIRouter, HTTPException, status
from pydantic import BaseModel
from typing import List
import sqlite3

router = APIRouter()

# Pydantic model for Antrean
class Antre(BaseModel):
    id_antrean: int
    nomor_antrean: int
    status_antrean: str

@router.get("/init/", status_code=status.HTTP_201_CREATED)
def init_db():
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
        cursor.execute("DROP TABLE IF EXISTS Antre")  # Drop the existing table if it exists
        cursor.execute(
            """CREATE TABLE IF NOT EXISTS Antre (
                id_antrean INTEGER PRIMARY KEY AUTOINCREMENT,
                nomor_antrean INTEGER NOT NULL,
                status_antrean TEXT
            )"""
        )
        conn.commit()
    except Exception as e:
        return {"status": f"Error saat membuat tabel: {e}"}
    finally:
        conn.close()
    return {"status": "Berhasil membuat tabel Antrean"}

# Menambahkan antrean
@router.post("/random/", status_code=status.HTTP_201_CREATED)
def add_random_antrean():
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    nomor_antrean = random.randint(1, 30)
    status_antrean = "waiting"
    try:
        cursor.execute(
            """INSERT INTO Antre (nomor_antrean, status_antrean)
            VALUES (?, ?)""",
            (nomor_antrean, status_antrean)
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=400, detail="Error adding antrean")
    finally:
        conn.close()
    return {"nomor_antrean": nomor_antrean, "message": "Random antrean added successfully"}

# Mendapatkan semua antrean
@router.get("/getAllAntre", response_model=List[Antre], status_code=status.HTTP_200_OK)
def get_all_queues():
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Antre")
    antri = cursor.fetchall()
    conn.close()
    if antri:
        return [
            {
                "id_antrean": a[0],
                "nomor_antrean": a[1],
                "status_antrean": a[2]
            }
            for a in antri
        ]
    raise HTTPException(status_code=404, detail="No antrean found")

# Menambahkan antrean dengan nomor acak
import random


