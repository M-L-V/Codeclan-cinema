require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


film1 = Film.new({
  'title' => 'Into the Spider-Verse',
  'price' => 10
  })

film1.save()

film2 = Film.new({
  'title' => 'Homecoming',
  'price' => 9
  })

film2.save()



customer1 = Customer.new({
  'name' => 'Peter',
  'funds' => 20
  })

customer1.save()

customer2 = Customer.new ({
  'name' => 'Miles',
  'funds' => 15
  })

customer2.save()


ticket1 = Ticket.new ({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

  ticket1.save()


ticket2 = Ticket.new ({
    'customer_id' => customer2.id,
    'film_id' => film1.id
  })

  ticket2.save()









binding.pry


nil
