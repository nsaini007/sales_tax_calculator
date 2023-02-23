$initial_price = 0
$total_price = 0
$total_tax = 0
$total_quantity = 0
$results = Array.new

def find_name(name)
    temp = ""
    name.map { |n| n!= "imported" ? temp +=n+" " : temp }
    return temp[0...-1]
end

def calculate_price(price, tax, quantity)
    calculated_price = price + price*tax
    calculated_price = quantity*calculated_price.round(2)
end



def process
    exempt = ["book", "chocolate bar", "headache pills", "box of chocolates", "packet of headache pills"]
    basic = ["music CD", "bottle of perfume"]
    input = gets.chomp
    array = input.split
    
    quantity = array[0].to_i
    price = array[-1].to_f
    $initial_price += price
    imported = false
    tax = 0
    
    product_name = find_name(array[1...-2])
    
    if exempt.include? product_name
        tax = 0
    else
        tax = 0.1
    end

    if array.include? "imported"
        tax += 0.05
    end
    final_price = calculate_price(price, tax, quantity)
    $total_price += final_price

    $results.push( array[0...-2].join(" ") + ": #{final_price}")
end

t = gets.chomp.to_i

while(t != 0)
    process
    t-=1
end

puts $results
puts "Sales Taxes: #{($total_price - $initial_price).round(2)}"
puts $total_price