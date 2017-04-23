class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    found = self.all.detect { |song| song.name == name }
    if found != nil
      found
    else
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    song = self.new
    song.artist_name = parsed[0]
    song.name = parsed[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    parsed = filename.split(" - ")
    song = self.new
    song.artist_name = parsed[0]
    song.name = parsed[1].chomp(".mp3")
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
