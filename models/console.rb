require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()
#
# movie1 = Movie.new({
#     'title' => 'La La Land',
#     'genre' => 'musical',
#     'budget' => 30000000
#   })
#
#   movie1.save()
