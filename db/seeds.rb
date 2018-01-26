
user_list = [
  "Cam Ferreria",
  "Matt Wilkes",
  "Tammy Ferreria",
  "Michael Poa",
  "Ben Scully",
  "Lisa Emery",
  "Chris Jospeh",
  "Ruth Prime",
  "Anaru Kupa",
  "Arahina Roberts",
  "Bron Jahnke",
  "Calin Erueti",
  "Dez Searancke",
  "Jaimee Bialy",
  "Jay Masters",
  "Kahu Gray",
  "Katie Brown",
  "Kitty Aofia",
  "Kylah Roundtree",
  "Noah Lindstrom",
  "Pania Gray",
  "Pete Hazelman",
  "Scott Turner",
  "Sonia Steckler",
  "Tiana Wilson",
  "Zoe Ferreria",
  "Ariana Gray",
  "Ben Grenfell",
  "George Jahnke",
  "Rhion Smith",
  "Manea Poa-Maoate",
  "Ritisha Mistry",
  "Steph Hoare",
  "Jada Jacobs",
  "Richard Evans",
  "Ace Wiperi",
  "Alphonso Goulding"
].sort

users = user_list.map do |x|
  first = x.split(' ')[0]
  second = x.split(' ')[1]

  User.create!(
    :firstname => first,
    :lastname => second,
    :phone => "0800#{first}#{second}",
    :dob => '2000-12-21',
    :email => "#{first}@#{second}.com",
    :password => "#{first}123#{second}"
  )
end

gems = Squad.create!(:name => 'GEMs')
vapour = Squad.create!(:name => 'Vapour')
social_mixed = Squad.create!(:name => 'Social Mixed')

# users.shuffle!

users.shuffle.slice(1..6).each.with_index do |e, i|
  SquadMember.create!(:squad => gems, :user => e)
end

users.shuffle.slice(1..5).each.with_index do |e, i|
  SquadMember.create!(:squad => vapour, :user => e)
end

users.shuffle.slice(1..7).each.with_index do |e, i|
  SquadMember.create!(:squad => social_mixed, :user => e)
end

game1 = Game.create!(
  :squad => gems,
  :name => 'vs Hunters',
  :start => '2017-07-07 00:00:00',
)
game2 = Game.create!(
  :squad => gems,
  :name => 'vs Lowkey',
  :start => '2017-06-06 00:00:00',
)
game3 = Game.create!(
  :squad => vapour,
  :name => 'vs SumthinsBurning',
  :start => '2017-03-12 00:00:00',
)
game4 = Game.create!(
  :squad => social_mixed,
  :name => 'vs TigerLions',
  :start => '2017-04-20 00:00:00',
)

gems.squad_members.each.with_index do |squad_member, i|
  return if i > 2
  GameMember.create!(
    :game => game1,
    :squad_member => squad_member
  )
end
