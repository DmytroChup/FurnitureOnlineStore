# FurnitureOnlineStore

FurnitureOnlineStore - це веб-додаток онлайн-магазину, який пропонує широкий вибір меблів для вашої оселі. Платформа дозволяє користувачам зручно переглядати, порівнювати та придбавати меблі безпосередньо з вашого пристрою.

---

## Посилання
- [Опис проєкту](#furnitureonlinestore)
- [API Документація](#api-документація)
- [Діаграми](#діаграми)
    - [ER Діаграма](#er-діаграма)
- [Скрипти](#скрипти)
- [Інструкція по встановленню](#інструкція-по-встановленню)

---

## API документація:

| HTTP-метод                    | Шлях (URL)                                                                                                            | Дія                                                               |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| GET                           | /                                                                                                                     | Головна сторінка                                                  |
| GET, POST, DELETE             | /users/sign_in, /users/sign_out, /users/password/new, /producers/sign_in, /producers/sign_out, /producers/password/new | Авторизація, реєстрація, скидання пароля користувача та виробника |
| GET, POST, PUT, DELETE, PATCH | /users, /products, /categories, /subcategories, /producers, /order-items, /orders, /reviews                           | Операції з сутностями                                             |

---

# Діаграми

## ER Діаграма:

![ERD](https://github.com/DmytroChup/FurnitureOnlineStore/blob/main/er-diagram.png)

---

## Скрипти:

- [parse_products.rake](lib/tasks/parse_products.rake) - Rake задача розпарсування
- [categories.rake](lib/tasks/categories.rake) - Rake задача для заповнення бази даних категоріями та підкатегоріями
- [producers.rake](lib/tasks/producers.rake) - Rake задача для заповнення бази даних виробника
- [products.rake](lib/tasks/products.rake) - Rake задача для заповнення бази даних продуктами

---

## Інструкція по встановленню:

Склонуйте репозиторій :

```
git clone https://github.com/DmytroChup/FurnitureOnlineStore.git
```
Перейдіть у каталог проекту :
```
cd FurnitureOnlineStore
```
Встановіть геми Ruby :
```
bundle install
```
Створіть базу даних та запустіть міграції :
```
rails db:create
rails db:migrate
```
Запускаємо парсинг та інші рейк задачі для заповнення бази даних :
```
rake products:parse
rake categories:categories
rake categories:subcategories
rake categories:update_categories
rake producers:create_producer
rake products:update_data
```
Запустіть сервер Rails :

```rails s```

І, нарешті, запускаємо наш додаток в браузері за посиланням : 

*http://localhost:3000*

Вітаю, ви зайшли на головну сторінку веб-додатку. 

