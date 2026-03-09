#!/bin/bash

CONTAINER_NAME="redscan"
IMAGE_NAME="bladscan/redscan_discovery"
PORT="3002"

echo "========================================="
echo "     RedScan Discovery Installer"
echo "========================================="

# Verifica se é root
if [ "$EUID" -ne 0 ]; then
  echo "[INFO] Execute como root ou com sudo"
  exit 1
fi

# Verifica se docker existe
if ! command -v docker &> /dev/null
then
    echo "[INFO] Docker não encontrado. Instalando docker.io..."

    apt update
    apt install -y docker.io

    systemctl enable docker
    systemctl start docker

    echo "[OK] Docker instalado com sucesso"
else
    echo "[OK] Docker já instalado"
fi

# garante que docker está rodando
systemctl start docker

# remove container antigo
if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}\$"; then
    echo "[INFO] Removendo container antigo..."

    docker stop $CONTAINER_NAME >/dev/null 2>&1
    docker rm $CONTAINER_NAME >/dev/null 2>&1
fi

# baixa imagem
echo "[INFO] Baixando imagem do Docker Hub..."
docker pull $IMAGE_NAME

# sobe container
echo "[INFO] Iniciando RedScan Discovery..."

docker run -d -it \
    --name $CONTAINER_NAME \
    -p $PORT:3000 \
    --restart unless-stopped \
    $IMAGE_NAME

echo ""
echo "========================================="
echo "RedScan Discovery instalado com sucesso!"
echo "========================================="
echo ""
echo "Acesse:"
echo ""
echo "http://localhost:$PORT"
echo ""
echo "Ver logs:"
echo "docker logs -f $CONTAINER_NAME"
echo ""
