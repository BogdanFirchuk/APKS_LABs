# Архітектура проєкту

Проєкт реалізує Варіант 6 на TypeScript із Vitest. Конфігурація TypeScript використовує ES2022 та Node.js ESM (`NodeNext`); команди збірки й тестування доступні через npm.

## Ролі та компоненти агента

- **Build Engineer** (`.github/agents/build-engineer.agent.md`) працює з TypeScript-конфігурацією, npm scripts, Vitest і CI. Він зберігає наявні зміни, не видаляє файли, не розкриває секрети та перевіряє `.gitignore`.
- **Skills** у `.github/skills/` задають спеціалізовані процедури: `project-scaffold` для структури TypeScript-проєкту, `build-and-test` для Vitest та npm scripts, `github-actions` для локальних і hosted CI.
- **Prompt commands** у `.github/prompts/` є окремими операціями: `git-init`, `create-project`, `create-build`, `create-actions` і `check`.
- **Оркестратор** (`.github/prompts/init.prompt.md`) проходить ці операції в послідовності Git → scaffold → build/test → CI → check.

## Обробка помилок і безпека

Кожен етап перевіряє свої передумови та повідомляє про помилки. Оркестратор зупиняється після невдалої команди чи заблокованого етапу та не запускає наступні кроки, щоб не позначати частково налаштований проєкт як успішний. Перевірки не повинні приховувати коди помилок.

Агент не видаляє файли або каталоги, не перезаписує сторонні зміни та не додає секрети. `.gitignore` має виключати залежності, артефакти збірки, coverage й локальні файли середовища із секретами. GitHub Actions використовує мінімальні потрібні дозволи.

## CI-потік

`ci.bat` (Windows) і `ci.sh` (Linux/macOS) виконують `npm install`, `npm run build` і `npm run test`. Workflow `.github/workflows/ci.yml` повторює цей процес для Ubuntu, Windows і macOS на `push` та `pull_request` до `develop` і `master`.
