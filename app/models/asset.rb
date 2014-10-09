class Asset < ActiveRecord::Base
  belongs_to :project
  after_create :set_original_id
  after_save :set_max_version
  scope :latest, -> {group(:original_id).having('max(version) = version')}
  scope :original, -> {group(:original_id).having('min(version) = version')}
  
  def versions
    @versions ||= Asset.where(original_id: self.original_id).order(:created_at)
  end
  
  def add_version
    clone = self.dup
    clone.version = clone.max_version = max_version + 1
    clone
  end
  
  private
  
  def set_original_id
    self.update_columns(original_id: self.id) unless original_id?
  end
  
  def set_max_version
    latest = self.versions.maximum(:version)
    ActiveRecord::Base.connection.execute("UPDATE assets SET max_version = #{latest} WHERE original_id = #{original_id}")
  end
end
