#!/bin/bash
# Descripción: Prueba para create_project_structure.sh

# Ejecutar el script de creación de estructura de proyecto
bash create_project_structure.sh

# Nombre del proyecto
project_name="my_data_science_project"

# Función para verificar la existencia de carpetas y archivos
check_exists() {
    if [ ! -e "$1" ]; then
        echo "Test failed: $1 no existe."
        exit 1
    else
        echo "Test passed: $1 existe."
    fi
}

# Verificar carpetas
check_exists "$project_name/data/raw"
check_exists "$project_name/data/processed"
check_exists "$project_name/data/external"
check_exists "$project_name/notebooks/exploratory"
check_exists "$project_name/notebooks/modeling"
check_exists "$project_name/notebooks/reports"
check_exists "$project_name/src/data"
check_exists "$project_name/src/features"
check_exists "$project_name/src/models"
check_exists "$project_name/src/visualization"
check_exists "$project_name/src/api"
check_exists "$project_name/src/streamlit_app"
check_exists "$project_name/tests/test_data"
check_exists "$project_name/tests/test_features"
check_exists "$project_name/tests/test_models"
check_exists "$project_name/tests/test_visualization"
check_exists "$project_name/tests/test_api"
check_exists "$project_name/examples/example_notebooks"
check_exists "$project_name/docker"

# Verificar archivos __init__.py
check_exists "$project_name/src/__init__.py"
check_exists "$project_name/src/data/__init__.py"
check_exists "$project_name/src/features/__init__.py"
check_exists "$project_name/src/models/__init__.py"
check_exists "$project_name/src/visualization/__init__.py"
check_exists "$project_name/src/api/__init__.py"
check_exists "$project_name/src/streamlit_app/__init__.py"
check_exists "$project_name/tests/__init__.py"
check_exists "$project_name/tests/test_data/__init__.py"
check_exists "$project_name/tests/test_features/__init__.py"
check_exists "$project_name/tests/test_models/__init__.py"
check_exists "$project_name/tests/test_visualization/__init__.py"
check_exists "$project_name/tests/test_api/__init__.py"

# Verificar otros archivos necesarios
check_exists "$project_name/requirements.txt"
check_exists "$project_name/setup.py"
check_exists "$project_name/src/api/app.py"
check_exists "$project_name/src/api/utils.py"
check_exists "$project_name/src/streamlit_app/app.py"
check_exists "$project_name/docker/Dockerfile"
check_exists "$project_name/docker/docker-compose.yml"
check_exists "$project_name/.gitignore"
check_exists "$project_name/README.md"
check_exists "$project_name/CHANGELOG.md"

echo "Todos los tests pasaron exitosamente."