require 'csv'
data = CSV.read("data.csv").flatten
misplacedValues = Array.new

def getValue(char)
  if char == char.upcase then
    char.ord - 38
  else
    char.ord - 96
  end
end

for rucksack in data do
  halfway        = rucksack.size / 2
  compartmentOne = rucksack[0, halfway].chars.uniq
  compartmentTwo = rucksack[halfway, halfway].chars.uniq

  for item in compartmentOne do
    if compartmentTwo.include? item then
      value = getValue(item)
      misplacedValues.push(value)
    end
  end
end

p "value of items in wrong place #{misplacedValues.sum}"

teams = data.each_slice(3).to_a
teamValues = Array.new

for team in teams do
  rucksack1 = team[0].chars.uniq
  rucksack2 = team[1].chars.uniq
  rucksack3 = team[2].chars.uniq

  for item in rucksack1 do
    if rucksack2.include? item and rucksack3.include? item then
      value = getValue(item)
      teamValues.push(value)
    end
  end
end

p "value of teams #{teamValues.sum}"
