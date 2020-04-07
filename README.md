How To Run Stock App

1. Open up terminal and run createdb maxxp
2. then run "psql -d maxxp -f db/maxxp.sql" to drop and create tables
3. (optional) then db/seeds.rb this will fill the app with some games and publishers. You can manually add them.
4. Then Run app.rb
5. Open up your browser and run localhost.4567


About the programme

This is an app for a game store that allows you to add stock/publishers.
It will take your Wholesale price and rrp and calculate your profit.
Also this will let you know if your stock is out of stock, Low stock as soon at you hit 5 or less units.
