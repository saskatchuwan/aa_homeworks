class House < ActiveRecord::Base
  validate :name, presence: true, uniqueness: true

  has_many :person 
    class_name: 'Person',
    primary_key: id
    foreign_key: :house_id
  
end