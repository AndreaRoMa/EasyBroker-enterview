class ApplicationController < ActionController::Base

  EasyBroker.configure do |config|
    config.api_key = 'kz0k6kmu660a48nivfbavg7wxwkxhf'
  
    # Optionally change the root API URL
    # config.api_root_url = 'https://www.myebproxy.com/api/v1/'
  end

  client = EasyBroker.client

client.properties.find('EB-123')
results = client.properties.search # results is an enumerator

# Print the first page of up to 20 results
results.each do |property|
  puts property.public_id
end

# Or use find_each to automatically iterate over all the results on each page
results.find_each do |property|
  puts property.public_id
end

# The total number of results of all pages
results.total 

# The current page
results.page 

# Loads the next page results
results.next_page 


# Search for only published properties
client.properties.search(search: { statuses: [:published] } )

EasyBroker.client(logger: my_logger)

end
