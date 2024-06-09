<<<<<<< HEAD
from fastapi import APIRouter, HTTPException, status, Path
from pydantic import BaseModel
from typing import List, Optional
=======
# routers/jadwal_dokter.py
from pydantic import BaseModel
from fastapi import APIRouter, HTTPException, status
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
import sqlite3

router = APIRouter()

<<<<<<< HEAD
# Pydantic model for JadwalDokter
class JadwalDokter(BaseModel):
    id_jadwal_dokter: Optional[int] = None
    hari: str
    jam_masuk: str
    jam_selesai: str
    doctor_name: str
    id_doctor: int

# Menambahkan jadwal dokter
@router.post("/", status_code=status.HTTP_201_CREATED)
=======
# Pydantic model for JadwalDokter data
class JadwalDokter(BaseModel):
    id_jadwal_dokter: int
    hari: str
    jam_masuk: str
    jam_selesai: str

@router.get("/init/", status_code=status.HTTP_201_CREATED)
def init_db():
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
        cursor.execute(
            """CREATE TABLE IF NOT EXISTS JadwalDokter (
                id_jadwal_dokter INTEGER PRIMARY KEY AUTOINCREMENT,
                hari TEXT NOT NULL,
                jam_masuk TEXT NOT NULL,
                jam_selesai TEXT NOT NULL
            )"""
        )
        conn.commit()
    except Exception as e:
        return {"status": f"Error saat membuat tabel: {e}"}
    finally:
        conn.close()
    return {"status": "Berhasil membuat tabel Jadwal Dokter"}

@router.post("/addJadwalDokter", status_code=status.HTTP_201_CREATED)
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
def add_jadwal_dokter(jadwal_dokter: JadwalDokter):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    try:
        cursor.execute(
<<<<<<< HEAD
            """INSERT INTO JadwalDokter (hari, jam_masuk, jam_selesai, id_doctor)
            VALUES (?, ?, ?, ?)""",
            (jadwal_dokter.hari, jadwal_dokter.jam_masuk, jadwal_dokter.jam_selesai, jadwal_dokter.id_doctor)
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=400, detail="Error adding jadwal dokter")
=======
            """INSERT INTO JadwalDokter (id_jadwal_dokter, hari, jam_masuk, jam_selesai)
            VALUES (?, ?, ?, ?)""",
            (jadwal_dokter.id_jadwal_dokter, jadwal_dokter.hari, jadwal_dokter.jam_masuk, jadwal_dokter.jam_selesai)
        )
        conn.commit()
    except sqlite3.IntegrityError as e:
        raise HTTPException(status_code=400, detail=f"Error adding jadwal dokter: {e}")
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
    finally:
        conn.close()
    return {"message": "Jadwal dokter added successfully"}

<<<<<<< HEAD
# Mendapatkan semua jadwal dokter
@router.get("/getAllJadwal", response_model=List[JadwalDokter], status_code=status.HTTP_200_OK)
def get_all_jadwal():
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("""
        SELECT j.id_jadwal_dokter, j.hari, j.jam_masuk, j.jam_selesai, d.doctor_name, j.id_doctor
        FROM JadwalDokter j
        JOIN Doctor d ON j.id_doctor = d.id_doctor
    """)
=======
@router.get("/getJadwalDokter/{id_jadwal_dokter}", status_code=status.HTTP_200_OK)
def get_jadwal_dokter(id_jadwal_dokter: int):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM JadwalDokter WHERE id_jadwal_dokter = ?", (id_jadwal_dokter,))
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
    jadwal = cursor.fetchall()
    conn.close()
    if jadwal:
        return [
            {
<<<<<<< HEAD
                "id_jadwal_dokter": j[0],
                "hari": j[1],
                "jam_masuk": j[2],
                "jam_selesai": j[3],
                "doctor_name": j[4],
                "id_doctor": j[5]
            }
            for j in jadwal
        ]
    raise HTTPException(status_code=404, detail="No schedules found")

# Mendapatkan jadwal dokter berdasarkan ID
@router.get("/getJadwalByDoctor/{id_doctor}", response_model=List[JadwalDokter], status_code=status.HTTP_200_OK)
def get_jadwal_by_doctor(id_doctor: int = Path(..., title="The ID of the doctor to get schedules for", ge=1)):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT j.id_jadwal_dokter, j.hari, j.jam_masuk, j.jam_selesai, d.doctor_name, j.id_doctor FROM JadwalDokter j JOIN Doctor d ON j.id_doctor = d.id_doctor WHERE j.id_doctor = ?", (id_doctor,))
    jadwal = cursor.fetchall()
    conn.close()
    if jadwal:
        return [
            {
                "id_jadwal_dokter": j[0],
                "hari": j[1],
                "jam_masuk": j[2],
                "jam_selesai": j[3],
                "doctor_name": j[4],
                "id_doctor": j[5]
            }
            for j in jadwal
        ]
    raise HTTPException(status_code=404, detail="No schedules found")

# Memperbarui jadwal dokter
@router.put("/{id_jadwal_dokter}", response_model=JadwalDokter, status_code=status.HTTP_200_OK)
def update_jadwal_dokter(jadwal_dokter: JadwalDokter, id_jadwal_dokter: int = Path(..., title="The ID of the jadwal dokter to update", ge=1)):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    try:
        cursor.execute(
            """UPDATE JadwalDokter
            SET hari = ?, jam_masuk = ?, jam_selesai = ?, id_doctor = ?
            WHERE id_jadwal_dokter = ?""",
            (jadwal_dokter.hari, jadwal_dokter.jam_masuk, jadwal_dokter.jam_selesai, jadwal_dokter.id_doctor, id_jadwal_dokter)
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=400, detail="Error updating jadwal dokter")
    finally:
        conn.close()
    return jadwal_dokter

# Menghapus jadwal dokter
@router.delete("/{id_jadwal_dokter}", status_code=status.HTTP_200_OK)
def delete_jadwal_dokter(id_jadwal_dokter: int = Path(..., title="The ID of the jadwal dokter to delete", ge=1)):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("DELETE FROM JadwalDokter WHERE id_jadwal_dokter = ?", (id_jadwal_dokter,))
    conn.commit()
    conn.close()
    return {"message": "Jadwal dokter deleted successfully"}
=======
                "id_jadwal_dokter": jadwalDokter[0],
                "hari": jadwalDokter[1],
                "jam_masuk": jadwalDokter[2],
                "jam_selesai": jadwalDokter[3],
            }
            for jadwalDokter in jadwal
        ]
    raise HTTPException(status_code=404, detail="No jadwal dokter found")
>>>>>>> 264c27a619a9c038928accefda1f718701ea38e9
