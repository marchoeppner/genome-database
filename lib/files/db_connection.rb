#!/usr/bin/ruby
# = DESCRIPTION
# This files handles connections to a species database

Genome_DB_ADAPTER = 'mysql'
Genome_DB_HOST = 'localhost'
Genome_DATABASE = 'locus_db'
Genome_DB_USERNAME = 'tools'
Genome_DB_PASSWORD = 'analysis'
Genome_DB_Port = 3306

module Genome
  
  	include ActiveRecord
  
	class DBConnection < ActiveRecord::Base
	  	self.abstract_class = true
  		self.pluralize_table_names = false
    	
    	def self.connect(species,version="",args={})

      		establish_connection(
                            :adapter => args[:adapter] ||= Genome_DB_ADAPTER,
                            :host => args[:host] ||= Genome_DB_HOST,
                            :database => args[:database] ||= "#{Genome_DATABASE}_#{version}",
                            :username => args[:username] ||= Genome_DB_USERNAME,
                            :password => args[:password] ||= Genome_DB_PASSWORD,
                            :port => args[:port] ||= Genome_DB_Port  
                          )
    	end
  
  	end
  
end
