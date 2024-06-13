puts "Digite o primeiro número:"
num1= gets.chomp
puts "Digite o segundo número:"
num2= gets.chomp

num1 = num1.include?('.') ? num1.to_f : num1.to_i
num2 = num2.include?('.') ? num2.to_f : num2.to_i

puts "O primeiro número é #{num1}"
puts "O segundo número é #{num2}"
soma = num1 + num2
puts "#{soma}"
puts "#{soma}".class