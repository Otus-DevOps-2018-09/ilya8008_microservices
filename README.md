# ilya8008_microservices
ilya8008 microservices repository

Build status:
docker-1 branch: [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices.svg?branch=docker-1)](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices)
docker-2 branch: [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices.svg?branch=docker-2)](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices)

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
