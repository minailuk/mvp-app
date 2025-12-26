FROM oven/bun:1.1

WORKDIR /app

# Копируем зависимости
COPY package.json bun.lockb ./

# Устанавливаем их (кэшируется)
RUN bun install

# Копируем весь код
COPY . .

# Порт для Vite
EXPOSE 5173

# Запускаем dev-сервер правильно
CMD ["bun", "run", "dev", "--", "--host", "0.0.0.0", "--base", "/"]