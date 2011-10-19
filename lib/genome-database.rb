# = DESCRIPTION
# This file handles all requirements and session managment

begin
  	require 'rubygems'
  	require 'bio'
  	rescue LoadError
	    raise LoadError, "You must have bioruby installed"
	require 'active_record'
	rescue LoadError
	    raise LoadError, "You must have active_record installed"
	require 'composite_primary_keys'
	rescue LoadError
	    raise LoadError, "You must have composite_primary_keys installed"
end


gem 'activerecord', '>= 3.0'
gem 'activesupport', '>= 3.0'

require File.dirname(__FILE__) + '/files/db_connection.rb'
require File.dirname(__FILE__) + '/files/activerecord.rb'

class Session
    attr_accessor :coord_systems
    attr_accessor :seqlevel_id, :seqlevel_coord_system
    attr_accessor :toplevel_id, :toplevel_coord_system
    attr_accessor :coord_system_ids #map CS id to CS name
    attr_accessor :seq_regions
    attr_accessor :collection_species

    def initialize
      @coord_systems = Hash.new # key = id; value = CoordSystem object
      @coord_system_ids = Hash.new # key = id; value = name
      @seq_regions = Hash.new
    end
    
    def reset
      @coord_systems = Hash.new
      @coord_system_ids = Hash.new
      @seq_regions = Hash.new
      @seqlevel_id = nil
      @toplevel_id = nil
      @seqlevel_coord_system = nil
      @toplevel_coord_system = nil
      @collection_species = nil
    end
  end

  SESSION = Ensembl::Session.new
end

