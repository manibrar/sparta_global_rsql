
class Shirt

  attr_accessor :id, :title, :body

  def save

      conn = Shirt.open_connection

      if(!self.id)
        # Insert a new record in to the database
        sql = "INSERT INTO shirts (title , body) VALUES ( '#{self.title}', '#{self.body}')"
      else
        # Update an existing one
        sql = "UPDATE shirts SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"
      end

      conn.exec(sql)

  end

  def self.open_connection

      conn = PG.connect( dbname: "shirts" )

  end

  def self.all

        conn = self.open_connection

        sql = "SELECT id,title,body FROM SHIRTS ORDER BY id"

        results = conn.exec(sql)

        # create an array of shirts objects
        shirts = results.map do |tuple|
            self.hydrate tuple
        end

        shirts

  end

  def self.find id

        conn = self.open_connection

        sql = "SELECT * FROM SHIRTS WHERE id = #{id} LIMIT 1"

        # PG always returns an array
        shirts = conn.exec(sql)

        # bind just the first and return
        shirt = self.hydrate shirts[0]

        shirt

  end

  def self.destroy id

      conn = self.open_connection

      sql = "DELETE FROM SHIRTS where id = #{id}"

      # handle delete here
      conn.exec(sql)

  end

  def self.hydrate shirt_data

    shirt = Shirt.new

    shirt.id = shirt_data['id']
    shirt.title = shirt_data['title']
    shirt.body = shirt_data['body']

    shirt

  end

end
