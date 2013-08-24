# You have JSON string which describes a menu. Calculate the SUM of IDs of all
# "items" in case a "label" exists for an item.

require 'json'

File.open(ARGV[0]).each_line do |line|
  json = JSON.parse(line)

  items_with_labels = json['menu']['items'].compact.select { |item| item['label'] }

  puts items_with_labels.inject(0) { |acc, item| acc + item['id'].to_i }
end
