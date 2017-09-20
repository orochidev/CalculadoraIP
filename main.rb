require "./ip"


def printResults(ip)
	p "Address: #{ip.address}"
	p "Netmask: #{ip.mask}"


	p "====="
	p "Network: #{ip.first_address}/#{ip.cidr}"
	p "HostMin: #{ip.first_host}"
	p "HostMax: #{ip.last_host}"
	p "Broadcast: #{ip.broadcast}"
	p "Hosts/net: #{ip.max_hosts}"
end

def getMask(ip)
	octetos = []
	ip.split(".").each do |decimal|
		octetos << decimal.to_bin
	end

end
input_array = ARGV
if input_array.length == 1
	ip = IP.new(input_array[0])
	printResults(ip)

end


