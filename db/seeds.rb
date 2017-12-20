# 
# steve = User.create!(
#   :firstname => "steve",
#   :lastname => "hansen",
#   :phone => "0800allblacks",
#   :dob => "2000-12-21",
#   :email => "steve@hansen.com",
#   :password => "steve123"
# )
# lucy = User.create!(
#   :firstname => "lucy",
#   :lastname => "lawless",
#   :phone => "0800xena",
#   :dob => "2000-12-21",
#   :email => "lucy@lawless.com",
#   :password => "lucy123"
# )
# brian = User.create!(
#   :firstname => "brian",
#   :lastname => "grumble",
#   :phone => "0800brian",
#   :dob => "2000-12-21",
#   :email => "brian@grumble.com",
#   :password => "brian123"
# )
#
# warriors = Team.create!(:name => "Warriors")
# lakers = Team.create!(:name => "Lakers")
# dragons = Team.create!(:name => "Dragons")
#
# player = TeamRole.create!(:name => "Player")
# coach = TeamRole.create!(:name => "Coach")
# manager = TeamRole.create!(:name => "Manager")
#
# team_member1 = TeamMember.create!(
#   :team => warriors,
#   :user => brian,
#   :team_role => player
# )
# team_member2 = TeamMember.create!(
#   :team => warriors,
#   :user => brian,
#   :team_role => coach
# )
# team_member3 = TeamMember.create!(
#   :team => warriors,
#   :user => lucy,
#   :team_role => manager
# )
