function dq = fun (t, q)
  dq = zeros(2,1)
  dq(1) = q(2)
  dq(2) = 2*cos(5*t) + 7*dq(2) - sin(3*t)
endfunction
