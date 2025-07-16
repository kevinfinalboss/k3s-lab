#!/bin/bash

echo "=== Validação de Portas ==="

echo "Portas que devem estar livres:"
echo "- 80 (Pterodactyl Panel)"
echo "- 8080 (Wings API)"
echo "- 2022 (Wings SFTP)"
echo ""

echo "Verificando portas em uso:"
netstat -tulnp | grep -E ':80 |:8080 |:2022 '

echo ""
echo "Verificando se as portas estão livres:"

if ! netstat -tuln | grep -q ":80 "; then
    echo "✅ Porta 80 - LIVRE"
else
    echo "❌ Porta 80 - EM USO"
    netstat -tulnp | grep ":80 "
fi

if ! netstat -tuln | grep -q ":8080 "; then
    echo "✅ Porta 8080 - LIVRE"
else
    echo "❌ Porta 8080 - EM USO"
    netstat -tulnp | grep ":8080 "
fi

if ! netstat -tuln | grep -q ":2022 "; then
    echo "✅ Porta 2022 - LIVRE"
else
    echo "❌ Porta 2022 - EM USO"
    netstat -tulnp | grep ":2022 "
fi

echo ""
echo "Portas MySQL e Redis (internas):"
netstat -tulnp | grep -E ':3306 |:6379 '

echo ""
echo "Status dos Serviços:"
echo "Pterodactyl Panel:"
systemctl is-active pterodactyl
echo "MariaDB:"
systemctl is-active mariadb
echo "Redis:"
systemctl is-active redis-server
echo "Queue Worker:"
systemctl is-active pteroq

echo ""
echo "Testando acesso ao Pterodactyl:"
curl -s -o /dev/null -w "%{http_code}\n" http://localhost/