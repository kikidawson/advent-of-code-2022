require 'csv'
procedure = CSV.read("data.csv")
plan = CSV.parse(File.read("table.csv"), headers: false)

no_of_columns = plan[0][0].length / 4 + 1

array_of_columns = Array.new

for i in 1..no_of_columns do
  column = Array.new
  i = i * 4 - 3
  for row in plan do
    column.push(row[0][i])
  end
  column.keep_if{ |x| x=~/[A-Z]+/ }
  array_of_columns.push(column.reverse)
end

for row in procedure do
  step        = row[0].split(" ").keep_if{ |x| x=~/[1-9]+/ }
  number      = step[0].to_i
  from_column = step[1].to_i - 1
  to_column   = step[2].to_i - 1
  moving_crates = Array.new

  for i in 1..number do
    moving_crates.push(array_of_columns[from_column].pop)
  end
    moving_crates = moving_crates.reverse
	for i in 0..moving_crates.length - 1 do
    array_of_columns[to_column].push(moving_crates[i])
	end

end

for column in array_of_columns do
  p column.last
end


# "    [D]    "
# "[N] [C]    "
# "[Z] [M] [P]"

# "[D]        "
# "[N] [C]    "
# "[Z] [M] [P]"

# "        [D]"
# "        [N]"
# "    [C] [Z]"
# "    [M] [P]"

# "        [Z]"
# "        [N]"
# "[C]     [D]"
# "[M]     [P]"

# "        [Z]"
# "        [N]"
# "        [D]"
# "[M] [C] [P]"

# move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2
