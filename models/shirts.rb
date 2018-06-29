
class Shirt

  attr_accessor :id, :title, :body

  def self.open_connection
    conn = PG::connect( dbname: 'shirts')
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT ID, TITLE, BODY FROM SHIRTS ORDER BY ID"
    result = conn.exec(sql)
    shirts = result.map do |tuple|
      self.hydrate tuple
    end
    shirts
  end

  def self.hydrate shirt_data
    shirt = Shirt.new
    shirt.id = shirt_data['id']
    shirt.title = shirt_data['title']
    shirt.body = shirt_data['body']

    shirt
  end



end
