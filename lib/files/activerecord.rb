
module Genome

	class CoordSystem < DBConnection
		set_primary_key 'coord_system_id'
		has_many :seq_regions
	end

	class SeqRegion < DBConnection
		set_primary_key 'seq_region_id'
		has_many :genes
		belongs_to :coord_system
	end
	
	class Gene < DBConnection
		set_primary_key 'gene_id'
		belongs_to :seq_region
		has_one :gene_stable_id
		has_many :transcripts
	end # end Gene
	
	class GeneStableId
		set_primary_key :gene_id
		belongs_to :gene, :foreign_key => 'gene_id'
	end # end GeneStableId

	class Transcript < DBConnection
		set_primary_key 'transcript_id'
		belongs_to :gene, :foreign_key => 'gene_id'
		has_many :xref_transcript_exons
		has_many :exons, :through => :xref_transcript_exons
	end # end transcript
	
	class XrefTranscritpExon < DBConnection
		set_primary_keys :transcript_id, :exon_id
		belongs_to :transcript, :foreign_key => 'transcript_id'
		belongs_to :exon, :foreign_key => 'exon_id'
	end # end XrefTranscriptExon
	
	class Exon < DBConnection
		set_primary_id 'exon_id'
		has_many :xref_transcript_exons
	end # end Exon
	
	class Translation
		set_primary_id 'translation_id'
		belongs_to :transcript, :foreign_key => 'transcript_id'
	end # end Translation
	
	
end
