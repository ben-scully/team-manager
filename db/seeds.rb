
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

users.shuffle.each.with_index do |e, i|
  break if i > 18
  gems.users << e
end

users.shuffle.each.with_index do |e, i|
  break if i > 12
  vapour.users << e
end

users.shuffle.each.with_index do |e, i|
  break if i > 15
  social_mixed.users << e
end

# game1 = Event.create!(
#   :name => 'Game vs Hunters',
#   :start => '2017-07-07 00:00:00',
#   :location => 'Hutt Park'
# )
# game2 = Event.create!(
#   :name => 'Game vs Lowkey',
#   :start => '2017-06-06 00:00:00',
#   :location => 'Wakefield'
# )
# training1 = Event.create!(
#   :name => 'Training',
#   :start => '2017-12-01 00:00:00',
#   :location => 'Petone Rec'
# )
