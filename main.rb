require_relative 'lib/film'

file_path = Dir["#{__dir__}/data/*.txt"]

puts "Программа «Фильм на вечер»"
# (если у двух фильмов 1 режиссер, то, конечно, этот режиссер должен появиться только 1 раз)
directors_for_question = Film.from_file(file_path).map(&:director).uniq
# Программа должна выводить список режиссеров
directors_for_question.each_with_index {|name, index| puts "#{index +1}: #{name}"} #1: Роберт Земекис
# и спрашивать у пользователя, фильм какого режиссера он хочет посмотреть.
puts "Фильм какого режиссера вы хотите сегодня посмотреть?"
user_choice = STDIN.gets.to_i
user_choice -=1 # Чтоб убрать нулевой индекс
# Потом программа должна советовать случайный фильм выбранного режиссера.
selected_film = Film.from_file(file_path).select { |film| film.director == directors_for_question[user_choice]}.sample
puts selected_film
