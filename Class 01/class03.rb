puts "Digite o primeiro número:"
num1= gets.chomp
puts "Digite o segundo número:"
palavra = gets.chomp

num1 = num1.include?('.') ? num1.to_f : num1.to_i

text = "Você digitou o número #{num1} e a palavra #{palavra}"
puts text

