# FurnitureOnlineStore

FurnitureOnlineStore - це веб-додаток онлайн-магазину, який пропонує широкий вибір меблів для вашої оселі. Платформа дозволяє користувачам зручно переглядати, порівнювати та придбавати меблі безпосередньо з вашого пристрою.

## API:

| Method                       | Link                                                                                                         |
|:-----------------------------|:-------------------------------------------------------------------------------------------------------------|
| GET                          | /, /users/password/new, c                                                                                    |
| GET, POST                    | /users/sign_in                                                                                               |
| DELETE                       | /users/sign_out                                                                                              |
| GET, POST, PUT, DELETE, PATCH | /users, /products, /categories, /subcategories, /producers, /order-items, /orders, payment-histories, /carts |
## ER Діаграма:
![ERD](https://github.com/DmytroChup/FurnitureOnlineStore/blob/main/er-diagram.png)

## Скрипти :
Bundler - інструмент для встановлення необхідних версій гемів, що використовуються в проекті.

Rake - інструмент для парсингу.

## Інструкція по встановленню : 

Спочатку треба завантажити файли з репозиторію :

```
git clone https://github.com/DmytroChup/FurnitureOnlineStore.git
```

Після, перейшовши до потрібної папки, треба створити базу даних,
завантажити всі потрібні геми, провести міграцію і парсинг : 
```
rails db:create
rails db:migrate
bundle install
rake products:parse
```

Тепер ми готові запускати сервер : 

```rails s```

І, нарешті, запускаємо наш додаток в браузері за посиланням : 

*http://localhost:3000*

Вітаю, ви зайшли на головну сторінку веб-додатку. 

