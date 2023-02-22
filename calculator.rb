$products = Array.new

def calculatePrice(product_price, tax)
    price = product_price + product_price*tax
end

def showProducts
    cnt = 0
    $products.map do |product|
        puts "#{cnt}: #{product[0]} #{product[1]}"
        cnt+=1
    end
end

def buyProducts
    
end

def imported(price, product)
    puts "Is it imported"
    
    imp = gets.chomp
    case imp
    when '1'
        price = calculatePrice(price, 0.05)
        product.push(price)
    when '0'
        product.push(price)
    else
        "Select a valid option"
        imported
    end
end

def addProduct
    product = Array.new

    puts "Enter the name of your Product"
    product_name = gets.chomp.upcase
    product.push(product_name)

    puts "Enter the price of your product"
    product_price = gets.chomp.to_i

    puts "**********************"
    puts ""
    puts "Select the appropriate Option"
    puts "Press 1: if your Product is Basic"
    puts "Press 2: if your Product is Exempt"
    # puts "Press 3: if your Product is Imported"
    puts ""
    puts "**********************"

    category = gets.chomp

    case category
    when '1'
        price = calculatePrice(product_price, 0.1)
        imported(price, product)
        # product.push(price)
    when '2'
        price = calculatePrice(product_price, 0)
        imported(price, product)
        # product.push(price)
    # when '3'
    #     price = calculatePrice(product_price, 0.15)
    #     product.push(price)     
    else
        puts "Select a valid option"
        addProduct
    end

    $products.push(product)
    puts $products.inspect

    puts "Product added successfully"
    owner
    # puts product.inspect
end

def owner
    puts "**********************"
    puts ""
    puts "Welcome to the Dashboard"
    puts "Press 1: to add a Product"
    puts "Press 2: to remove a Product"
    puts "Press 0: to Exit to Main Menu"
    puts ""
    puts "**********************"

    owner_input = gets.chomp

    case owner_input 
    when '1'
        addProduct
    when '2'
        # removeProduct
    when '0'
        main
    else 
        puts "Please select a valid option"
        owner
    end
end


def customer
    puts "**********************"
    puts ""
    puts "Here is the list of the products available"
    showProducts
    puts ""
    puts "**********************"
end

def main
    puts "**********************"
    puts ""
    puts "Who are you ?"
    puts "Press 1: for Owner"
    puts "Press 2: for Customer"
    puts "Press 0: to Exit"
    puts ""
    puts "**********************"

    input = gets.chomp

    case input
    when '1'
        owner
    when '2'
        customer
        # puts "Functionality is in progress"
    when '0'
        puts "Thanks for being with us"
    else
        puts "Please select a valid option"
        main
    end
end

main