# Even an empty model is enough to communicate with the database
# By ref-ing ApplicationRecord, the model now 
# provide us with both getters and setters
class Article < ApplicationRecord 
    validates :title, presence:true,length:{minimum:6,maximum:100}
    validates :description, presence:true, length:{minimum:10,maximum:300}
    belongs_to :user
end




