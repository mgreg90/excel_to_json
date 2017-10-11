class Excel < ApplicationRecord
  
  def self.create_from_file(file:)
    return false if file.nil?
    file = Roo::Spreadsheet.open(file)
    headers = file.first
    excel_data = file.map do |row|
      next if row == headers
      headers.map.with_index { |header, i| [header, row[i]] }.to_h
    end.compact

    create(result_json: excel_data)
  end
  
end
