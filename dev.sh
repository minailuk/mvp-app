#!/bin/bash

echo "Останавливаем старый контейнер (если был)..."
docker compose down

echo "Запускаем mvp-app на http://localhost:5173 ..."
docker compose up --build &

# Ждём, пока контейнер запустится в фоне
CONTAINER_PID=$!

# Даём Vite время на запуск (обычно хватает 10–15 секунд)
echo "Ждём запуска Vite dev-сервера..."
sleep 10

# Открываем браузер
open http://localhost:5173

echo "Браузер открыт! Если страница ещё грузится — подожди пару секунд."

# Возвращаем терминал в foreground, чтобы ты видел логи
wait $CONTAINER_PID