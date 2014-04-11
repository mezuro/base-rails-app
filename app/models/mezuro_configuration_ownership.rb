class MezuroConfigurationOwnership < ActiveRecord::Base
  belongs_to :user
  
  has_many :clones, class_name: "MezuroConfigurationOwnership", foreign_key: "parent_id"
  belongs_to :parent, class_name: "MezuroConfigurationOwnership", foreign_key: "parent_id"

  validates :mezuro_configuration_id, presence: true

  validate do |config|
  	@errors.add(:base, "configuration should not bet it's own parent") if config == config.parent
  end

  def mezuro_configuration
    MezuroConfiguration.find(mezuro_configuration_id)
  end
end
