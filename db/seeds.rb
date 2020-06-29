# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'John Zonneveld', username: 'john', admin: 'true', password: '1234')
User.create(name: 'Donald Duck', username: 'donald', password: '1234')
User.create(name: 'Daisy Duck', username: 'daisy', password: '1234')
User.create(name: 'Big Pete', username: 'pete', password: '1234')
User.create(name: 'Fiona', username: 'fiona', password: '1234')

Item.create(name: 'Latex glove, L', description: 'box of 250, blue', price: '12.99')
Item.create(name: 'Latex glove, M', description: 'box of 250, blue', price: '12.99')
Item.create(name: 'Latex glove, S', description: 'box of 250, blue', price: '12.99')
Item.create(name: 'Alcohol wipes', description: 'box of 100', price: '9.99')
Item.create(name: 'Hand sanitizer', description: '500ml bottle with pump, alcohol gel', price: '18.99')
Item.create(name: 'Hand sanitizer', description: '50ml bottle with pump, non-gel', price: '12.99')
Item.create(name: 'Syringe 3cc', description: 'Sterile 3 cc 25 g 1 inch 100pk', price: '19.99')
Item.create(name: 'Syring needle', description: 'Disposable Sterile 100Pack (18G-1IN/25mm)', price: '10.19')

Order.create( user_id: '2')
Order.create( user_id: '3')
Order.create( user_id: '4')
Order.create( user_id: '2')
Order.create( user_id: '5')

OrderItem.create( order_id: '1', item_id: '1', quantity: '2')
OrderItem.create( order_id: '2', item_id: '2', quantity: '2')
OrderItem.create( order_id: '2', item_id: '3', quantity: '2')
OrderItem.create( order_id: '3', item_id: '4', quantity: '3')
OrderItem.create( order_id: '3', item_id: '7', quantity: '2')
OrderItem.create( order_id: '3', item_id: '8', quantity: '2')
OrderItem.create( order_id: '4', item_id: '1', quantity: '2')
OrderItem.create( order_id: '5', item_id: '5', quantity: '2')
OrderItem.create( order_id: '5', item_id: '6', quantity: '2')