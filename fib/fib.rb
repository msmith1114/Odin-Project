def fibs(n)
  fib = [0, 1]
  n.times { fib << fib[-1] + fib[-2] }
end

def fibs_rec(n)
  if n == 0
  	0
  elsif n == 1
  	1
  else
  	fibs_rec(n - 1) + fibs_rec(n - 2)
  end
end
