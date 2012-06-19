class ToHaml
  def initialize(path)
    @path = path
	end
	def convert!
		Dir["#{@path}/**/*.erb"].each do |file|
		`html2haml -ex #{file} #{file.gsub(/\.erb$/, '.haml')}`
		`rm -f #{file}`
		end
	end
end
 
path = File.join(File.dirname(__FILE__), 'app', 'views')
ToHaml.new(path).convert!
