FROM python:3.9-alpine

WORKDIR /app

# Copie o arquivo de requisitos para o contêiner
COPY requirements.txt .

# Instale as dependências do Python
RUN apk add --no-cache build-base openssl-dev libffi-dev \
    && apk add --no-cache python3-dev \
    && pip install --no-cache-dir -r requirements.txt

# Instale os pacotes de idioma para português
RUN apk add --no-cache gettext
RUN apk add vim nano nginx bash


# Configure o idioma da aplicação
ENV LANG=pt_BR.UTF-8
ENV LC_ALL=pt_BR.UTF-8

# Copie o código da aplicação Flask para o contêiner
COPY app/ app/
COPY tailwind.config.js .
COPY package.json .
COPY package-lock.json .
COPY src/ src/
COPY settings.toml .
COPY config.py .
COPY migrations/ migrations/
COPY privkey.pem /etc/nginx/
COPY fullchain.pem /etc/nginx/
COPY nginx.conf /etc/nginx/
COPY start.sh .
# Defina as permissões de execução para o script de inicialização
RUN chmod +x ./start.sh

# Defina as variáveis de ambiente
ENV FLASK_APP=app
ENV FLASK_ENV=production

# Compile os arquivos CSS usando o Tailwind
RUN apk add --no-cache nodejs npm tzdata \
    && npm ci \
    && npm run build:css

# Exponha a porta 8080 para o Gunicorn
EXPOSE 8080
EXPOSE 8443
# Inicie o aplicativo usando o script de inicialização
ENTRYPOINT ["./start.sh"]
