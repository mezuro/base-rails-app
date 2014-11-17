require "validators/kalibro_uniqueness_validator.rb"

class Project < KalibroGatekeeperClient::Entities::Project
	include KalibroRecord

	attr_accessor :name,:image_url
	validates :name, presence: true, kalibro_uniqueness: true

	def repositories
		Repository.repositories_of(self.id)
	end

	def self.latest(count = 1)
		all.sort { |a,b| b.id <=> a.id }.first(count)
	end
end
