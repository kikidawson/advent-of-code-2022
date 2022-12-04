require 'csv'
data = Array.new

CSV.foreach("data.csv") do |pair|
  pair = pair.join("-").split("-")
  pair.map! { |string| string.to_i }
  data.push(pair)
end

count = 0

for pair in data do
  if (pair[0] <= pair[2]) and (pair[1] >= pair[3]) then
    p pair
    count += 1
  elsif (pair[0] >= pair[2]) and (pair[1] <= pair[3]) then
    count += 1
  end
end

p "number of assignment pairs where one fully contains the other: #{count}"
