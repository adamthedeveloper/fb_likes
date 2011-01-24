class Like < FbConnection
  attr_reader :name, :category, :id
  def initialize(like)
    @name = like['name']
    @category = like['category']
    @id = like['id']
  end
end
