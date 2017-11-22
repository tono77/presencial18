class Roullette
  attr_accessor :apuesta, :azar
  def initialize(apuesta)
    @r = (1..10).to_a
    @azar = @r[rand(@r.length)]
    @apuesta = apuesta
  end

  def play()
     @azar == @apuesta ? true : false
  end

  def apuesta
    file = File.open('roulette_history.txt','a')
    file.puts(@azar)
    file.close
    File.open('winners.txt','a').puts(@azar) if play
  end
end

def roulette_history
  file = File.open('roulette_history.txt','r')
  data = file.readlines.map(&:chomp)
  file.close
  return data
end

Apuesta = 5
ruleta = Roullette.new(Apuesta)
ruleta.apuesta
puts "Aposté al #{Apuesta} y salió #{ruleta.azar}"

hash = roulette_history.group_by {|e| e}

#hacer más legible esto
puts "El valor que más ha salido es #{hash.max_by {|k, v| v.size}[0]} con #{hash[hash.max_by {|k, v| v.size}[0]].size} ocurrencias"
