require_relative("../db/sql_runner")

class Screening

  attr_reader :id
  attr_accessor :showtime, :film_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @showtime = options['showtime']
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (showtime, film_id) VALUES ($1, $2) RETURNING id"
    values = [@showtime, @film_id]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def update()
  sql = "UPDATE screenings SET
    (showtime, film_id) = ($1, $2)
    WHERE id = $3"
    values = [@showtime, @film_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def film()
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [@film_id]
    results = SqlRunner.run(sql, values)
    return Film.new(results[0])
  end

  def self.all
    sql = "SELECT * FROM screenings"
    values = []
    screenings = SqlRunner.run(sql, values)
    result = screenings.map {|screening| Screening.new(screening)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end


end
