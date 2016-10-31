#command -v ssh >/dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed."; }

if RUBY_PLATFORM == "java"
	puts "This application is currently not compatible with JRuby"
	exit 1
end

module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end
	
end


class VidGrabber

	#We need to first add checks for our apps that are OS agnostic. 
	if OS.windows? 
		def which(cmd)
			exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
			ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
				exts.each { |ext|
					exe = File.join(path, "#{cmd}#{ext}")
					return exe if File.executable?(exe) && !File.directory?(exe)
				}
			end
			return nil
		end
	end

	if OS.mac? || OS.unix?
			system("which ruby > /dev/null 2>&1")
			system("which lftp > /dev/null 2>&1")
	end



end


