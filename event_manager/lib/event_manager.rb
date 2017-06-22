require 'csv'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0.4]
end

def save_thank_you_letters(first_name, last_name, form_letter)
  Dir.mkdir('output') unless Dir.exists?('output')

  filename = "output/thanks_#{first_name}_#{last_name}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts 'EventManager initialized.'

template_letter = File.read 'form_letter.erb'
erb_template = ERB.new template_letter

contents = CSV.open '../event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  first_name = row[:first_name]
  last_name = row[:last_name]
  zipcode = clean_zipcode(row[:zipcode])

  form_letter = erb_template.result(binding)

  save_thank_you_letters(first_name, last_name, form_letter)

end