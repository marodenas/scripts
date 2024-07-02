#!/bin/bash

# Project name
project_name="my_data_science_project"

# Create the directory structure
mkdir -p $project_name/{data/{raw,processed,external},notebooks/{exploratory,modeling,reports},src/{data,features,models,visualization,api,streamlit_app},tests/{test_data,test_features,test_models,test_visualization,test_api},examples/example_notebooks,docker}

# Create __init__.py files in the src subdirectories
touch $project_name/src/{__init__.py,data/__init__.py,features/__init__.py,models/__init__.py,visualization/__init__.py,api/__init__.py,streamlit_app/__init__.py}

# Create __init__.py files in the tests subdirectories
touch $project_name/tests/{__init__.py,test_data/__init__.py,test_features/__init__.py,test_models/__init__.py,test_visualization/__init__.py,test_api/__init__.py}

# Create necessary files
touch $project_name/requirements.txt
touch $project_name/setup.py

# Create Python files for API and Streamlit
touch $project_name/src/api/{app.py,utils.py}
touch $project_name/src/streamlit_app/app.py

# Create Dockerfile
cat <<EOL > $project_name/docker/Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt requirements.txt

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container
COPY . .

# Command to run the API (FastAPI)
CMD ["uvicorn", "src.api.app:app", "--host", "0.0.0.0", "--port", "8000"]

# To run Streamlit, uncomment the following line and comment out the previous line
# CMD ["streamlit", "run", "src/streamlit_app/app.py"]
EOL

# Create docker-compose.yml file
cat <<EOL > $project_name/docker/docker-compose.yml
version: '3.8'

services:
  api:
    build:
      context: ..
      dockerfile: docker/Dockerfile
    ports:
      - "8000:8000"
    volumes:
      - ..:/app
    command: uvicorn src.api.app:app --host 0.0.0.0 --port 8000

  streamlit:
    build:
      context: ..
      dockerfile: docker/Dockerfile
    ports:
      - "8501:8501"
    volumes:
      - ..:/app
    command: streamlit run src/streamlit_app/app.py
EOL

# Create requirements.txt file
cat <<EOL > $project_name/requirements.txt
numpy
pandas
matplotlib
seaborn
scikit-learn
fastapi
uvicorn
joblib
streamlit
EOL

# Create setup.py file
cat <<EOL > $project_name/setup.py
from setuptools import setup, find_packages

setup(
    name='my_data_science_project',
    version='0.1',
    packages=find_packages(where='src'),
    package_dir={'': 'src'},
    install_requires=[
        'numpy',
        'pandas',
        'matplotlib',
        'seaborn',
        'scikit-learn',
        'fastapi',
        'uvicorn',
        'joblib',
        'streamlit',
    ],
    test_suite='tests',
)
EOL

# Create .gitignore file
cat <<EOL > $project_name/.gitignore
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Jupyter Notebook
.ipynb_checkpoints

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# mypy
.mypy_cache/

# VS Code
.vscode/
EOL

# Create initial content for src/api/app.py
cat <<EOL > $project_name/src/api/app.py
from fastapi import FastAPI
from pydantic import BaseModel
import joblib

app = FastAPI()

class Data(BaseModel):
    feature1: float
    feature2: float
    feature3: float

model = joblib.load("path_to_your_model.pkl")

@app.post("/predict")
def predict(data: Data):
    input_data = [[data.feature1, data.feature2, data.feature3]]
    prediction = model.predict(input_data)
    return {"prediction": prediction[0]}
EOL

# Create initial content for src/streamlit_app/app.py
cat <<EOL > $project_name/src/streamlit_app/app.py
import streamlit as st
import pandas as pd
import joblib

st.title("Prediction with Machine Learning Model")

model = joblib.load("path_to_your_model.pkl")

feature1 = st.number_input("Feature 1")
feature2 = st.number_input("Feature 2")
feature3 = st.number_input("Feature 3")

if st.button("Predict"):
    input_data = pd.DataFrame([[feature1, feature2, feature3]])
    prediction = model.predict(input_data)
    st.write(f"The prediction is: {prediction[0]}")
EOL

# Create README.md file
cat <<EOL > $project_name/README.md
# Project Name

This repository contains a portfolio of data science projects that demonstrate skills in data analysis, predictive modeling, visualization, API development with FastAPI, and creating interactive applications with Streamlit.

## Table of Contents

1. [Introduction](#introduction)
2. [Project Description](#project-description)
3. [Project Structure](#project-structure)
4. [Requirements](#requirements)
5. [Installation](#installation)
6. [Usage](#usage)
7. [Examples](#examples)
8. [Changelogs](#changelogs)
9. [API](#api)
10. [Streamlit Application](#streamlit-application)
11. [Contributions](#contributions)
12. [License](#license)
13. [Contact](#contact)

## Introduction

Briefly describe the purpose of the project and its importance.

## Project Description

Explain the project in detail, including:

- Objectives
- Methodology used
- Expected or achieved results
- Technologies and tools used

## Project Structure

Provide an overview of the project structure:

\`\`\`
my_data_science_project/
│
├── data/
│   ├── raw/              # Original unprocessed data
│   ├── processed/        # Processed data for analysis and modeling
│   └── external/         # External data used in the project
│
├── notebooks/
│   ├── exploratory/      # Notebooks for exploratory analysis
│   ├── modeling/         # Notebooks for model building and evaluation
│   └── reports/          # Notebooks with final results and reports
│
├── src/
│   ├── __init__.py       # Makes src a Python package
│   ├── data/             # Modules for data loading and transformation
│   │   └── __init__.py
│   ├── features/         # Modules for feature engineering
│   │   └── __init__.py
│   ├── models/           # Modules for model building, training, and evaluation
│   │   └── __init__.py
│   ├── visualization/    # Modules for generating visualizations
│   │   └── __init__.py
│   ├── api/              # Modules for the API
│   │   ├── __init__.py
│   │   ├── app.py        # API definition with FastAPI or Flask
│   │   └── utils.py      # Utilities for the API
│   └── streamlit_app/    # Streamlit application
│       ├── __init__.py
│       └── app.py        # Streamlit application definition
│
├── tests/
│   ├── __init__.py       # Makes tests a Python package
│   ├── test_data/        # Tests for data loading and transformation
│   │   └── __init__.py
│   ├── test_features/    # Tests for feature engineering
│   │   └── __init__.py
│   ├── test_models/      # Tests for model building, training, and evaluation
│   │   └── __init__.py
│   ├── test_visualization/ # Tests for generating visualizations
│   │   └── __init__.py
│   └── test_api/         # Tests for the API
│       └── __init__.py
│
├── examples/
│   └── example_notebooks/ # Example notebooks using the developed library
│
├── docker/
│   ├── Dockerfile        # Dockerfile for building the project image
│   └── docker-compose.yml # Docker Compose configuration
│
├── .gitignore            # Files and folders to ignore in version control
├── README.md             # Project overview
├── requirements.txt      # List of project dependencies
└── setup.py              # Script for installing the src package
\`\`\`

## Requirements

List the dependencies and requirements needed to run the project:

- Python 3.x
- Libraries specified in `requirements.txt`

## Installation

Step-by-step instructions on how to set up the development environment:

1. Clone the repository:
   \`\`\`bash
   git clone https://github.com/your_username/your_project.git
   cd your_project
   \`\`\`

2. Create a virtual environment and install dependencies:
   \`\`\`bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   pip install -r requirements.txt
   \`\`\`

## Usage

Examples of how to run specific scripts or notebooks:

1. Run a notebook:
   \`\`\`bash
   jupyter notebook notebooks/exploratory/your_notebook.ipynb
   \`\`\`

2. Run the API:
   \`\`\`bash
   uvicorn src.api.app:app --reload
   \`\`\`

3. Run the Streamlit application:
   \`\`\`bash
   streamlit run src/streamlit_app/app.py
   \`\`\`

## Examples

Provide links or instructions to run example notebooks:

- [Exploratory Analysis Notebook](notebooks/exploratory/example_notebook.ipynb)
- [Modeling Notebook](notebooks/modeling/example_notebook.ipynb)

## Changelogs

### How to Manage Versions

- **Major versions:** Increment when making significant changes that might break backward compatibility (e.g., 1.0.0).
- **Minor versions:** Increment when adding new features that are backward compatible (e.g., 1.1.0).
- **Patch versions:** Increment when making bug fixes or small improvements that do not affect compatibility (e.g., 1.1.1).

To release a new version:

1. Update the version number in `setup.py`.
2. Document the changes in `CHANGELOG.md`.
3. Commit and tag the new version:
   \`\`\`bash
   git commit -am "Release version X.Y.Z"
   git tag -a X.Y.Z -m "Release version X.Y.Z"
   git push origin --tags
   \`\`\`

## API

Description of available API endpoints and usage examples:

- **POST /predict**
  - Input: JSON with model features
  - Output: JSON with the prediction
  - Example usage:
    \`\`\`bash
    curl -X POST "http://127.0.0.1:8000/predict" -H "Content-Type: application/json" -d '{"feature1": 1.0, "feature2": 2.0, "feature3": 3.0}'
    \`\`\`

## Streamlit Application

Instructions on how to use the Streamlit application:

- Run the application:
  \`\`\`bash
  streamlit run src/streamlit_app/app.py
  \`\`\`

## Contributions

Instructions on how others can contribute to your project:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/new_feature`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push your changes to your repository (`git push origin feature/new_feature`).
5. Open a Pull Request.

## License

Indicate the license under which the project is distributed, for example:

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

Provide contact information or links to your social media:

- Author: [Your Name](https://your-link)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/your-profile)
- Email: your_email@example.com
EOL

# Create CHANGELOG.md file
cat <<EOL > $project_name/CHANGELOG.md
# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - YYYY-MM-DD
### Added
- Initial project structure with folders for data, notebooks, src, tests, examples, and docker.
- Main files such as \`README.md\`, \`.gitignore\`, \`setup.py\`, \`requirements.txt\`, and \`CHANGELOG.md\`.
- Initial modules for the API and Streamlit.

EOL

echo "Project structure created successfully."
