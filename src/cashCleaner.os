Перем Парсер;

Функция УдалитьКаталог(ПутьКаталога)
	Попытка
		УдалитьФайлы(ПутьКаталога);
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат Ложь;
	КонецПопытки;
	Возврат Истина;
КонецФункции // УдалитьКешБазы(База)

/// Получить каталог кеша
//
//	Происходит анализ версии ОС, под каждую ОС свой путь.
//
Функция ПолучитьКаталогКеша(Знач База)
	СИ = Новый СистемнаяИнформация;
	Окружение = СИ.ПеременныеСреды();
	Версия = СИ.ВерсияОС;
	Если СтрНайти(Версия,"Microsoft Windows") <> 0 Тогда
		КаталогКеша = ОбъединитьПути(Окружение.Получить("USERPROFILE"), "appdata\local\1c\1cv8", База.ID);
	ИначеЕсли СтрНайти(Версия,"Linux") <> 0 Тогда
		КаталогКеша = ОбъединитьПути(Окружение.Получить("USERPROFILE"), "~/.1cv82/1C/1Cv82/", База.ID);
	КонецЕсли;
	Возврат КаталогКеша;
КонецФункции // ПолучитьКаталогКеша()

///  Очищает кеш всех баз из файла *.v8i
//
Функция ОчиститьВесьКеш() Экспорт
	СписокБаз = Парсер.ПолучитьСписокБаз();

	Для каждого Стр Из СписокБаз Цикл
		База = Стр.Значение;

		Сообщить("Очистка кеша базы: " + База.Name);
		КаталогКеша = ПолучитьКаталогКеша(База);
		Если УдалитьКаталог(КаталогКеша) Тогда
			Сообщить("	Очищен кеш базы: " + База.Name);
		Иначе
			Сообщить("	Возникли проблемы при очистке кеша базы: " + База.Name);
		КонецЕсли;

	КонецЦикла;

	Возврат Истина;
КонецФункции // ОчиститьВесьКеш()

/// Очищет кеш базы
//
// Параметры:
//  База - Структура - Структура с параметрами соединения с базой
//
// Возвращаемое значение:
//  Булево - Успешно да/нет
//
Функция ОчиститьКеш(База) Экспорт
	КаталогКеша = ПолучитьКаталогКеша(База);
	Если УдалитьКаталог(КаталогКеша) Тогда
		Возврат Истина;
	Иначе
		Возврат Ложь;
	КонецЕсли;

КонецФункции // ОчиститьКеш(База) Экспорт

Процедура УстановитьПарсер(Источник) Экспорт
	Парсер = Источник;
КонецПроцедуры

Функция ПолучитьПарсер() Экспорт
	Возврат Парсер;
КонецФункции
