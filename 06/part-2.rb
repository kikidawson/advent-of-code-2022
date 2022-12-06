data   = File.open("data.txt")
packet = data.read.chars

def repetition(array)
  array.uniq.length == array.length
end

for i in 13..packet.length - 1 do
	if repetition(packet[i-13..i]) then
    p "start-of-packet marker = #{i + 1}"
		break
	end
end
