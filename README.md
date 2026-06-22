# DevOps СИТУ Лабораторная работа №1: Скрипт запроса данных с использованием библиотеки jq

## Bash

Bash-скрипт, который получает информацию о GitHub пользователе и добавляет запись в HTML. Каждый запуск дописывает новую строку в журнал статистики

---

## Описание

Скрипт обращается к бесплатному GitHub API и получает данные о пользователе в формате JSON и извлекает:

- количество публичных репозиториев
- количество подписчиков
- дату обновления записи

Затем он дописывает новую строку в HTML-таблицу, расположенную по умолчанию в `/var/www/html/index.html`.

Если файла не существует - скрипт создаёт его с базовой HTML-структурой

---

## Как это работает

- Вы передаёте имя пользователя GitHub аргументом командной строки (например, `torvalds` или `microsoft`)
- Скрипт делает запрос к `https://api.github.com/users/USERNAME`
- Парсит JSON с помощью `jq`
- Извлекает нужные поля:
  - `.public_repos`
  - `.followers`
- Добавляет новую строку в HTML-файл
- Выводит сообщение о добавлении записи

---

## Ключевые особенности

- 📈 Постепенное накопление записей - журнал статистики растёт со временем
- 🧾 Логирование в HTML таблицу
- 🔄 Поддержка cron (автоматический запуск раз в минуту)
- 🌐 Вывод доступен через Nginx
- ⚡ Используется GitHub API без ключа

---

## Установка

### Ubuntu / Debian:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install nginx
sudo apt install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh
ssh-keygen -t ed25519 -C "your_email@example.com" Дальше просто жми Enter на все вопросы:
cat ~/.ssh/id_ed25519.pub
 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI... your_email@example.com это скопировать на гитхаб
apt install curl
apt install git
apt install jq
