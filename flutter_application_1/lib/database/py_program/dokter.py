from pydantic import BaseModel
from fastapi import APIRouter, HTTPException, status
import sqlite3

router = APIRouter()

# Pydantic model for doctor data
class Doctor(BaseModel):
    id_doctor: int
    doctor_STR: str
    doctor_price: str
    id_jadwal_dokter: int
    id_riwayat_pendidikan_dokter: int
    id_riwayat_praktik_dokter: int

# Init db for doctor
@router.get("/init/", status_code=status.HTTP_201_CREATED)
def init_db():
    try:
        conn = sqlite3.connect("carewave.db")
        cursor = conn.cursor()
        cursor.execute(
            """CREATE TABLE IF NOT EXISTS Doctor(
                id_doctor INTEGER PRIMARY KEY AUTOINCREMENT,
                doctor_STR TEXT NOT NULL,
                doctor_price TEXT NOT NULL,
                id_jadwal_dokter INTEGER NOT NULL,
                id_riwayat_pendidikan_dokter INTEGER NOT NULL,
                id_riwayat_praktik_dokter INTEGER NOT NULL,
                FOREIGN KEY (id_jadwal_dokter) REFERENCES JadwalDokter(id_jadwal_dokter),
                FOREIGN KEY (id_riwayat_pendidikan_dokter) REFERENCES RiwayatPendidikanDokter(id_riwayat_pendidikan_dokter),
                FOREIGN KEY (id_riwayat_praktik_dokter) REFERENCES RiwayatPraktikDokter(id_riwayat_praktik_dokter)
            )"""  # Menambahkan tanda kurung yang hilang di sini
        )
        conn.commit()
    except Exception as e:
        return {"status": f"Error saat membuat tabel: {e}"}
    finally:
        conn.close()
    return {"status": "Berhasil membuat tabel Doctor"}

# Adding Doctor
@router.post("/addDoctor", status_code=status.HTTP_201_CREATED)
def add_doctor(doctor: Doctor):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    try:
        cursor.execute(
            """INSERT INTO Doctor (id_doctor, doctor_STR, doctor_price, id_jadwal_dokter, id_riwayat_pendidikan_dokter, id_riwayat_praktik_dokter)
            VALUES (?, ?, ?, ?, ?, ?)""",
            (doctor.id_doctor, doctor.doctor_STR, doctor.doctor_price, doctor.id_jadwal_dokter, doctor.id_riwayat_pendidikan_dokter, doctor.id_riwayat_praktik_dokter)
        )
        conn.commit()
    except sqlite3.IntegrityError:
        raise HTTPException(status_code=400, detail="Error adding doctor")
    finally:
        conn.close()
    return {"message": "Doctor added successfully"}

# Getting all doctor for a user
@router.get("/getDoctor/{id_doctor}", status_code=status.HTTP_200_OK)
def get_doctor(id_doctor: int):
    conn = sqlite3.connect("carewave.db")
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Doctor WHERE id_doctor = ?", (id_doctor,))
    doctors = cursor.fetchall()
    conn.close()
    if doctors:
        return [
            {
                "id_doctor": doctor[0],
                "doctor_STR": doctor[1],
                "doctor_price": doctor[2],
                "id_jadwal_dokter": doctor[3],
                "id_riwayat_pendidikan_dokter": doctor[4],
                "id_riwayat_praktik_dokter": doctor[5]
            }
            for doctor in doctors
        ]
    raise HTTPException(status_code=404, detail="No doctors found")
