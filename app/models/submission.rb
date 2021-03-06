class Submission
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps
  field :author_id, type: Moped::BSON::ObjectId
  field :reviewer_id, type: Moped::BSON::ObjectId
  field :name, type: String
  field :datetime, type: DateTime
  field :annotations, type: String
  field :audio, type: Integer
  embeds_many :stack_items
  embeds_one :chat, autobuild: true
  has_mongoid_attached_file :score
  has_attached_file :recording, :path => "uploads/:id-actual.:extension"

	attr_accessible :reviewer_tokens, :author_id, :reviewer_id, :name
	attr_reader :reviewer_tokens


  validates_presence_of :name, :author_id, :reviewer_id

end
