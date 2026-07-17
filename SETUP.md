# Lavalink Railway Setup

## Environment Variables (Railway → Variables)

| Variable | Keterangan |
|---|---|
| `YOUTUBE_REFRESH_TOKEN` | OAuth refresh token YouTube untuk bypass (dapatkan dari log saat pertama deploy) |

## Koneksi Bot

| Setting | Value |
|---|---|
| Host | `lvlink-lavalink.up.railway.app` |
| Port | `443` |
| Password | `Ariekonur0` |
| Secure | `true` |

## Cara dapat YOUTUBE_REFRESH_TOKEN baru

1. Hapus variable `YOUTUBE_REFRESH_TOKEN` di Railway (atau kosongkan nilainya)
2. Redeploy → cari log: `OAUTH INTEGRATION: To give youtube-source access to your account, go to https://www.google.com/device and enter code XXXX`
3. Buka https://www.google.com/device → masukkan kode → login akun burner
4. Tunggu log: `Token retrieved successfully. Store your refresh token...`
5. Salin token → simpan kembali ke Railway variable `YOUTUBE_REFRESH_TOKEN`
