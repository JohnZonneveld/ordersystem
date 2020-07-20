# ordersystem
 Final Rails project
 ordersystem

 Rails web based app where users can order items. New order will be created when first item is added. Only an admin cam approve an order. Once approved an order can not be deleted or changed by an user.
 First admin will have to be made admin from rails console. After that he will be able to make other users admin. An admin can only create orders for other users (assist)
 When a user removes last item from order, order will be removed as well

 To use this application:

 Download repo<br>
 Run 'bundle install'<br>
 Type 'rails db:create'<br>
 Type 'rails db:migrate'<br>
 Run 'rails s'<br>
 Open the URL in a browser and run the application<br>
 http://localhost:3000
 
 App uses postgresql, rails 5.2.4.3

 License: https://opensource.org/licenses/MIT
