class Mesa
  attr_accessor :mesa

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
    return (@r1 + @r2 + @r3 + @r4).to_f/4
  end

end

def read_file()
  data = []
  mesa_list = []

  File.open('casino.txt','r') { |file| data = file.readlines}
  data.each do |mesa|
    ls = mesa.split(', ')
    mesa_list << Mesa.new(*ls)
  end
  return mesa_list
end


mesa_list = read_file()
mesa_list.each {|mesa| puts "El máximo recaudado en la #{mesa.mesa} fue de #{mesa.max_recaudado[1]} y se dio el día #{mesa.max_recaudado[2]}" }
puts "El promedio total de todas las mesas es: #{mesa_list.inject(0) {|suma, mesa| suma + mesa.average } / 4}"
