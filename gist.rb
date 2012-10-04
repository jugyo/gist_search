class Gist
  def self.search(username, keyword)
    Groonga["Gists"].select { |record| record.user_name == username && record.content =~ keyword }
  end
end
