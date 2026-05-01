# Запуск скрипта `main.py`

## Требования
- Python 3.10-3.12
- Интернет-доступ

---

## 1. Создание виртуального окружения

Windows (CMD):

```bash
python -m venv venv
```

Windows (PowerShell):

```powershell
python -m venv venv
```

Linux / macOS:

```bash
python3 -m venv venv
```

---

## 2. Активация виртуального окружения

Windows (CMD):

```cmd
venv\Scripts\activate
```

Windows (PowerShell):

```powershell
venv\Scripts\Activate.ps1
```

Если PowerShell запрещает запуск скриптов:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Linux / macOS:

```bash
source venv/bin/activate
```

---

## 3. Установка зависимостей из `requirements.txt`

Windows / Linux / macOS:

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

---

## 4. Запуск скрипта

Windows (CMD / PowerShell):

```bash
python main.py
```

Linux / macOS:

```bash
python3 main.py
```

По умолчанию используется XML-источник:
`https://gria.ru/bitrix/catalog_export/imageless_offers.xml`.

При необходимости можно запустить режим Excel:

```bash
python3 main.py --excel -i tsuyokiarticles.xlsx
```

По умолчанию изображения моделей ищутся в GitHub-репозитории:
`netebla/TsuYoki_Parser` (ветка `main`, папка `TsuYoki Lures 2014-2025`).

При необходимости можно переопределить источник:

```bash
python3 main.py --github-repo netebla/TsuYoki_Parser --github-branch main --github-lures-dir "TsuYoki Lures 2014-2025"
```

---

## 5. Результат работы

Создаются три папки (внутри `TsuYoki_images/`):

- `TsuYoki_images/TsuYoki_ready/` - выровненные изображения (квадрат, объект по центру)
- `TsuYoki_images/TsuYoki_raw/` - исходники без выравнивания (резервная копия)
- `TsuYoki_images/TsuYoki_site/` - изображения, скачанные с сайта (если не найдены в GitHub-репозитории)

Важно: если изображение найдено в GitHub-репозитории, оно обязательно проходит
через выравнивание. Если выравнивание для такого файла не удалось, позиция
попадает в итоговый список ошибок в конце лога и не подменяется «простым квадратом».

Если часть артикулов не обработалась, в конце лога выводится:
- артикул,
- причина ошибки,
- URL исходного файла (если он был найден в GitHub).

---

## 6. Завершение работы

Выход из виртуального окружения:

```bash
deactivate
```

---

## 7. Публикация каталога `TsuYoki Lures 2014-2025` в GitHub (важно для iCloud)

Скрипт ищет изображения через GitHub API + `raw.githubusercontent.com`, поэтому папка
`TsuYoki Lures 2014-2025` должна реально находиться в ветке (по умолчанию `main`) репозитория.

Если каталог лежит в iCloud Drive, macOS может подгружать файлы по требованию. В этом случае
`git add` может идти очень долго или «висеть» на чтении файлов через File Provider.

Рекомендации перед `git add`:

- В Finder для папки проекта выберите **«Загрузить сейчас» / Keep Downloaded** (чтобы все файлы были локально).
- Либо временно скопируйте проект в каталог вне iCloud (например, `~/Projects/...`) и выполняйте `git` там.

Дальше в корне репозитория:

```bash
git add "TsuYoki Lures 2014-2025"
git commit -m "Add lure images"
git push
```

---

## Пример `requirements.txt`

```txt
requests
beautifulsoup4
lxml
openpyxl
opencv-python-headless
numpy
Pillow
```
