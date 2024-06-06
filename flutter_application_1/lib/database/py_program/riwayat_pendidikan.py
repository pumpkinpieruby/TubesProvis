from pydantic import BaseModel
from fastapi import APIRouter, HTTPException, status
import sqlite3

router = APIRouter()

# Pydantic model for urgent contact data
class RiwayatPendidikan(BaseModel):
    id_riwayat_pend_dokter: int
    univ: str
    prodi: str
    tahun_lulus: int

@router.get("/init/", status_code=status.HTTP_201_CREATED)
def init_db():
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
        cursor.execute(
            """CREATE TABLE IF NOT EXISTS RiwayatPendidikan (
                id_riwayat_pend_dokter INTEGER PRIMARY KEY AUTOINCREMENT,
                univ TEXT NOT NULL,
                prodi TEXT NOT NULL,
                tahun_lulus INTEGER NOT NULL
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


@router.get("/getRiwayatPendidikan/{id_riwayat_pend_dokter}", status_code=status.HTTP_200_OK)
def get_riwayat_pendidikan(id_riwayat_pend_dokter: int):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM RiwayatPendidikan WHERE id_riwayat_pend_dokter = ?", (id_riwayat_pend_dokter,))
    riwayat = cursor.fetchall()
    conn.close()
    if riwayat:
        return [
            {
                "id_riwayat_pend_dokter": pendidikan[0],
                "univ": pendidikan[1],
                "prodi": pendidikan[2],
                "tahun_lulus": pendidikan[3],
            }
            for pendidikan in riwayat
        ]
    raise HTTPException(status_code=404, detail="No riwayat pendidikan found")
