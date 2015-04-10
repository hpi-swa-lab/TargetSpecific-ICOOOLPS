class A
	def foo(a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9, j:10)
		a+b+c+d+e+f+g+h+i+j
	end
end

class Wrapper
  attr_accessor :var

  def initialize
    @a = A.new
  end

  def get()
    @a
  end
end

start = Time.now
10.times.each do |times|
    start_run = Time.now
    o = Wrapper.new

    (1..1_000_000).each do |i|
	      o.get().foo(a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9, j:10)
    end
    end_time = Time.now
    puts "Current runtime: #{(end_time - start_run)*1000} ms"
end
end_time = Time.now

puts "----------------------------"
puts "Total runtime: #{(end_time - start)*1000} ms"