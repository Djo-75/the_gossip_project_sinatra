# require 'pry'
require 'csv'

class Gossip

    attr_accessor :author, :content

    def initialize(author, content)
      @author = author
      @content = content
    end

    def save # méthode d'instance
      CSV.open("./db/gossip.csv", "a+") do |csv|
        csv << [@author, @content]
      end
      rescue => error
      puts "Error while writing to the CSV file: #{error}"
    end

    def self.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      return all_gossips
    end    

    def self.find(index_gossip)
        num = index_gossip.to_i
        gossips_db = self.all
      return gossips_db[num]
    end
end

# binding.pry

# Gossip.new("José", "Josiane est nulle").save