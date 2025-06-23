class StructureDrawing < ActiveRecord::Base
  belongs_to :sub_project, foreign_key: :sub_project_id
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  ATTACH_TYPES = ["Digitised Copy", "Photo Copy", "Scanned Copy", "Hp Copy"]
  validates_presence_of :title

  def self.drawings
  	where(:structure_type => nil).order('title asc')
  end

  def self.photos
  	where(:structure_type => 'Photos').order('created_at asc')
  end

  def self.structure_hps
    where(:structure_type => "Structure & HP's").order('created_at asc')
  end
end
