require_relative("../db/sql_runner")

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end


  def save()
      sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
      values = [@customer_id, @film_id]
      film = SqlRunner.run(sql, values).first
      @id = ticket['id'].to_i
    end


  def update()
      sql = "UPDATE customers SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
      values = [@customer_id, @film_id]
      SqlRunner.run(sql, values)
  end











  def save()
      sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
      values = [@name, @funds]
      film = SqlRunner.run(sql, values).first
      @id = film['id'].to_i
    end


  def update()
      sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
  end
#save, update, and delete methods below








end
