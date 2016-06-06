IO = [
  [3, 1333333],
  [4, 2000000],
  [8, 2202898],
]

@factorial = {1 => 1}
def factorial n
  return @factorial[n] unless @factorial[n].nil?
  return @factorial[n] = n * factorial(n-1)
end

@combi_cnt = {}
def combi_cnt all, choise
  return @combi_cnt[[all, choise]] unless @combi_cnt[[all, choise]].nil?
  return @combi_cnt[[all, choise]] = factorial(all) / ( factorial(all - choise) * factorial(choise) )
end

@sn = {}
def sn r
  return @sn[r] unless @sn[r].nil?
  return @sn[r] = 1 / ((1 - r.to_f)**2)
end

def solve n
  all_count = 2 ** n
  limen = (n / 2.to_f - 1).round

  [*1..limen].to_a.inject(0) do |sum, i|
    # probability finish
    pf = 1 / all_count.to_f * ( combi_cnt(n, i) + combi_cnt(n, n - i) )
    # probability continue
    pc = 1 - pf
    pf * sn(pc)
  end
end
