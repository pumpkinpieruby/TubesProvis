<<<<<<< HEAD
from fastapi import APIRouter, HTTPException, status
from pydantic import BaseModel
from typing import List
=======
from pydantic import BaseModel
from fastapi import APIRouter, HTTPException, status
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
import sqlite3

router = APIRouter()

<<<<<<< HEAD
=======
# Pydantic model for medicine data
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
class Obat(BaseModel):
    id_obat: int
    nama_obat: str
    harga_obat: str

<<<<<<< HEAD
@router.post("/addObat", status_code=status.HTTP_201_CREATED)
def add_obat(obat: Obat):
=======
@router.get("/init/", status_code=status.HTTP_201_CREATED)
def init_db():
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
        cursor.execute(
<<<<<<< HEAD
=======
            """CREATE TABLE IF NOT EXISTS Obat (
                id_obat INTEGER PRIMARY KEY AUTOINCREMENT,
                nama_obat TEXT NOT NULL,
                harga_obat TEXT NOT NULL
            )"""
        )
        conn.commit()
    except Exception as e:
        return {"status": f"Error saat membuat tabel: {e}"}
    finally:
        conn.close()
    return {"status": "Berhasil membuat tabel Obat"}


@router.post("/addObat", status_code=status.HTTP_201_CREATED)
def add_obat(obat: Obat):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    try:
        cursor.execute(
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
            """INSERT INTO Obat (nama_obat, harga_obat)
            VALUES (?, ?)""",
            (obat.nama_obat, obat.harga_obat)
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=400, detail="Error adding obat")
    finally:
        conn.close()
    return {"message": "Obat added successfully"}

<<<<<<< HEAD
@router.get("/getObat/{id_obat}", response_model=Obat, status_code=status.HTTP_200_OK)
=======
@router.get("/getObat/{id_obat}", status_code=status.HTTP_200_OK)
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
def get_obat(id_obat: int):
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
<<<<<<< HEAD
        cursor.execute("SELECT * FROM Obat WHERE id_obat = ?", (id_obat,))
=======
        cursor.execute("SELECT * FROM Obat WHERE obat_id = ?", (id_obat,))
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
        obat = cursor.fetchone()
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Database error: {e}")
    finally:
        conn.close()

    if obat:
        return {
            "id_obat": obat[0],
            "nama_obat": obat[1],
<<<<<<< HEAD
            "harga_obat": obat[2]
        }
    else:
        raise HTTPException(status_code=404, detail="Obat not found")

@router.get("/getAllObat", response_model=List[Obat], status_code=status.HTTP_200_OK)
def get_all_obat():
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Obat")
    obats = cursor.fetchall()
    conn.close()
    if obats:
        return [
            {
                "id_obat": obat[0],
                "nama_obat": obat[1],
                "harga_obat": obat[2]
            }
            for obat in obats
        ]
    raise HTTPException(status_code=404, detail="No obats found")
=======
            "harga_obat": obat[2],
        }
    else:
        raise HTTPException(status_code=404, detail="Obat not found")
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
