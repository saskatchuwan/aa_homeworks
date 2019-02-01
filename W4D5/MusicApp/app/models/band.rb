# == Schema Information
#
# Table name: bands
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ApplicationRecord
  validates :name, presence:true

  has_many :albums,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: 'Album'
  
  def self.find_by_name(name)
    @band = Band.find_by(name: name)

    if @band
      return @band
    else
      return nil
    end
  end

  def band_id
    self[:id]
  end



end

