# Changelog

Todas las notas importantes sobre los cambios en este proyecto se documentarán en este archivo.

## [0.1.0] - 2024-07-02
### Añadido
- Estructura inicial del proyecto con scripts y pruebas.
- Archivos principales como `README.md`, `.gitignore`, `CHANGELOG.md`, y `LICENSE`.

## Cómo gestionar versiones

- **Versiones mayores (Major):** Se incrementan cuando se hacen cambios significativos que pueden romper la compatibilidad con versiones anteriores (e.g., 1.0.0).
- **Versiones menores (Minor):** Se incrementan cuando se añaden funcionalidades nuevas que son compatibles con las versiones anteriores (e.g., 1.1.0).
- **Parches (Patch):** Se incrementan cuando se corrigen errores o se hacen pequeñas mejoras que no afectan la compatibilidad (e.g., 1.1.1).

Para lanzar una nueva versión:

1. Actualiza el número de versión en `setup.py`.
2. Documenta los cambios en `CHANGELOG.md`.
3. Realiza un commit y etiqueta la nueva versión:
   ```bash
   git commit -am "Lanzamiento de la versión X.Y.Z"
   git tag -a X.Y.Z -m "Lanzamiento de la versión X.Y.Z"
   git push origin --tags
   ```
