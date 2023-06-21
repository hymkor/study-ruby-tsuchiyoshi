require 'pathname'

dir = Pathname.new(".")

dir.children.each do |cld|
  puts "#{cld} : #{cld.file?}"
end
