require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit a snack show page", type: :feature do
    before :each do
      @owner = Owner.create(  name: "Phil")

      @machine_1 = @owner.machines.create(  location: "Denver",
                                    id: 1
      )

      @machine_2 = @owner.machines.create(  location: "Boulder",
                                            id: 2
      )

      @machine_3 = @owner.machines.create(  location: "The Moon",
                                            id: 3
      )

      @snack_1 = Snack.create(  name: "Cheetos",
                                price: 1,
                                id: 1
      )

      @snack_2 = Snack.create(  name: "Fretos",
                                            price: 2,
                                            id:2
      )

      @machine_1.snacks << [@snack_1, @snack_2]
      @machine_2.snacks << [@snack_1, @snack_2]

      visit "/snacks/#{@snack_1.id}"
    end

    it "i see the snack name price machine locations machine avg price machine snack count" do
      expect(page).to have_content(@snack_1.name)
      expect(page).to have_content(@snack_1.price)

      expect(page).to have_content(@machine_1.location)
      expect(page).to have_content(@machine_1.avg_snack_price)
      expect(page).to have_content(@machine_1.snack_count)

      expect(page).to have_content(@machine_2.location)
      expect(page).to have_content(@machine_2.location)
      expect(page).to have_content(@machine_2.avg_snack_price)
      expect(page).to have_content(@machine_2.snack_count)

      expect(page).to_not have_content(@machine_3.location)

    end
  end
end


# ```
# User Story 3 of 3
#
# As a visitor
# When I visit a snack show page
#       I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
# ```
