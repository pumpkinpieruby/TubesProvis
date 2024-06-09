from fastapi import APIRouter, HTTPException, Depends, status
from pydantic import BaseModel
from typing import List
import sqlite3

router = APIRouter()

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
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=400, detail="Error adding riwayat pendidikan")
    finally:
        conn.close()
    return {"message": "Riwayat pendidikan added successfully"}

@router.get("/getRiwayatPendidikan/{id_riwayat_pend_dokter}", response_model=RiwayatPendidikan, status_code=status.HTTP_200_OK)
def get_riwayat_pendidikan(id_riwayat_pend_dokter: int):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM RiwayatPendidikan WHERE id_riwayat_pend_dokter = ?", (id_riwayat_pend_dokter,))
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
    riwayat = cursor.fetchall()
    conn.close()
    if riwayat:
        return [
            {
                "id_riwayat_pend_dokter": rp[0],
                "univ": rp[1],
                "prodi": rp[2],
                "tahun_lulus": rp[3]
            }
            for rp in riwayat
        ]
    raise HTTPException(status_code=404, detail="No riwayat pendidikan found")
