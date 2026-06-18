# SMART Reverse Counting API

Backend Spring Boot untuk menghitung selisih positif antara angka dan angka yang dibalik.

## Arsitektur

- `domain`: aturan bisnis murni, tanpa dependency Spring.
- `application`: use case dan boundary aplikasi.
- `infrastructure`: REST controller, DTO HTTP, konfigurasi bean, dan error handler.

## Endpoint

`POST /api/v1/reverse-difference`

Request:

```json
{
  "number": "1.2"
}
```

Response:

```json
{
  "originalInput": "1.2",
  "normalizedNumber": "12",
  "reversedNumber": "21",
  "difference": "9"
}
```

Karakter selain digit akan diabaikan, sehingga `1.2` atau `1,2` diproses sebagai `12`.

## Menjalankan

```bash
./gradlew bootRun
```

## Test

```bash
./gradlew test
```
