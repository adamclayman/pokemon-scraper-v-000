require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(id:,name:, type:, db:)
    @id = :id
    @name = :name
    @type = :type
    @db = :db
    self
  end

  def self.all
    @@all
  end

  def self.save(name: nil, type: nil, db: nil)
    binding.pry
    obj = self.find_or_create_by_name(:name, :type, :db)
    self.all << obj
  end

  def self.find_or_create_by_name(name: nil, type: nil, db: nil)
    if self.find(:name) != nil
      self.find(:name)
    else
      self.new(:name, :type, :db)
    end
  end

  def self.find(obj_name)
    self.all.detect {|o| o.name == obj_name}
  end
end
