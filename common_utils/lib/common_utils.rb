class Common_utils
	# check if command exists
	# http://stackoverflow.com/a/5471032/682912
	def self.which(cmd)
		exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
		ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
			exts.each { |ext|
				exe = File.join(path, "#{cmd}#{ext}")
				return exe if File.executable?(exe) && !File.directory?(exe)
			}
		end
		return nil
	end

	# Execute a shell command
	# return output
	# abort if the command throws an error
	def self.exec_shell(cmd)
		out = system(cmd)
		if $?.exitstatus != 0
			abort "Error: the command #{cmd} failed"
		end
		return out
	end

  def self.is_windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def self.is_mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def self.is_unix?
    !is_windows?
  end

  def self.is_linux?
    is_unix? and not is_mac?
  end

end
