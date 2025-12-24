# Aplica as migrações existentes na pasta .migrations
echo "⏳ Aplicando migrações no banco Render..."
npx drizzle-kit migrate

# Verifica se a migração deu certo antes de subir o app
if [ $? -eq 0 ]; then
  echo "✅ Migrations finalizadas"
  echo "🚀 Iniciando servidor..."
  npm start
else
  echo "❌ Erro nas migrações. O servidor não será iniciado."
  exit 1
fi