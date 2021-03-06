# ilya8008_microservices
ilya8008 microservices repository

Build status:

kubernetes-4 branch: [![Build Status](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices.svg?branch=kubernetes-4)](https://travis-ci.com/Otus-DevOps-2018-09/ilya8008_microservices)

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

## Домашнее задание 16

### Сделано:

- Создал ВМ для Gitlab CI с помощью docker-machine.
- Установил Gitlab CI.
- Выполнил первоначальные настройки Gitlab CI.
- Определил CI/CD Pipeline.
- Запустил и зарегистрировал runner.
- Добавил тестирование приложения reddit в pipeline.
- Настроил интеграцию Pipeline с Slack (https://devops-team-otus.slack.com/messages/CDAN4QFFF/details/).
- Т.к. я использовал docker-machine для создания ВМ и установки Gitlab CI, я написал скрипт на bash для создания runners, который нужно выполнить на docker-host.

## Домашнее задание 17

### Сделано:

- Создал dev-окружение.
- Определил этапы stage и production c запуском с кнопки и добавил ограничение по тэгу.
- Определил динамические окружения.

## Домашнее задание 18

### Сделано:

- Запустил систему мониторинга Prometheus с использованием готового образа с DockerHub.
- Ознакомился с web-интерфейсом Prometheus.
- Настроил конфигурацию в файле prometheus.yml и создал образ prometheus.
- Собрал образы микросервисов.
- Добавил сервис prometheus в docker-compose.yml, добавил секцию networks с настройками сети.
- Запустил сервисы и проверил их работу.
- Проверил работу healthcheck для сервиса post и связанных с ним сервисов.
- Добавил сервис node-exporter в docker-compose.yml с указанием ннастроек сети.
- Добавил job в prometheus.yml
- Проверил работу мониторинга node.
- Запушил созданные образы на DockerHub: 
- https://cloud.docker.com/repository/docker/ilya8008/prometheus
- https://cloud.docker.com/repository/docker/ilya8008/post
- https://cloud.docker.com/repository/docker/ilya8008/ui
- https://cloud.docker.com/repository/docker/ilya8008/comment
- Добавил мониторинг MongoDB (образ из репозитория ssalaues/mongodb-exporter), проверил его работу.
- Добавил мониторинг сервисов comment, post, ui с помощью blackbox_exporter, проверил его работу.
- Написал Makefile, с помощью которого можно билдить и пушить на DockerHub все образы (по умолчанию) или конкретный образ, указанный в параметрах запуска make, например (username - обязательный параметр):
```
make prometheus username=docker_login_name
```

## Домашнее задание 19

### Сделано:

- Вынес из файла docker-compose.yml в docker-compose-monitoring.yml описание мониторинга.
- Добавил cAdvisor в конфиг docker и prometheus, проверил работу.
- Добавил grafana в конфиг docker.
- Через веб-интерфейс grafana импортировал dashboard.
- Построил раличные графики метрик.
- Построил график с вычислением 95 перецентиля.
- Построил графики бизнес логики.
- Собрал образ alertmanager.
- Проверил работу алерта и уведомление в канал Slack. 
- Запушил созданные образы на DockerHub: 
- https://cloud.docker.com/repository/docker/ilya8008/prometheus
- https://cloud.docker.com/repository/docker/ilya8008/post
- https://cloud.docker.com/repository/docker/ilya8008/ui
- https://cloud.docker.com/repository/docker/ilya8008/comment
- https://cloud.docker.com/repository/docker/ilya8008/alertmanager

## Домашнее задание 20

### Сделано:

- Обновил код микросервисов и пересобрал образы.
- Создал docker-compose-logging.yml.
- Собрал образ для fluentd.
- Изучил работу со структурированными логами с помощью kibana.
- Изучил работу фильтров со структурированнми логами.
- Настроил парсинг неструктурированных логов с помощью регулярных выражений.
- Настроил парсинг неструктурированных логов с помощью grok-шаблонов.

## Домашнее задание 21

### Сделано:

- Создал файлы с Deployment манифестами приложений.
- Прошел туториал Kubernetes The Hard Way

## Домашнее задание 22

### Сделано:

- Установил и запустил Minikube-кластер.
- Создал всенеобходимые ресурсы Deployment в yaml-файлах.
- Создал объекты Services для post,comment,mongodb и ui.
- Изучил addon dashboard.
- Создал Namespace dev и запустил приложение в нем.
- Развернул кластер Kubernetes в GCP.
- Запустил и проверил приложение reddit в GKE.
- Проверил работу dashboard в GKE.

## Домашнее задание 23

### Сделано:

- Убедился, что при отключенном kube-dns связность между компонентами приложения пропадает.
- Использовал тип сервиса LoadBalancer (внешний облачный балансировщик) и проверил его работу.
- Создал Ingress для сервиса ui.
- Убрал балансировщик из ui-service.yml.
- Подготовил сертификат для TLS и загрузил его в кластер kubernetes.
- Настроил Ingress на прием только трафика HTTPS.
- Включил network-policy для GKE.
- Ограничил трафик, поступающий на mongodb отовсюду, кроме сервиса comment.
- Добавил в mongo-network-policy.yml разрешающее правило для сервиса post.
- Подключил к mongo Volume emptyDir (проверил, что при остановке PODа содержимое volume удаляется).
- Использовал Volume gcePersistentDisk и проверил сохранность БД.
- Использовал механизм PersistentVolume, общий для всего кластера.
- Создал описание PersistentVolumeClaim для выделения места на хранилище.
- Подключил PVC к mongo.
- Создал StorageClass Fast для создания хранилищ в автоматическом режиме.
- Подключил динамический PVC к mongo и посмотрел получившиеся тома.

## Домашнее задание 24

### Сделано:

- Установил клентскую часть Helm.
- Установил Tiller.
- Разработал Chart и Templates для ui, post и comment, и шаблонизировал их.
- Добавил функции в шаблоны приложений.
- С помощью механизма управления зависимостями создал Chart reddit, загрузил зависимости и проверил работу приложения
- Установил Gitlab из репозитория.
- Создал локальный репозиторий с исходниками приложений и отправил его в gitlab.
- Создал файлы .gitalb-ci.yml для приложений и проверил успешную сборку образов.
- Настроил возможность запускать отдельное окружение в Kubernetes по коммиту в ветку feature, с возможностью "убивать" их.
- Создал staging и production среды для приложения, проверил работу приложения в staging и ручной деплой в production.

## Домашнее задание 25

### Сделано:

- Установил ingress-контроллер nginx.
- Установил и запустил Prometheus.
- Для сбора информации о сущностях k8s включил сервис kube-state-metrics, поды node-exporter, проверил сбор метрик.
- Добавил эндпоинты.
- Добавил лейблы.
- Разбил конфигурацию reddit-endpoints на 3 job'а post-endpoints, comment- endpoints, ui-endpoints.
- Установил grafana.
- Добавил дашборд Kubernetes cluster monitoring (via Prometheus).
- Добавил дашборды из ДЗ по мониторингу.
- Добавил Templating в дашборды для выбора namespace, параметризировал дашборды.
- Импортировал график Kubernetes Deployment metrics.
- Создал файлы конфигурации EFK, запустил efk и kibana, изучил работу системы сбора логов.
