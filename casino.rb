class Mesa
  def initialize(mesa, r1, r2, r3, r4)
    @mesa = mesa
    @r1 = r1.to_i
    @r2 = r2.to_i
    @r3 = r3.to_i
    @r4 = r4.to_i
  end

  def max_recaudado
    recaudacion = [@r1, @r2, @r3, @r4]
    resumen = []
    resumen.push(@mesa)
    resumen.push(recaudacion.max)
    resumen.push(recaudacion.index(recaudacion.max) + 1)
    return resumen
  end

  def average
    return (@r1 + @r2 + @r3 + @r4)/4
  end
end

def read_file(mesa_list, max_reca, average)
  data = []
  File.open('casino.txt','r') { |file| data = file.readlines}
  data.each do |mesa|
    ls = mesa.split(', ')
    mesa = Mesa.new(*ls)
    mesa_list << mesa
    max_reca << mesa.max_recaudado
    average << mesa.average
  end
  return mesa_list, max_reca, average
end

mesa_list = []
max_reca = []
average = []

read_file(mesa_list, max_reca, average)
max_reca.each {|mesa| puts "El máximo recaudado en la #{mesa[0]} fue de #{mesa[1]} y se dio el día #{mesa[2]}" }
puts "El promedio total de todas las mesas fue de: #{average.sum/average.size.to_f}"
