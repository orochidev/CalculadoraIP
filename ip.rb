class String
  def map
    size.times.with_object('') {|i,s| s << yield(self[i])}
  end
end
class IP
	attr_accessor :address
	attr_accessor :cidr
	
	def initialize(ip)
		self.address = ip.split("/")[0]
		self.cidr = ip.split("/")[1].to_i
	end
	def first_address
		mascara = []
		(0..3).each do |i|
		mascara[i] = address.split(".")[i].to_i & octeto_mascara[i]
		end
		mascara.join(".")
	end
	def first_host
		binary = ip_to_binary(first_address)
		binary = (binario_mascara.to_i(2) + "1".to_i(2)).to_s(2)			
		mascara = []

		(0..3).each do |i|
		mascara[i] = first_address.split(".")[i].to_i & octeto_mascara_plus[i]
		end
		mascara.join(".")
	end
	def last_host
		mascara = []
		(0..3).each do |i|
		mascara[i] = first_address.split(".")[i].to_i | octeto_mascara_negado_minus[i]

		end
		mascara.join(".")
	end
	def broadcast
		mascara = []

		(0..3).each do |i|
		mascara[i] = address.split(".")[i].to_i | octeto_mascara_negado[i]
		end
		mascara.join(".")
	end
	def mask
		octeto_mascara.join(".")
	end
	def count_subredes
		
	end
	def max_hosts
		(2**(32-cidr)) - 2
	end
	private

	def ip_to_binary(ip)
		octetos = ip.split(".")
		octetos.map { |o| o.to_i.to_s(2)}
		octetos.join
	end
	def binary_to_ip(binary)
		binary.chars.each_slice(8).map(&:join)
		binary.map{|s| s.to_i(2)}
	end
	def ip_plus(ip)
		binary = ip_to_binary(ip)
		(binario_mascara.to_i(2) + "1".to_i(2)).to_s(2)
	end
	def ip_minus(ip)

	end
	def binario_mascara
		string = ("1" * cidr) 
		string << ("0"*(32-cidr.to_i)) 	
	end
	def binario_mascara_plus
		(binario_mascara.to_i(2) + "1".to_i(2)).to_s(2)
	end
	def binario_mascara_minus
		(binario_mascara.to_i(2) - "1".to_i(2)).to_s(2)
	end

	def binario_octeto_mascara
		binario_mascara.chars.each_slice(8).map(&:join)
	end
	def binario_octeto_mascara_plus
		binario_mascara_plus.chars.each_slice(8).map(&:join)
	end
	def octeto_mascara
		binario_octeto_mascara.map {|s| s.to_i(2)}
	end

	def octeto_mascara_plus
		binario_octeto_mascara_plus.map {|s| s.to_i(2)}
	end
	def octeto_mascara_negado_minus
		aux = binario_mascara.map do |i|
			if i == "0"
				"1" 
			else
				"0"
			end		
		end 
		batata = (aux.to_i(2) - "1".to_i(2)).to_s(2)
		aux = "0"*(32-batata.length)
		aux << batata

		aux = aux.chars.each_slice(8).map(&:join)

		aux.map {|s| s.to_i(2)}
	end

	def octeto_mascara_negado
		aux = binario_mascara.map do |i|
			if i == "0"
				"1" 
			else
				"0"
			end		
		end 
		aux = aux.chars.each_slice(8).map(&:join)
		aux.map {|s| s.to_i(2)}
	end
	def octeto_address
		address.split(".")
	end
end
