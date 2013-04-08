# Determine if two URIs match. For the purpose of this challenge, you should use
# a case-sensitive octet-by-octet comparison of the entire URIs, with these
# exceptions:
#
# 1. A port that is empty or not given is equivalent to the default port of 80
# 2. Comparisons of host names MUST be case-insensitive
# 3. Comparisons of scheme names MUST be case-insensitive
# 4. Characters are equivalent to their % HEX HEX encodings.
#    (Other than typical reserved characters in urls like /,?,@,:,&,= etc)

def normalize_path(path)
  path.scan(/%(\h\h)/) do |hex, _|
    path = path.gsub(/%#{hex}/, hex.to_i(16).chr)
  end
  path
end

def uris_equal?(a, b)
  a, b = [a, b].map do |uri|
    match = /^(?<scheme>[^:]+):\/\/
     (?<host>[^:\/]+)
     (:(?<port>\d+)?)?
     (?<path>\/.*)?$/x.match(uri)
    {
      scheme: match[:scheme].downcase,
      host:   match[:host].downcase,
      port:   match[:port] || '80',
      path:   normalize_path(match[:path] || '/'),
    }
  end

  a == b
end

File.open(ARGV[0]).each do |line|
  uris = line.strip.split(';')
  puts (uris_equal?(*uris) ? 'True' : 'False')
end
