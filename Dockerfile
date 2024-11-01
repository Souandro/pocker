FROM python:3.13.0-slim

# Instalar dependências do sistema e do Superset
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    libsasl2-dev \
    libldap2-dev \
    python-dev \
    gcc \
    && apt-get clean

# Instalar o Apache Superset e o driver PostgreSQL
RUN pip install apache-superset psycopg2-binary

# Inicializar o Superset
RUN superset db upgrade && \
    superset init

# Definir ponto de entrada
CMD ["superset", "run", "-h", "0.0.0.0", "-p", "8088"]
