command -v ssh >/dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed."; }

class VidGrabber
	#We need to first add checks for our apps that are OS agnostic. 
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
