# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: "ivanov_andrrey@email.ru", first_name: "Андрей", last_name: "Иванов")
User.create(email: "volkov_maksim@email.ru", first_name: "Максим", last_name: "Волков")
LabReport.create(title: "Определение эквивалентной и атомной массы металла", description: "Определить эквивалентную и атомную массы метал-
ла методом вытеснения водорода из кислоты, с применением закона эквивалентов.", grade: "A", user_id: 1)
LabReport.create(title: "Очистка медного купороса перекристаллизацией", description: "Получить определенное количество очищенного
медного купороса.", grade: "B",user_id: 2)
