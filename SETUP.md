# Railway Lavalink v4 — Panduan Setup

## Koneksi Bot Discord

| Setting  | Value                                      |
|----------|--------------------------------------------|
| Host     | `<domain>.up.railway.app`                  |
| Port     | `443`                                      |
| Password | `Ariekonur0`                               |
| Secure   | `true`                                     |

---

## Environment Variables (Railway → Variables)

| Variable               | Keterangan                                      |
|------------------------|-------------------------------------------------|
| `YOUTUBE_PO_TOKEN`     | PO Token YouTube untuk bypass bot detection     |
| `YOUTUBE_VISITOR_DATA` | Visitor Data yang dipasangkan dengan PO Token   |

> Kedua variabel bersifat **opsional** — Lavalink tetap jalan tanpa ini,
> tapi YouTube bisa rate-limit jika tidak diisi.

---

## Cara Mendapatkan PO Token & Visitor Data

### Metode 1 — Extension Browser (Paling Mudah)

1. Install extension **"YouTube PO Token Generator"** di Chrome/Firefox
2. Buka [youtube.com](https://youtube.com) dan putar video apapun
3. Klik icon extension → copy **PO Token** dan **Visitor Data**
4. Isi ke Railway Variables:
   - `YOUTUBE_PO_TOKEN` → paste PO Token
   - `YOUTUBE_VISITOR_DATA` → paste Visitor Data
5. Redeploy Railway

### Metode 2 — Script Node.js (Tanpa Extension)

1. Install: `npm install youtube-po-token-generator`
2. Jalankan:
```js
const { generate } = require('youtube-po-token-generator');
generate().then(console.log);
```
3. Output berisi `poToken` dan `visitorData` → isi ke Railway Variables

---

## Cara Deploy ke Railway

1. Push repo ini ke GitHub
2. Buka [railway.app](https://railway.app) → **New Project** → **Deploy from GitHub repo**
3. Pilih repo ini
4. Railway otomatis detect `Dockerfile` dan build
5. Setelah deploy, buka tab **Settings → Networking → Generate Domain**
6. Domain itulah yang dipakai sebagai **Host** di bot kamu

---

## Cara Update PO Token (Jika YouTube Error)

1. Generate token baru (ulangi langkah di atas)
2. Update nilai `YOUTUBE_PO_TOKEN` & `YOUTUBE_VISITOR_DATA` di Railway Variables
3. Railway otomatis restart — **tidak perlu redeploy penuh**

---

## Troubleshooting

| Masalah                        | Solusi                                              |
|-------------------------------|-----------------------------------------------------|
| Bot tidak bisa konek           | Pastikan port `443`, secure `true`, password benar  |
| YouTube tidak bisa diputar     | Isi/update `YOUTUBE_PO_TOKEN` & `YOUTUBE_VISITOR_DATA` |
| Lavalink crash saat start      | Cek log Railway, biasanya plugin gagal download     |
| Lagu stuck / tidak bunyi       | Cek koneksi internet Railway region kamu            |
