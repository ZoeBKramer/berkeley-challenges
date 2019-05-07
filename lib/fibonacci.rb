def recursive_fib(n)

  if n == 0 
    return 0 
  elsif n == 1
    return 1
  else
    return recursive_fib(n-1) + recursive_fib(n-2)
  end

end


def iterative_fib(n)

  fibs = [0, 1]

  for i in (2...n) do 
    fibs.push(fibs[i-1] + fibs[i-2])
  end

  return fibs[n]

end


require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib") { iterative_fib(num) }
end