class Prospect < ApplicationRecord
	
	enum status: [:standby, :fetched]

end
