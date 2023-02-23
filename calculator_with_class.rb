$initial_price = 0
$total_price = 0
$total_tax = 0
$total_quantity = 0
$results = Array.new

class Products
    @@exempt = ["book", "chocolate bar", "headache pills", "box of chocolates", "packet of headache pills"]
    @@basic = ["music CD", "bottle of perfume"]

    def is_exempt(product_name)
        if @@exempt.include? product_name
            return true
        else
            return false            
        end
    end

end

class Product

    def initialize(arr)
        @quantity = arr[0].to_i
        @price = arr[-1].to_f
        $initial_price += @price
    end

    def find_name(name)
        temp = ""
        name.map { |n| n!= "imported" ? temp +=n+" " : temp }
        return temp[0...-1]
    end

    def calculate_price(price, tax, quantity)
        calculated_price = price + price*tax
        calculated_price = quantity*calculated_price.round(2)
    end

    attr_accessor :quantity, :price
end

module StartProcess
    def process
        obj  = Products.new
        input = gets.chomp
        arr = input.split
        product_obj = Product.new(arr)
        
        quantity = product_obj.quantity
        price = product_obj.price
        tax = 0
        
        product_name = product_obj.find_name(arr[1...-2])
        
        if obj.is_exempt(product_name)
            tax = 0
        else
            tax = 0.1
        end
    
        if arr.include? "imported"
            tax += 0.05
        end
        final_price = product_obj.calculate_price(price, tax, quantity)
        $total_price += final_price
    
        $results.push( arr[0...-2].join(" ") + ": #{final_price}")
    end
end

include StartProcess

def userInput
    t = gets.chomp.to_i

    while(t != 0)
        process
        t-=1
    end
end

userInput
puts $results
puts "Sales Taxes: #{($total_price - $initial_price).round(2)}"
puts $total_price