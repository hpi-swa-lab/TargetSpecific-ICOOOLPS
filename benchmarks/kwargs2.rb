class A
	def foo(a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9, j:10)
		a+b+c+d+e+f+g+h+i+j
	end
end

class B
	def foo(j:11, i:12, h:13, g:14, f:15, e:16, d:17, c:18, b:19, a:20)
		a+b+c+d+e+f+g+h+i+j
	end
end

class Wrapper
  attr_accessor :var

  def initialize
    @a, @b = A.new, B.new
  end

  def get()
    @var = !@var
    if var
      @a
    else
      @b
    end
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