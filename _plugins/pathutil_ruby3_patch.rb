# Ruby 3.0+ compatibility: pathutil 0.16.2 passes a Hash as a positional
# arg to File.read, which expects an Integer length. Fix kwargs forwarding.
class Pathutil
  def read(*args, **kwd)
    kwd[:encoding] ||= encoding
    if normalize[:read]
      File.read(self, *args, **kwd).encode(universal_newline: true)
    else
      File.read(self, *args, **kwd)
    end
  end
end
