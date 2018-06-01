require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
  sql = "UPDATE customers SET
    (name,
    funds) = ($1, $2)
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def film()
    sql = "SELECT * FROM films
    INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|result| Film.new(result)}
  end

  def buy_ticket(film)
    @funds -= film.price
  end

  def ticket()
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    result = results.map {|ticket| Ticket.new(ticket)}
    return result
  end

  def self.all
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customer.map {|customer| Customer.new(customer)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
