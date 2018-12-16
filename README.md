# ilya8008_microservices
ilya8008 microservices repository

Build status:

docker-1 branch: [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices.svg?branch=docker-1)](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices)

docker-2 branch: [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices.svg?branch=docker-2)](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices)

docker-3 branch: [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices.svg?branch=docker-3)](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices)

docker-4 branch: [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices.svg?branch=docker-4)](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices)

## Домашнее задание 12

### Сделано:

- Настроил интеграцию репозитория microservices с TravisCI и Slack.
- Установил docker.
- Изучил команды docker, запустил контейнеры, сделал образ из контейнера
- В файле docker-1.log описал разницу межу контейнером и образом

## Домашнее задание 13

### Сделано:

- Создал новый проект в gcloud.
- Создал docker-host с помощью docker-machine в gce, повторил примеры из лекции.
- Команда запуска контейнера docker с опцией `--pid host` подключает pid namespace из хоста, где запущен docker.
- Написал Dockerfile и собрал образ.
- Запустил контейнер, настроил firewall и проверил работу приложения.
- Загрузил образ на docker hub и запустил его на локальной машине.
- Автоматизировал создание нескольких инстансов приложения в GCP:
    - Инстансы поднимаются с помощью terraform, количество задается переменной, можно использовать образ с установленным docker.
    - Написал плейбуки ansible с использованием dynamic inventory для установки докера и запуска контейнера с приложением
    - Написал шаблон packer, который создает образ с уже устаноленным docker.
- Добавил тесты packer, terraform и ansible в .travis.yml 

## Домашнее задание 14

### Сделано:

- Установил linter hadolint
- Собрал образы с сервисами, создал сеть для приложения и запустил контейнеры, проверил работу.
- Запустил контейнеры с другими сетевыми алиасами, передал адреса через опцию -e при старте контейнера, проверил работу.
- Оптимизировал Dockerfile comment и ui, привел их в соответствие с рекомендациями hadolint.
- Добавил Dockerfile.1 в comment и ui с использованием Alpine Linux
- Пересобрал образы и проверил работу и уменьшение их размеров (более, чем в 10 раз).
- Создал Docker volume, подключил его к контейнеру с db, проверил сохранность поста после перезапуска контейнеров.

## Домашнее задание 15

### Сделано:

- Запустил контейнеры с использованием none-драйвера, просмотрел конфигурацию сети.
- Запустил контейнеры с использованием host-драйвера, изучил конфигурацию сети и просмотрел net-namespaces.
- Создал bridge-сеть, запустил контейнеры с присвоением сетевых алиасов и проверил работу приложения.
- Запустил проект в 2-х bridge-сетях, проверил работу приложения.
- Посмотрел конфигурацию bridge-интерфейсов, правила iptables.
- Создал файл docker-compose.yml, проверил работу приложения.
- Изменил docker-compose под работу с 2-мя bridge-сетями и алиасами, параметризовал файл docker-compose и записал параметры в файл .env
- Базовое имя проекта можно задать с помощью переменной окружения ```COMPOSE_PROJECT_NAME```.
- Создал файл docker-compose.override.yml, с помощью которого можно запустить puma с указанными параметрами и изменять код приложения без сборки образа. Для этого нужно скопировать файлы на docker-host:
```
docker-machine scp -r post-py docker-host:/home/docker-user
docker-machine scp -r comment docker-host:/home/docker-user
docker-machine scp -r ui docker-host:/home/docker-user
```
