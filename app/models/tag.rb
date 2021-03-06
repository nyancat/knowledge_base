class Tag < ActiveRecord::Base
  has_many :fact_tags, :dependent => :destroy
  has_many :facts, :through => :fact_tags

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end
end
