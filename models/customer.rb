require_relative("../db/sql_runner")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end



  def save()
      sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
      values = [@name, @funds]
      customer = SqlRunner.run(sql, values).first
      @id = customer['id'].to_i
    end


  def update()
      sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



  def self.all()
    sql = "SELECT * FROM customers"
    customer_info = SqlRunner.run(sql)
    return Customer.map_items(customer_info)
  end


  def self.map_items(customer_info)
    result = customer_info.map { |customer| Customer.new(customer) }
    return result
  end



  def films()
    sql = "SELECT films .* FROM Films
          INNER JOIN tickets
          ON tickets.film_id = films.id
          WHERE customer_id = $1"
      values = [@id]
      films = SqlRunner.run(sql, values)
      result = films.map{|film| Film.new(film)}
      return result
    end






  def self.delete_all()
      sql = "DELETE FROM customers"
      SqlRunner.run(sql)
    end












end
