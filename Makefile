PYTHON=python3
APP=src.main:app
ENV=venv
SOURCE=./src/

# Instalación de dependencias
install:
	pip install -r requirements.txt

# Activar el entorno virtual
venv:
	source venv/bin/activate

# Formatear código
format:
	black $(SOURCE)

# Linting
lint:
	flake8 $(SOURCE)

# Ejecutar pruebas
test:
	pytest

# Ejecutar la aplicación
run:
	uvicorn $(APP) --reload

# Eliminar archivos temporales
clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -exec rm -r {} +

# Eliminar dependencias e instalar de nuevo
reinstall:
	pip uninstall -r requirements.txt -y && pip install -r requirements.txt

# Ejecutar todas las tareas principales
all: install format lint test run

# Mostrar ayuda
help:
	@echo "Comandos disponibles:"
	@echo "  install        Instalar dependencias"
	@echo "  venv           Activar entorno virtual"
	@echo "  format         Formatear código con Black"
	@echo "  lint           Verificar calidad del código con Flake8"
	@echo "  test           Ejecutar pruebas con pytest"
	@echo "  run            Ejecutar el servidor de desarrollo"
	@echo "  clean          Eliminar archivos temporales"
	@echo "  reinstall      Reinstalar dependencias"
	@echo "  all            Ejecutar todas las tareas principales"
