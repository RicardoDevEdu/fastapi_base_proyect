PYTHON=python3
APP=src.main:app
ENV=venv
SOURCE=./src/

install:
	pip install -r requirements.txt

format:
	black $(SOURCE)

lint:
	flake8 $(SOURCE)

type-check:
	mypy src/

test:
	pytest $(SOURCE)/test/

test-cover:
	pytest --cov-report html --cov=./ $(SOURCE)/test

run:
	uvicorn $(APP) --reload

clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -exec rm -r {} +

reinstall:
	pip uninstall -r requirements.txt -y && pip install -r requirements.txt

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
