class HydralicParticular < ActiveRecord::Base
  belongs_to :sub_project, foreign_key: :sub_project_id
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  ATTACH_TYPES = ["Digitised Copy", "Pdf Copy", "Hp Copy", "Word File", "Scanned Copy"]
  validates_presence_of :title

  def self.canals
  	where(:hydralic_type => 'Canal').order('title asc')
  end

  def self.structures
  	where(:hydralic_type => 'Structure').order('title asc')
  end

  def self.approved
    where(:hydralic_type => 'Approved').order('created_at asc')
  end
end
