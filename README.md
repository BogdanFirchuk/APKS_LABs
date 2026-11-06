# Варіант 6: TypeScript / Vitest

**ПІП:** [Фірчук Богдан Тарасович]
**Група:** [Кі-404]
**Варіант:** 6

Навчальний TypeScript-проєкт із Node.js ES Modules, збіркою через TypeScript та юніт-тестами Vitest. Функція `add(a, b)` повертає суму двох чисел; entry point виводить `Hello World`.

## Встановлення та перевірка

Потрібні Node.js 22 або сумісніша версія, npm і Git.

```sh
npm install
npm run build
npm run test
```

Локальний CI запускається скриптом `ci.bat` у Windows або `bash ./ci.sh` у Linux/macOS. GitHub Actions виконує збірку й тести на Ubuntu, Windows і macOS для push та pull request до гілок `develop` і `master`.

## AI-агент

У VS Code відкрийте Copilot Chat і виберіть workspace agent **Build Engineer**. Prompt `/init` проходить етапи ініціалізації Git, створення проєкту, налаштування збірки й тестів, створення CI та фінальної перевірки. Для окремих операцій доступні `/git-init`, `/create-project`, `/create-build`, `/create-actions` і `/check`. Подробиці наведені в [docs/usage.md](docs/usage.md) та [docs/architecture.md](docs/architecture.md).
