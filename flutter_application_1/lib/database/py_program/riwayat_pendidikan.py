<<<<<<< HEAD
from fastapi import APIRouter, HTTPException, Depends, status
from pydantic import BaseModel
from typing import List
=======
from pydantic import BaseModel
from fastapi import APIRouter, HTTPException, status
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
import sqlite3

router = APIRouter()

<<<<<<< HEAD
class RiwayatPendidikan(BaseModel):
    id_riwayat_pend_dokter: int
    univ: str
    prodi: str
    tahun_lulus: int

@router.post("/addRiwayatPendidikan", status_code=status.HTTP_201_CREATED)
def add_riwayat_pendidikan(riwayat_pendidikan: RiwayatPendidikan):
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
        cursor.execute(
            """INSERT INTO RiwayatPendidikan (id_riwayat_pend_dokter, univ, prodi, tahun_lulus)
            VALUES (?, ?, ?, ?)""",
            (riwayat_pendidikan.id_riwayat_pend_dokter, riwayat_pendidikan.univ, riwayat_pendidikan.prodi, riwayat_pendidikan.tahun_lulus)
=======
# Pydantic model for RiwayatPendidikan data
class RiwayatPendidikan(BaseModel):
    id_riwayat_pend_dokter: int
    S1: str | None = None
    S2: str | None = None
    S3: str | None = None

@router.get("/init/", status_code=status.HTTP_201_CREATED)
def init_db():
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
        cursor.execute("DROP TABLE IF EXISTS RiwayatPendidikan")  # Drop the existing table if it exists
        cursor.execute(
            """CREATE TABLE IF NOT EXISTS RiwayatPendidikan (
                id_riwayat_pend_dokter INTEGER PRIMARY KEY AUTOINCREMENT,
                S1 TEXT,
                S2 TEXT,
                S3 TEXT
            )"""
        )
        conn.commit()
    except Exception as e:
        return {"status": f"Error saat membuat tabel: {e}"}
    finally:
        conn.close()
    return {"status": "Berhasil membuat tabel Riwayat Pendidikan"}

@router.post("/addRiwayatPendidikan", status_code=status.HTTP_201_CREATED)
def add_riwayat_pendidikan(riwayat_pendidikan: RiwayatPendidikan):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    try:
        cursor.execute(
            """INSERT INTO RiwayatPendidikan (id_riwayat_pend_dokter, S1, S2, S3)
            VALUES (?, ?, ?, ?)""",
            (riwayat_pendidikan.id_riwayat_pend_dokter, riwayat_pendidikan.S1, riwayat_pendidikan.S2, riwayat_pendidikan.S3)
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=400, detail="Error adding riwayat pendidikan")
    finally:
        conn.close()
    return {"message": "Riwayat pendidikan added successfully"}

<<<<<<< HEAD
@router.get("/getRiwayatPendidikan/{id_riwayat_pend_dokter}", response_model=RiwayatPendidikan, status_code=status.HTTP_200_OK)
=======
@router.get("/getRiwayatPendidikan/{id_riwayat_pend_dokter}", status_code=status.HTTP_200_OK)
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
def get_riwayat_pendidikan(id_riwayat_pend_dokter: int):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM RiwayatPendidikan WHERE id_riwayat_pend_dokter = ?", (id_riwayat_pend_dokter,))
<<<<<<< HEAD
    riwayat = cursor.fetchone()
    conn.close()
    if riwayat:
        return {
            "id_riwayat_pend_dokter": riwayat[0],
            "univ": riwayat[1],
            "prodi": riwayat[2],
            "tahun_lulus": riwayat[3]
        }
    raise HTTPException(status_code=404, detail="Riwayat pendidikan not found")

@router.get("/getAllRiwayatPendidikan", response_model=List[RiwayatPendidikan], status_code=status.HTTP_200_OK)
def get_all_riwayat_pendidikan():
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM RiwayatPendidikan")
=======
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
    riwayat = cursor.fetchall()
    conn.close()
    if riwayat:
        return [
            {
<<<<<<< HEAD
                "id_riwayat_pend_dokter": rp[0],
                "univ": rp[1],
                "prodi": rp[2],
                "tahun_lulus": rp[3]
            }
            for rp in riwayat
=======
                "id_riwayat_pend_dokter": pendidikan[0],
                "S1": pendidikan[1],
                "S2": pendidikan[2],
                "S3": pendidikan[3],
            }
            for pendidikan in riwayat
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
        ]
    raise HTTPException(status_code=404, detail="No riwayat pendidikan found")
