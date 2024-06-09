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
# Pydantic model for medicine prescription data
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
class ResepObat(BaseModel):
    id_resep_obat: int
    id_obat: int
    id_pendaftaran: int
    deskripsi: str

<<<<<<< HEAD
@router.post("/addResepObat", status_code=status.HTTP_201_CREATED)
def add_resep_obat(resep_obat: ResepObat):
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
            """CREATE TABLE IF NOT EXISTS ResepObat (
                id_resep_obat INTEGER PRIMARY KEY AUTOINCREMENT,
                id_obat INTEGER NOT NULL,
                id_pendaftaran INTEGER NOT NULL,
                deskripsi TEXT NOT NULL,
                FOREIGN KEY (id_obat) REFERENCES Obat(id_obat),
                FOREIGN KEY (id_pendaftaran) REFERENCES Pendaftaran(id_pendaftaran)
            )"""
        )
        conn.commit()
    except Exception as e:
        return {"status": f"Error saat membuat tabel: {e}"}
    finally:
        conn.close()
    return {"status": "Berhasil membuat tabel Resep Obat"}

@router.post("/addResepObat", status_code=status.HTTP_201_CREATED)
def add_resep_obat(resep_obat: ResepObat):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    try:
        cursor.execute(
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
            """INSERT INTO ResepObat (id_obat, id_pendaftaran, deskripsi)
            VALUES (?, ?, ?)""",
            (resep_obat.id_obat, resep_obat.id_pendaftaran, resep_obat.deskripsi)
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=400, detail="Error adding resep obat")
    finally:
        conn.close()
    return {"message": "Resep obat added successfully"}

<<<<<<< HEAD
@router.get("/getResepObat/{id_resep_obat}", response_model=ResepObat, status_code=status.HTTP_200_OK)
def get_resep_obat(id_resep_obat: int):
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM ResepObat WHERE id_resep_obat = ?", (id_resep_obat,))
        resep_obat = cursor.fetchone()
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Database error: {e}")
    finally:
        conn.close()

=======
@router.get("/getResepObat/{id_resep_obat}", status_code=status.HTTP_200_OK)
def get_resep_obat(id_resep_obat: int):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM ResepObat WHERE id_resep_obat = ?", (id_resep_obat,))
    resep_obat = cursor.fetchone()
    conn.close()
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
    if resep_obat:
        return {
            "id_resep_obat": resep_obat[0],
            "id_obat": resep_obat[1],
            "id_pendaftaran": resep_obat[2],
<<<<<<< HEAD
            "deskripsi": resep_obat[3]
        }
    else:
        raise HTTPException(status_code=404, detail="Resep obat not found")

@router.get("/getAllResepObat", response_model=List[ResepObat], status_code=status.HTTP_200_OK)
def get_all_resep_obat():
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM ResepObat")
    resep_obats = cursor.fetchall()
    conn.close()
    if resep_obats:
        return [
            {
                "id_resep_obat": ro[0],
                "id_obat": ro[1],
                "id_pendaftaran": ro[2],
                "deskripsi": ro[3]
            }
            for ro in resep_obats
        ]
    raise HTTPException(status_code=404, detail="No resep obats found")
=======
            "deskripsi": resep_obat[3],
        }
    raise HTTPException(status_code=404, detail="Resep obat not found")
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
