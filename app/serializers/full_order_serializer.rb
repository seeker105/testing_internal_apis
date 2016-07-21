class FullOrderSerializer < ActiveModel::Serializer
  attributes :id, :order_number, :num_items

  has_many :items
  # has_many :items, serializer: SomeCustomItemSerializer
        #use this to use a specific serializer for this return

  def num_items
    object.items.count
    #here 'object' refers to the item being serialized. Like 'self'
  end
end
