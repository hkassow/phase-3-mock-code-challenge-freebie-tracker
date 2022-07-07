class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies
    def recieved_one? item_name
        self.freebies.find_by(item_name: item_name).nil?? false: true
    end
    def give_away dev, freebie
        if self.recieved_one? freebie.item_name
            freebie.update( dev_id: dev.id)
        end
    end
end
