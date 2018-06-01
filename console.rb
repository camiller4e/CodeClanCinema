require_relative('models/film.rb')
require_relative('models/customer.rb')
require_relative('models/ticket.rb')
require_relative('models/screening.rb')

require('pry-byebug')

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()
Screening.delete_all()

film1 = Film.new({
  'title' => 'RobotPoliceman',
  'price' => '5'
  })
  film1.save()

  film2 = Film.new({
    'title' => 'Highlander',
    'price' => '4'
    })
    film2.save()

    film3 = Film.new({
      'title' => 'Hot Rod',
      'price' => '8'
      })
      film3.save()

      film4 = Film.new({
        'title' => 'The Other Guys',
        'price' => '6'
        })
        film4.save()


        customer1 = Customer.new({
          'name' => 'Colin',
          'funds' => '100'
          })
          customer1.save()

          customer2 = Customer.new({
            'name' => 'Richard',
            'funds' => '10'
            })
            customer2.save()

            customer3 = Customer.new({
              'name' => 'Enya',
              'funds' => '50'
              })
              customer3.save()

              customer4 = Customer.new({
                'name' => 'Jacky Jormp-Jomp',
                'funds' => '20'
                })
                customer4.save()


                ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
                ticket1.save()

                ticket2 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer3.id})
                ticket2.save()

                ticket3 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer4.id})
                ticket3.save()

                ticket4 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id})
                ticket4.save()

                ticket5 = Ticket.new({'film_id' => film4.id, 'customer_id' => customer4.id})
                ticket5.save()

                ticket6 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
                ticket6.save()


                screening1 = Screening.new({'showtime' => '16:20', 'film_id' => film1.id})
                screening1.save()

                film1.title = 'Robocop'
                film1.update()

                customer1.buy_ticket(film1)
                customer1.update


                binding.pry
                nil
