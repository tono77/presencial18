require 'date'

class Course
  attr_accessor :name, :start_date, :end_date

  def initialize(name, start_date, end_date)
    @name = name
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
  end

  def start_course(date)
     @start_date < date ? true : false
  end

  def end_course(date)
     @end_date > date ? true : false
  end
end

def read_file()
  data = []
  curso_list = []
  File.open('cursos.txt','r') { |file| data = file.readlines.map(&:chomp)}
  data.each do |curso|
    ls = curso.split(', ')
    curso_list << Course.new(*ls)
  end
  return curso_list
end


DateBegin = Date.parse('2017-05-20')
DateEnd = Date.parse('2017-10-20')

curso_list = []
curso_list = read_file()


puts "\n\nLos Cursos que comienzan antes de #{DateBegin} son:"
(curso_list.select {|curso| curso.start_course(DateBegin)}).each do |curso|
   puts "#{curso.name} comienza el #{curso.start_date}"
end
puts "=============\n\n"
puts "Los Cursos que finaliza posterior a #{DateEnd} son"
(curso_list.select {|curso| curso.end_course(DateEnd)}).each do |curso|
  puts "#{curso.name} termina el #{curso.end_date}"
end
