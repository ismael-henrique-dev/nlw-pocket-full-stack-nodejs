#!/bin/sh

echo "🚀 Rodando migrations com Drizzle..."
npx drizzle-kit push

echo "✅ Migrations finalizadas"
echo "🚀 Iniciando servidor..."

npm start
