require 'json'
require 'airtable'
require 'active_support/all'
# require 'active_support/all'

# Pass in api key to client
@client = Airtable::Client.new("keyRTLlrVS02vC3Vx")
# Pass in the app key and table name


# Sermons

@table = @client.table("appCXkr9U5TgyOsrU", "series")
@records = @table.records(:filterByFormula => "published", :sort => ["sermon_date", :desc], :limit => 100)

File.open("_data/series.json", "w") do |f|
    data = @records.map { |record| record.attributes }
    f.write(data.to_json)
end



