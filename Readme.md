Парсинг `v8i` файла
===

Чтение/Запись файла '.v8i'.
Очистка кеша баз.

# Классы

## ПарсерСпискаБаз


Если парсеру не устанавливать файл списка баз, тогда по умолчанию используется: Окружение.Получить("USERPROFILE") + "appdata\roaming\1c\1cestart\ibases.v8i"

### Экспортные методы

- `ПолучитьСписокБаз` - возвращает Соответствие со списком баз, где: Ключ - Имя базы, Значение - Структура с параметрами базы
- `ЗаписатьСписокБаз` - Записывает список баз в файл, как источник принимается результат от ПолучитьСписокБаз
- `НайтиПоИмени` -  Находит базу по наименованию
- `НайтиПоПути` - Поиск базы по пути. Автоматически определяется тип базы



## ОчисткаКеша - Очистка кеша баз 1С


### Экспортные методы
- `ОчиститьВесьКеш` - пройтись по всем базам в файле списка баз 1С и удалить кеш
- `ОчиститьКеш` - удалить кеш конкретной базы. Как параметр принимается структура, что является результатом функций НайтиПоИмени/НайтиПоПути

## Готовые скрипты

`bin\clean-cash.os` - Очистка кеша баз. Примимает параметры:
- `all` - очистить кеш всех баз
- `db MyDBPath` - очистить кеш базы с адресом <MyDBPath>

### Примеры:

`oscript parserV8i\bin\clean-cash.os all`

`oscript parserV8i\bin\clean-cash.os db c:\work\db\tasks`

Другие примеры использования в каталоге `examples`
