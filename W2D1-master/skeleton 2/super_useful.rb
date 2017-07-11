# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError => e
  puts "Error was: #{e.message}"

  nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue
    if maybe_fruit == 'Coffee'
      puts 'Try something else'
      retry
    end
    puts 'goodbye'
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    if name.empty?
      raise ArgumentError.new "Cannot be nameless"
    end
    @yrs_known = yrs_known
    if yrs_known < 5
      raise ArgumentError.new "Cannot be bestfriends in less than 5 years"
    end
    @fav_pastime = fav_pastime
    if fav_pastime.empty?
      raise ArgumentError.new "Please add a favorite pastime"
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
