=begin
def read_source_code

	puts File.read(__FILE__)
end

=end

def read_source_code

File.open($0, "r") do|file| 
	file.readlines.each {|lines| puts lines}
end

end

read_source_code