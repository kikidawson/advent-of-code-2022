require 'csv'
data = Array.new

CSV.foreach("data.csv") do |pair|
  pair = pair.join("-").split("-")
  pair.map! { |string| string.to_i }
  data.push(pair)
end

count = 0

for pair in data do
  if (pair[0] <= pair[2]) and ( pair[1] >= pair[2]) then
    count += 1
  elsif (pair[0] <= pair[3]) and (pair[1] >= pair[3]) then
    count += 1
  elsif (pair[2] <= pair[0]) and (pair[3] >= pair[0]) then
    count += 1
  elsif (pair[2] <= pair[1]) and (pair[3] >= pair[1]) then
    count += 1
  end
end

p "number of assignment pairs that overlap: #{count}"
