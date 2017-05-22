# 1. Print welcome
# 2. Get horses - get chomp - push into new array - while loop until empty string
# 3. Get user's bet - get chomp
# 4. Run the race - sample method horses
# 5. Print results

bank = 100.0
turn = 0
amount = 0

horses = {
  "bernardo" => 5.0,
  "keith" => 10.0,
  "johno" => 2.0,
  "silver bullet" => 100.0
}

puts "Welcome to this awesome horse race!"

while bank > 0

puts "balance: #{bank}"
  horses.each do |horse, odds|
    puts "#{horse.capitalize} @ #{odds}"
  end

  puts "Which horse would you like to bet on?"
  horse = gets.chomp.downcase

  puts "How much do you want to bet?"
  amount = gets.chomp.to_i

  puts "You bet on #{amount} on #{horse.capitalize}!"

  sleep(1)

winner = horses.keys.sample

  if winner == horse
    amount_won = amount * horses[horse]
    puts "you won! #{amount_won} was added to you bank"
    bank = bank + amount_won
  elsif horses.include? horse
    puts "you lost! The winner was #{winner.capitalize}"
    bank = bank - amount
    puts "your balance is: #{bank}"
  else
    puts "you muppet, choose a horse thats running. No money was taken from your account"
  end
end

puts "you are out of cash"

