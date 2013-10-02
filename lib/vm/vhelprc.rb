def vhelprc_exists?()
  _exists?(".vhelprc")
end

def vhelprctemp_exists?()
  _exists?(".vhelprctemp")
end

def vhelprctemp_create()
  _create('.vhelprctemp')
end

def vhelprc_create()
  _create('.vhelprc')
end

def vhelprc_path()
  _path(".vhelprc")
end

def vhelprctemp_path()
  _path(".vhelprctemp")
end

def vhelprctemp_delete()
  _delete(".vhelprctemp")
end

private
def _create(filename)
  `touch #{_path(filename)}`
end

def _exists?(filename)
  return File.exist?(_path(filename)) && File.file?(_path(filename))
end

def _path(filename)
  user_home = ENV['HOME']
  if user_home.nil? || user_home.length == 0
    puts "Environmental variable HOME must be set to user's home directory."
  else
    ENV['HOME'] + "/#{filename}"
  end
end

def _delete(filename)
  File.delete(_path(filename))
end
