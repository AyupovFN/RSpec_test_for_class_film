require 'film'

describe Film do
  describe ".from_file" do
    it "read content from file" do
      film = Film.from_file(["#{__dir__}/fixtures/01.txt"])

      expect(film[0]).to be_instance_of(Film)
      expect(film[0]).to have_attributes(
                          name_film:'Зелёная миля',
                          director: 'Фрэнк Дарабонт',
                          year: 1999
                      )
    end
  end

  describe "#to_s" do
    it "assigns instance variables" do
      film = Film.new("Зелёная миля", "Фрэнк Дарабонт", 1999)

      expect(film.to_s).to eq "Зелёная миля - Фрэнк Дарабонт (1999)"
    end
  end
end

