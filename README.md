#  Приложение Movies
## Тестовое задание для компании Polydev
Приложение работающее с REST API сервиса [TMDB](https://www.themoviedb.org).

**Язык**: Swift 5.

**Поддерживаемая iOS**: 13.

**Фреймворк**: UIKit, верстка кодом без Storyboard.

**Архитектура**: VIPER.

**Используемые библиотеки**: Kingfisher.

## Демонстрация функционала

![Movies](https://github.com/romanzhukovv/Movies/blob/main/GIFs/Movies.gif)

## Реализованный функционал

1. Реализовано 2 модуля по архитектуре VIPER (коллекция фильмов и детальная информация о фильме).
2. Модуль ячейки коллекции выполнен по архитектуре MVP.
3. Загрузка данных из сети с помощью URLSession.
4. Загрузка и кеширование изображений с помощью билиотеки Kingfisher.

**Хотелось еще реализовать, но не хватило времени**:

1. Пагинация.
2. Поиск по фильмам.
3. Экран с избранными фильмами и добавление их в БД.
4. Compostional Layout

## Возникшие сложности

Давно не использовал VIPER, пришлось немного вспомнить.

## Декомпозиция

1. Создание "скелета" архитектуры VIPER, оценка - 1 час, потрачено ~ 2 час.
2. Реализация протоколов, оценка - 2 часа, потрачено ~ 3 часа.
3. Изучение API документации, оценка - 1 час, потрачено ~ 1 час.
4. Работа с сетью, оценка - 1 час, потрачено ~ 1 час.
5. Верстка, оценка - 3 часа, потрачено ~ 3 часа.
6. Рефакторинг, потрачено ~ 3 часа.
7. Оформление README, оценка - 1 часа, потрачено ~ 2 часа.
