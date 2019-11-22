# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#category (food,car, house), Location (walmart, car maintenance, snow removal), Date (when the event happened), Amount, Type (expense/income)
Transaction.delete_all
Transaction.create!(
  transaction_type:	"Expense",
  category:	"Food",
  location:	"Walmart",
  transaction_date: 	"2019-11-11",
  transaction_amount:	100)
Transaction.create!(
  transaction_type:	"Income",
  category:	"Rent",
  location:	"170Simonston",
  transaction_date: 	"2019-11-01",
  transaction_amount:	600)
  Transaction.create!(  
  transaction_type:	"Income",
  category:	"Rent",
  location:	"170Simonston",
  transaction_date: 	"2019-05-01",
  transaction_amount:	600)
Transaction.create!(	
  transaction_type:	"Income",
  category:	"Rent",
  location:	"170Simonston",
  transaction_date: 	"2019-12-01",
  transaction_amount:	600)
Transaction.create!(	
  transaction_type:	"Expense",
  category:	"Fun",
  location:	"ChuckECheese",
  transaction_date: 	"2019-11-11",
  transaction_amount:	30)
Transaction.create!(	
  transaction_type:	"Expense",
  category:	"Field Trip",
  location:	"Markham Theatre",
  transaction_date: 	"2019-11-11",
  transaction_amount:	30)
