require 'httpclient'
require 'json'
require 'colored'

class Indexer
  def self.fetch(username, page_count = 1)
    httpclient = HTTPClient.new

    (1..page_count).reverse_each do |page|
      url = "https://api.github.com/users/#{username}/gists?page=#{page}"
      puts "fetch data from: #{url}".green

      content = httpclient.get_content(url)
      JSON.parse(content).reverse_each do |gist|
        if Groonga["Gists"].has_key?(gist['id'])
          puts "skip: #{gist['id']}".blue
          next
        end

        content = gist['description'] || ''
        gist['files'].each do |filename, data|
          content << filename
          puts "fetch data from: #{data['raw_url']}".blue
          content << httpclient.get_content(data['raw_url'])
          sleep 0.1
        end
        # puts content

        Groonga["Gists"].add(gist['id'], user_name: gist['user']['login'], content: content)
        sleep 0.1
      end
    end
  end
end
