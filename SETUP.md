# Railway Lavalink v4 — Panduan Setup

## Koneksi Bot Discord

| Setting  | Value                             |
|----------|-----------------------------------|
| Host     | `<domain>.up.railway.app`         |
| Port     | `443`                             |
| Password | `Ariekonur0`                      |
| Secure   | `true`                            |

---

## Cara Mengaktifkan YouTube via OAuth

OAuth memungkinkan Lavalink login ke akun Google agar YouTube tidak memblokir pemutaran musik.

> ⚠️ Gunakan **akun Google burner** (akun baru khusus ini), bukan akun utama.

### Langkah-langkah:

**1. Deploy ke Railway**
Push repo ini ke GitHub → Railway otomatis build.

**2. Buka Logs Railway**
- Buka [railway.app](https://railway.app) → project kamu → tab **Logs**

**3. Cari kode otorisasi di log**
Tunggu hingga muncul log seperti ini:
```
OAUTH INTEGRATION: To give youtube-source access to your account,
go to https://www.google.com/device and enter code XXXX-XXXX
```

**4. Otorisasi di browser**
- Buka `https://www.google.com/device`
- Masukkan kode `XXXX-XXXX` dari log
- Login dengan akun Google burner
- Klik **Izinkan**

**5. Tunggu konfirmasi di log**
```
Token retrieved successfully. Store your refresh token...
```
Setelah muncul log ini, YouTube sudah aktif.

---

## Cara Memperbarui OAuth (Jika Token Expired)

1. Buka Railway → **Variables**
2. Hapus variable `YOUTUBE_REFRESH_TOKEN` (jika ada)
3. Redeploy → ulangi langkah **2–5** di atas

---

## Environment Variables (Opsional — POT Token)

Jika ingin menggunakan POT Token sebagai tambahan bypass:

| Variable               | Keterangan                                    |
|------------------------|-----------------------------------------------|
| `YOUTUBE_PO_TOKEN`     | PO Token YouTube                              |
| `YOUTUBE_VISITOR_DATA` | Visitor Data yang dipasangkan dengan PO Token |

> Tanpa ini, OAuth sudah cukup untuk memutar YouTube.

---

## Troubleshooting

| Masalah                          | Solusi                                                  |
|----------------------------------|---------------------------------------------------------|
| Bot tidak bisa konek             | Pastikan port `443`, secure `true`, password benar      |
| YouTube error / tidak bisa putar | Ulangi proses OAuth — login ulang akun burner           |
| Lavalink crash saat start        | Cek log Railway, biasanya plugin gagal download         |
| Kode otorisasi tidak muncul      | Tunggu ~60 detik setelah deploy, cek log kembali        |
| Lagu stuck / tidak bunyi         | Cek koneksi internet Railway region kamu                |
