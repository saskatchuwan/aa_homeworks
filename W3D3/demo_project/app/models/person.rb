class Person < ActiveRecord::Base
  validate :name, presence: true, uniqueness: true

  belongs_to :house,
    class_name: 'House',
    primary_key: :id,
    foreign_key: :house_id

end