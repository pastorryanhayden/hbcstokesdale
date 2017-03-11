require 'json'
require 'airtable'
require 'active_support/all'
# require 'active_support/all'

# Pass in api key to client
@client = Airtable::Client.new("keyRTLlrVS02vC3Vx")
# Pass in the app key and table name


# Sermons

@table = @client.table("appPKvhGj1o35NswV", "Sliders")
@records = @table.records(:filterByFormula => "published", :limit => 5)

File.open("_data/slider.json", "w") do |f|
    data = @records.map { |record| record.attributes }
    f.write(data.to_json)
end



