$initial_price = 0
$total_price = 0
$total_tax = 0
$total_amount = 0
$results = Array.new

def find_name(name)
    temp = ""
    name.map do |n|
        if (n!= "imported")
            temp +=n+" "
        end
    end
    return temp[0...-1]
end

def calculate_price(price, tax)
    # puts "In function"
    # return 1000    
    calculated_price = price + price*tax
    calculated_price = calculated_price.round(2)
    # "%.02f"%calculated_price
    # calculate_price = (calculate_price / (1 / 0.05))
end



def process
    exempt = ["book", "chocolate bar", "headache pills", "box of chocolates", "packet of headache pills"]
    basic = ["music CD", "bottle of perfume"]
    input = gets.chomp
    array = input.split
    
    amount = array[0].to_i
    price = array[-1].to_f
    $initial_price += price
    imported = false
    tax = 0
    
    if array.include? "imported"
        imported = true
    else
        imported = false
    end
    
    at_index = array.index("at")
    
    product_name = find_name(array[1...at_index])
    
    if exempt.include? product_name
        tax = 0
    else
        tax = 0.1
    end
    
    if imported
        tax += 0.05
        final_price = calculate_price(price, tax)
    else
        final_price = calculate_price(price, tax)
    end
    $total_price += final_price

    $results.push( array[0...-2].join(" ") + ": #{final_price}")
end

t = gets.chomp.to_i

while(t != 0)
    process
    t-=1
end

puts $results
# puts $total_amount
puts "Sales Taxes + #{($total_price - $initial_price).round(2)}"
puts $total_price
# puts final_price