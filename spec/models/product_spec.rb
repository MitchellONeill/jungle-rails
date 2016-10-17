require 'rails_helper'

RSpec.describe Product, type: :model do

  # #all pass
  # let(:scooteroos) { Product.new(name: 'Scooteroos', price: '2500', quantity: 5, category_id: 1) }
  # #no name
  # let(:noname) { Product.new(price: '2500', quantity: 5, category_id: cat.id) }
  # #no price
  # let(:noprice) { Product.new(name: 'Scooteroos', quantity: 5, category_id: cat.id) }
  # #no quantity
  # let(:noquantity) { Product.new(name: 'Scooteroos', price: '2500', category_id: cat.id) }
  # #no category
  # let(:nocategory) { Product.new(name: 'Scooteroos', price: '2500', quantity: 5) }


  describe 'Validations' do

    it 'should be saved' do
      cat = Category.create(name: "Stuff")
      pro = Product.create(name: 'Scooteroos', price: '2500', quantity: 5, category_id: cat.id)
      expect(pro).to be_valid
    end

    it 'should not save to the db if missing name' do
      cat = Category.create(name: "Stuff")
      pro = Product.new(price: '2500', quantity: 5, category_id: cat.id)
      # expect(pro.valid?).to be false
      pro.save
      expect(pro.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save to the db if missing price' do
      cat = Category.create(name: "Stuff")
      pro = Product.new(name: 'Scooteroos', quantity: 5, category_id: cat.id)
      expect(pro.valid?).to be false
      expect(pro.errors.full_messages).to include("Price is not a number")
      expect(pro.errors.full_messages).to include("Price can't be blank")
    end

    # Error testing by checking errors.size
    it 'should not save to the db if missing quantity' do
      cat = Category.create(name: "Stuff")
      pro = Product.new(name: 'Scooteroos', price: '2500', category_id: cat.id)
      expect(pro.valid?).to be false
      expect(pro.errors.size).to eql(1)

    end
    it 'should not save to the db if missing category' do
      pro = Product.new(name: 'Scooteroos', price: '2500', quantity: 5)
      expect(pro.valid?).to be false
      expect(pro.errors.size).to eql(1)
    end
  end

end
