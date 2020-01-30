class Film
  attr_reader :name_film, :director, :year

  def self.from_file(files_path)
    files_path.map do |file|
      array_list = File.readlines(file, chomp:true)
      Film.new(*array_list)
    end
  end

  def initialize(name_film, director, year)
    @name_film = name_film.chomp
    @director = director.chomp
    @year = year.to_i
  end

  def to_s
    "#{@name_film} - #{@director} (#{@year})"
  end
end
