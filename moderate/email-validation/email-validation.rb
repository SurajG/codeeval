# Write a regex to validate an email address

File.open(ARGV[0]).map(&:strip).each do |email|
  puts email.match(/^[a-zA-Z1-9_]+@([a-zA-Z1-9_]+.)[a-z]+$/) ? true : false
end
