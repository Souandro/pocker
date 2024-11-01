FROM python:3.13.0-slim

# Instalar dependências do sistema e do Superset
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    libsasl2-dev \
    libldap2-dev \
    python3-dev \
    gcc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalar o Apache Superset e o driver PostgreSQL
RUN pip install apache-superset psycopg2-binary

# Definir ponto de entrada
CMD ["superset", "run", "-h", "0.0.0.0", "-p", "8088"]
