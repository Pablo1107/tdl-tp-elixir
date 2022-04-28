# Requirements

Conseguir un ID de Cliente de Google con permisos para la API de Google Drive:

1. Activar Google Drive API
   https://console.cloud.google.com/marketplace/product/google/drive.googleapis.com

2. Conseguir el ID de Cliente
   https://console.cloud.google.com/apis/credentials

3. Descargar JSON

# Setup

```bash
git annex init
git-annex-remote-googledrive setup --client-secret <path_json>
git annex enableremote drive
git annex sync drive --content
```
