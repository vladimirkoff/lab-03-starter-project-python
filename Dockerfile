FROM python:3.10-alpine
WORKDIR /app
COPY requirements/backend.in requirements/backend.in

RUN python -m venv ./.venv
RUN ./.venv/bin/pip install --no-cache-dir -r requirements/backend.in

COPY . .

CMD [".venv/bin/python", "-m", "uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]
