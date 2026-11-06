# Використання

## Передумови

- Node.js 22 або сумісніша версія, npm і Git.
- VS Code із GitHub Copilot Chat для використання workspace agent та prompt commands.

## Робота з AI-агентом

1. Відкрийте workspace у VS Code і виберіть агента **Build Engineer** із `.github/agents/build-engineer.agent.md`.
2. Для повного налаштування викличте prompt `/init`. Оркестратор виконує Git setup, scaffold, build/test, CI та фінальну перевірку по черзі й зупиняється при помилці.
3. Для окремих операцій викликайте `/git-init`, `/create-project`, `/create-build`, `/create-actions` або `/check`.

Prompt commands доступні через поле Copilot Chat, набравши `/`, або через команду VS Code **Chat: Run Prompt...**. Кожен prompt можна відкрити й запустити окремо.

## Локальне встановлення та перевірка

У корені проєкту виконайте:

```sh
npm install
npm run build
npm run test
```

Для повного локального CI:

- Windows: `ci.bat`
- Linux/macOS: `bash ./ci.sh`

Скрипти встановлюють npm-залежності, збирають TypeScript і запускають Vitest. Вони повертають помилку, якщо будь-який крок завершується невдало.
