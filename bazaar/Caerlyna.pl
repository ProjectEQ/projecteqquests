# items: 33233, 93665, 93450, 93668, 92871, 56873, 17405, 56852, 17354, 56843, 17403, 56850, 17071, 56805, 63819, 51522, 63820, 51523, 63821, 51524, 63822, 51525, 63807, 51514, 63808, 51515, 63809, 51516, 63810, 51517, 17798, 56860, 17799, 56861, 11703, 56800, 17082, 56808, 92877, 56879, 63811, 51518, 63812, 51519, 63814, 51521, 17157, 56824, 17201, 56826, 17703, 56857, 17966, 51537, 17406, 56853, 17081, 56807, 17806, 51538, 92873, 56875, 70162, 70193, 17241, 56834, 17587, 56854, 17813, 56876, 17105, 56813, 17327, 56839, 17213, 56832, 92868, 56870, 92870, 56872, 17969, 56863, 17358, 56845, 63799, 51510, 63800, 51511, 63801, 51512, 63802, 51513, 72502, 93166, 92879, 56881, 17701, 56855, 17062, 56804, 92875, 56877, 51175, 56869, 17404, 56851, 17144, 56821, 17142, 56819, 17145, 56822, 17143, 56820, 17141, 56818, 17140, 56817, 51172, 56866, 17353, 56842, 17350, 56840, 17139, 51535, 17204, 56829, 51174, 56868, 17402, 56849, 92872, 56874, 17196, 56825, 17186, 51536, 92880, 56882, 17302, 56838, 17072, 56806, 17008, 56801, 17359, 56846, 17251, 56835, 17129, 56816, 33234, 93666, 92869, 56871, 17401, 56848, 17203, 56828, 51173, 56867, 93492, 93667, 63816, 51526, 51527, 62817, 51528, 63803, 51530, 63804, 51531, 63805, 51532, 63806, 51533, 66136, 51542, 17123, 56815, 17084, 56810, 17083, 56809, 17804, 56862, 17047, 56803, 17085, 56811, 92876, 56878, 17352, 56841, 17202, 56827, 17301, 56837, 17300, 56836, 17702, 56856, 17705, 56859, 92881, 56883, 17812, 51543, 92882, 56884, 17207, 56831, 17104, 56812
sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Greetings $name! Nice to meet you. I've started up a complimentary bag check service. Feel free to give me your weight reducing bag, and I'll give you a token in return. When you would like to get your bag back, simply return to me with your token.");
		}
}

sub EVENT_ITEM
#Order for Items is
#Bag
#Token
#
#
#
#All of the Bags did not exist in the database
#Also some of the bags did not have tokens for them
#And some of the tokens did have have bags for them
#The item turn ins are in alpha-numeric order
{
  if (plugin::check_handin(\%itemcount, 33233 => 1)) { #Ambleshifts Amazing Automated Amalgamator
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(93665); # Item: Ambleshift's Amazing Automated Amalgamator Token
  }
  elsif (plugin::check_handin(\%itemcount, 93665 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(33233); # Item: Ambleshift's Amazing Automated Amalgamator
  }
  elsif (plugin::check_handin(\%itemcount, 93450 => 1)) { #Anizok's Bait Dispenser
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(93668); # Item: Anizok's Bait Dispenser Token
  }
  elsif (plugin::check_handin(\%itemcount, 93668 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(93450); # Item: Anizok's Bait Dispenser
  }
  elsif (plugin::check_handin(\%itemcount, 92871 => 1)) { #Antonican Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56873); # Item: Antonican Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56873 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92871); # Item: Antonican Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17405 => 1)) { #Archeologist Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56852); # Item: Archaeologist Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56852 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17405); # Item: Archaeologist Pack
  }
  elsif (plugin::check_handin(\%itemcount, 17354 => 1)) { #Bag of Sewn Evil-Eye
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56843); # Item: Bag of Sewn Evil-Eye Token
  }
  elsif (plugin::check_handin(\%itemcount, 56843 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17354); # Item: Bag of Sewn Evil-Eye
  }
  elsif (plugin::check_handin(\%itemcount, 17403 => 1)) { #Bag of the Tinkerers
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56850); # Item: Bag of the Tinkerers Token
  }
  elsif (plugin::check_handin(\%itemcount, 56850 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17403); # Item: Bag of the Tinkerers
  }
  elsif (plugin::check_handin(\%itemcount, 17071 => 1)) { #Beetle Box
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56805); # Item: Beetle Box Token
  }
  elsif (plugin::check_handin(\%itemcount, 56805 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17071); # Item: Beetle Box
  }
  elsif (plugin::check_handin(\%itemcount, 63819 => 1)) { #Bolstered Cragbeast Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51522); # Item: Bolstered Cragbeast Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51522 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63819); # Item: Bolstered Cragbeast Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 63820 => 1)) { #Bolstered Cragbeast Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51523); # Item: Bolstered Cragbeast Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 51523 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63820); # Item: Bolstered Cragbeast Bag
  }
  elsif (plugin::check_handin(\%itemcount, 63821 => 1)) { #Bolstered Cragbeast Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51524); # Item: Bolstered Cragbeast Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51524 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63821); # Item: Bolstered Cragbeast Pack
  }
  elsif (plugin::check_handin(\%itemcount, 63822 => 1)) { #Bolstered Cragbeast Sack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51525); # Item: Bolstered Cragbeast Sack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51525 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63822); # Item: Bolstered Cragbeast Sack
  }
  elsif (plugin::check_handin(\%itemcount, 63807 => 1)) { #Bolstered Hynid-Hide Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51514); # Item: Bolstered Hynid-Hide Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51514 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63807); # Item: Bolstered Hynid-Hide Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 63808 => 1)) { #Bolstered Hynid-Hide Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51515); # Item: Bolstered Hynid-Hide Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 51515 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63808); # Item: Bolstered Hynid-Hide Bag
  }
  elsif (plugin::check_handin(\%itemcount, 63809 => 1)) { #Bolstered Hynid-Hide Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51516); # Item: Bolstered Hynid-Hide Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51516 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63809); # Item: Bolstered Hynid-Hide Pack
  }
  elsif (plugin::check_handin(\%itemcount, 63810 => 1)) { #Bolstered Hynid-Hide Sack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51517); # Item: Bolstered Hynid-Hide Sack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51517 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63810); # Item: Bolstered Hynid-Hide Sack
  }
  elsif (plugin::check_handin(\%itemcount, 17798 => 1)) { #Bonecollector's Sack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56860); # Item: Bonecollector's Sack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56860 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17798); # Item: Bonecollector's Sack
  }
  elsif (plugin::check_handin(\%itemcount, 17799 => 1)) { #Bottomless Box
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56861); # Item: Bottomless Box Token
  }
  elsif (plugin::check_handin(\%itemcount, 56861 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17799); # Item: Bottomless Box
  }
  elsif (plugin::check_handin(\%itemcount, 11703 => 1)) { #Box of Abu-Kar
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56800); # Item: Box of Abu-Kar Token
  }
  elsif (plugin::check_handin(\%itemcount, 56800 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(11703); # Item: Box of Abu-Kar
  }
  elsif (plugin::check_handin(\%itemcount, 17082 => 1)) { #Box of Nil Space
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56808); # Item: Box of Nil Space Token
  }
  elsif (plugin::check_handin(\%itemcount, 56808 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17082); # Item: Box of Nil Space
  }
  elsif (plugin::check_handin(\%itemcount, 92877 => 1)) { #Clockwork Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56879); # Item: Clockwork Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56879 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92877); # Item: Clockwork Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 63811 => 1)) { #Cragbeast Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51518); # Item: Cragbeast Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51518 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63811); # Item: Cragbeast Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 63812 => 1)) { #Cragbeast Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51519); # Item: Cragbeast Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 51519 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63812); # Item: Cragbeast Bag
  }
  elsif (plugin::check_handin(\%itemcount, 63814 => 1)) { #Cragbeast Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51521); # Item: Cragbeast Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 51521 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63814); # Item: Cragbeast Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 17157 => 1)) { #Crude Fur Bandolier
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56824); # Item: Crude Fur Bandolier Token
  }
  elsif (plugin::check_handin(\%itemcount, 56824 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17157); # Item: Crude Fur Bandolier
  }
  elsif (plugin::check_handin(\%itemcount, 17201 => 1)) { #Dakoit Coin Purse
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56826); # Item: Dakoit Coin Purse Token
  }
  elsif (plugin::check_handin(\%itemcount, 56826 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17201); # Item: Dakoit Coin Purse
  }
  elsif (plugin::check_handin(\%itemcount, 17703 => 1)) { #Darkwood Trunk
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56857); # Item: Darkwood Trunk Token
  }
  elsif (plugin::check_handin(\%itemcount, 56857 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17703); # Item: Darkwood Trunk
  }
  elsif (plugin::check_handin(\%itemcount, 17966 => 1)) { #Deluxe Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51537); # Item: Deluxe Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 51537 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17966); # Item: Deluxe Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17406 => 1)) { #Driftwood Treasure Chest
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56853); # Item: Driftwood Treasure Chest Token
  }
  elsif (plugin::check_handin(\%itemcount, 56853 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17406); # Item: Driftwood Treasure Chest
  }
  elsif (plugin::check_handin(\%itemcount, 17081 => 1)) { #Dusty Ransacker's Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56807); # Item: Dusty Ransacker's Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56807 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17081); # Item: Dusty Ransacker's Pack
  }
  elsif (plugin::check_handin(\%itemcount, 17806 => 1)) { #Erudite Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51538); # Item: Worn Erudite Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 51538 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17806); # Item: Worn Erudite Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 92873 => 1)) { #Erudite Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56875); # Item: Erudite Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56875 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92873); # Item: Erudite Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 70162 => 1)) { #Ethereal Satchel of Gathering
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(70193); # Item: Ethereal Satchel of Gathering Token
  }
  elsif (plugin::check_handin(\%itemcount, 70193 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(70162); # Item: Ethereal Satchel of Gathering
  }
  elsif (plugin::check_handin(\%itemcount, 17241 => 1)) { #Feather Lined Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56834); # Item: Feather Lined Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56834 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17241); # Item: Feather Lined Bag
  }
  elsif (plugin::check_handin(\%itemcount, 17587 => 1)) { #Feather Lined Box
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56854); # Item: Feather Lined Box Token
  }
  elsif (plugin::check_handin(\%itemcount, 56854 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17587); # Item: Feather Lined Box
  }
  elsif (plugin::check_handin(\%itemcount, 17813 => 1)) { #Fier`Dal Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56876); # Item: Feir`Dal Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56876 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17813); # Item: Worn Feir`Dal Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17105 => 1)) { #Fine Xakra Runed Jar
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56813); # Item: Fine Xakra Runed Jar Token
  }
  elsif (plugin::check_handin(\%itemcount, 56813 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17105); # Item: Fine Xakra Runed Jar
  }
  elsif (plugin::check_handin(\%itemcount, 17327 => 1)) { #Fleeting Quiver
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56839); # Item: Fleeting Quiver Token
  }
  elsif (plugin::check_handin(\%itemcount, 56839 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17327); # Item: Fleeting Quiver
  }
  elsif (plugin::check_handin(\%itemcount, 17213 => 1)) { #Gem Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56832); # Item: Gem Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 56832 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17213); # Item: Gem Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 92868 => 1)) { #Guktan Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56870); # Item: Guktan Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56870 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92868); # Item: Guktan Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 92870 => 1)) { #Half Elf Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56872); # Item: Half Elf Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56872 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92870); # Item: Half Elf Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17969 => 1)) { #Hand Made Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56863); # Item: Hand Made Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56863 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17969); # Item: Hand Made Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 17358 => 1)) { #Herbalist Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56845); # Item: Herbalist Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56845 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17358); # Item: Herbalist Pack
  }
  elsif (plugin::check_handin(\%itemcount, 63799 => 1)) { #Hynid-Hide Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51510); # Item: Hynid-Hide Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51510 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63799); # Item: Hynid-Hide Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 63800 => 1)) { #hynid-Hide Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51511); # Item: Hynid-Hide Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 51511 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63800); # Item: Hynid-Hide Bag
  }
  elsif (plugin::check_handin(\%itemcount, 63801 => 1)) { #Hynid-Hide Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51512); # Item: Hynid-Hide Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51512 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63801); # Item: Hynid-Hide Pack
  }
  elsif (plugin::check_handin(\%itemcount, 63802 => 1)) { #Hynid-Hide Sack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51513); # Item: Hynid-Hide Sack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51513 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63802); # Item: Hynid-Hide Sack
  }
  elsif (plugin::check_handin(\%itemcount, 72502 => 1)) { #Ice Cream Churn
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(93166); # Item: Ice Cream Churn Token
  }
  elsif (plugin::check_handin(\%itemcount, 93166 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(72502); # Item: Ice Cream Churn
  }
  elsif (plugin::check_handin(\%itemcount, 92879 => 1)) { #iksar Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56881); # Item: Iksar Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56881 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92879); # Item: Iksar Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17701 => 1)) { #Kavruul's Mystic Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56855); # Item: Kavruul`s Mystic Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 56855 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17701); # Item: Kavruul`s Mystic Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 17062 => 1)) { #Kejekan Tool Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56804); # Item: Kejekan Tool Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56804 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17062); # Item: Kejekan Tool Kit
  }
  elsif (plugin::check_handin(\%itemcount, 92875 => 1)) { #Koada`Dal Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56877); # Item: Koada`Dal Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56877 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92875); # Item: Koada`Dal Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 51175 => 1)) { #Large Lemming Fur Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56869); # Item: Large Lemming Fur Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56869 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(51175); # Item: Large Lemming Fur Bag
  }
  elsif (plugin::check_handin(\%itemcount, 17404 => 1)) { #Large Soiled Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56851); # Item: Large Soiled Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56851 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17404); # Item: Large Soiled Bag
  }
  elsif (plugin::check_handin(\%itemcount, 17144 => 1)) { #Leatherfoot Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56821); # Item: Leatherfoot Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56821 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17144); # Item: Leatherfoot Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 17142 => 1)) { #Leatherfoot Belt Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56819); # Item: Leatherfoot Belt Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 56819 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17142); # Item: Leatherfoot Belt Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 17145 => 1)) { #Leatherfoot Haversack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56822); # Item: Leatherfoot Haversack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56822 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17145); # Item: Leatherfoot Haversack
  }
  elsif (plugin::check_handin(\%itemcount, 17143 => 1)) { #Leatherfoot Shoulderbag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56820); # Item: Leatherfoot Shoulderbag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56820 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17143); # Item: Leatherfoot Shoulderbag
  }
  elsif (plugin::check_handin(\%itemcount, 17141 => 1)) { #Leatherfoot Small Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56818); # Item: Leatherfoot Small Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 56818 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17141); # Item: Leatherfoot Small Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 17140 => 1)) { #Leatherfoot Wrist Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56817); # Item: Leatherfoot Wrist Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 56817 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17140); # Item: Leatherfoot Wrist Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 51172 => 1)) { #Lemming Fur Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56866); # Item: Lemming Fur Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56866 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(51172); # Item: Lemming Fur Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 17353 => 1)) { #Light Burlap Sack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56842); # Item: Light Burlap Sack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56842 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17353); # Item: Light Burlap Sack
  }
  elsif (plugin::check_handin(\%itemcount, 17350 => 1)) { #Lionhide Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56840); # Item: Lionhide Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56840 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17350); # Item: Lionhide Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 17139 => 1)) { #Marble Mortar and Pestle
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51535); # Item: Marble Mortar and Pestle Token
  }
  elsif (plugin::check_handin(\%itemcount, 51535 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17139); # Item: Marble Mortar and Pestle
  }
  elsif (plugin::check_handin(\%itemcount, 17204 => 1)) { #Medium Coin Purse
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56829); # Item: Medium Coin Purse Token
  }
  elsif (plugin::check_handin(\%itemcount, 56829 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17204); # Item: Medium Coin Purse
  }
  elsif (plugin::check_handin(\%itemcount, 51174 => 1)) { #Medium Lemming Fur Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56868); # Item: Medium Lemming Fur Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56868 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(51174); # Item: Medium Lemming Fur Bag
  }
  elsif (plugin::check_handin(\%itemcount, 17402 => 1)) { #Memento Box
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56849); # Item: Memento Box Token
  }
  elsif (plugin::check_handin(\%itemcount, 56849 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17402); # Item: Memento Box
  }
  elsif (plugin::check_handin(\%itemcount, 92872 => 1)) { #Northman Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56874); # Item: Northman Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56874 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92872); # Item: Northman Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17196 => 1)) { #Nigrud's Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56825); # Item: Nugrud's Satchel Token
  }
  elsif (plugin::check_handin(\%itemcount, 56825 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17196); # Item: Nugrud's Satchel
  }
  elsif (plugin::check_handin(\%itemcount, 17186 => 1)) { #Odylic Vial
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51536); # Item: Odylic Vial Token
  }
  elsif (plugin::check_handin(\%itemcount, 51536 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17186); # Item: Odylic Vial
  }
  elsif (plugin::check_handin(\%itemcount, 92880 => 1)) { #Ogre Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56882); # Item: Ogre Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56882 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92880); # Item: Ogre Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17302 => 1)) { #Pierce's Pouch of Storing
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56838); # Item: Pierce's Pouch of Storing Token
  }
  elsif (plugin::check_handin(\%itemcount, 56838 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17302); # Item: Pierce's Pouch of Storing
  }
  elsif (plugin::check_handin(\%itemcount, 17072 => 1)) { #Pristine Beetle Box
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56806); # Item: Pristine Beetle Box Token
  }
  elsif (plugin::check_handin(\%itemcount, 56806 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17072); # Item: Pristine Beetle Box
  }
  elsif (plugin::check_handin(\%itemcount, 17008 => 1)) { #Quiver
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56801); # Item: Quiver Token
  }
  elsif (plugin::check_handin(\%itemcount, 56801 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17008); # Item: Quiver
  }
  elsif (plugin::check_handin(\%itemcount, 17359 => 1)) { #Rallic Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56846); # Item: Rallic Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56846 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17359); # Item: Rallic Pack
  }
  elsif (plugin::check_handin(\%itemcount, 17251 => 1)) { #Rotted Skin Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56835); # Item: Rotted Skin Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56835 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17251); # Item: Rotted Skin Bag
  }
  elsif (plugin::check_handin(\%itemcount, 17129 => 1)) { #Satchel of the Hatchling
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56816); # Item: Satchel of the Hatchling Token
  }
  elsif (plugin::check_handin(\%itemcount, 56816 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17129); # Item: Satchel of the Hatchling
  }
  elsif (plugin::check_handin(\%itemcount, 33234 => 1)) { #Scrindite's Mechanoinstruction Holepoker
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(93666); # Item: Scrindite's Mechanoinstruction Holepoker Token
  }
  elsif (plugin::check_handin(\%itemcount, 93666 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(33234); # Item: Scrindite's Mechanoinstruction Holepoker
  }
  elsif (plugin::check_handin(\%itemcount, 92869 => 1)) { #Shar Vahl Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56871); # Item: Shar Vahl Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56871 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92869); # Item: Shar Vahl Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17401 => 1)) { #Shralok Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56848); # Item: Shralok Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56848 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17401); # Item: Shralok Pack
  }
  elsif (plugin::check_handin(\%itemcount, 17203 => 1)) { #Small Coin Purse
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56828); # Item: Small Coin Purse Token
  }
  elsif (plugin::check_handin(\%itemcount, 56828 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17203); # Item: Small Coin Purse
  }
  elsif (plugin::check_handin(\%itemcount, 51173 => 1)) { #Small Lemming Fur Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56867); # Item: Small Lemming Fur Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56867 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(51173); # Item: Small Lemming Fur Bag
  }
  elsif (plugin::check_handin(\%itemcount, 93492 => 1)) { #Spell Research Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(93667); # Item: Spell Research Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 93667 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(93492); # Item: Spell Research Kit
  }
  elsif (plugin::check_handin(\%itemcount, 63816 => 1)) { #Steel Reinforced Cragbeast Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51526); # Item: Steel-Reinforced Cragbeast Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51526 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63816); # Item: Steel-Reinforced Cragbeast Bag
  }
  elsif (plugin::check_handin(\%itemcount, 63816 => 1)) { #Steel Reinforced Cragbeast Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51527); # Item: Steel-Reinforced Cragbeast Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 51527 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63816); # Item: Steel-Reinforced Cragbeast Bag
  }
  elsif (plugin::check_handin(\%itemcount, 62817 => 1)) { #Steel Reinforced Cragbeast Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51528); # Item: Steel-Reinforced Cragbeast Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51528 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(62817); # Item: Cleaned Alligator Scales
  }
  elsif (plugin::check_handin(\%itemcount, 63803 => 1)) { #Steel Reinforced Hynid-Hide Backpack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51530); # Item: Steel-Reinforced Hynid-hide Backpack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51530 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63803); # Item: Steel-Reinforced Hynid-Hide Backpack
  }
  elsif (plugin::check_handin(\%itemcount, 63804 => 1)) { #Steel Reinforced Hynid-Hide Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51531); # Item: Steel-Reinforced Hynid-hide Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 51531 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63804); # Item: Steel-Reinforced Hynid-Hide Bag
  }
  elsif (plugin::check_handin(\%itemcount, 63805 => 1)) { #Steel-Reinforced Hynid-Hide Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51532); # Item: Steel-Reinforced Hynid-hide Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51532 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63805); # Item: Steel-Reinforced Hynid-Hide Pack
  }
  elsif (plugin::check_handin(\%itemcount, 63806 => 1)) { #steel Reinforced Hynid-Hide Sack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51533); # Item: Steel-Reinforced Hynid-hide Sack Token
  }
  elsif (plugin::check_handin(\%itemcount, 51533 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(63806); # Item: Steel-Reinforced Hynid-Hide Sack
  }
  elsif (plugin::check_handin(\%itemcount, 66136 => 1)) { #Surefall Fletching Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51542); # Item: Surefall Fletching Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 51542 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(66136); # Item: Rough Sedgewood Recurve Bow
  }
  elsif (plugin::check_handin(\%itemcount, 17123 => 1)) { #Tae Ew Hide Sack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56815); # Item: Tae Ew Hide Sack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56815 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17123); # Item: Tae Ew Hide Sack
  }
  elsif (plugin::check_handin(\%itemcount, 17084 => 1)) { #Tailored Large Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56810); # Item: Tailored Large Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56810 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17084); # Item: Tailored Large Bag
  }
  elsif (plugin::check_handin(\%itemcount, 17083 => 1)) { #Tailored Large Belt Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56809); # Item: Tailored Large Belt Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 56809 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17083); # Item: Tailored Large Belt Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 17804 => 1)) { #Tailored Quiver
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56862); # Item: Tailored Quiver Token
  }
  elsif (plugin::check_handin(\%itemcount, 56862 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17804); # Item: Tailored Quiver
  }
  elsif (plugin::check_handin(\%itemcount, 17047 => 1)) { #Tailored Small Bag
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56803); # Item: Tailored Small Bag Token
  }
  elsif (plugin::check_handin(\%itemcount, 56803 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17047); # Item: Tailored Small Bag
  }
  elsif (plugin::check_handin(\%itemcount, 17085 => 1)) { #Tailored Wrist Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56811); # Item: Tailored Wrist Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 56811 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17085); # Item: Tailored Wrist Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 92876 => 1)) { #Tier`Dal Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56878); # Item: Teir`Dal Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56878 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92876); # Item: Teir`Dal Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17352 => 1)) { #Thunderhoof Quiver
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56841); # Item: Thunderhoof Quiver Token
  }
  elsif (plugin::check_handin(\%itemcount, 56841 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17352); # Item: Thunderhoof Quiver
  }
  elsif (plugin::check_handin(\%itemcount, 17202 => 1)) { #Tiny Coin Purse
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56827); # Item: Tiny Coin Purse Token
  }
  elsif (plugin::check_handin(\%itemcount, 56827 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17202); # Item: Tiny Coin Purse
  }
  elsif (plugin::check_handin(\%itemcount, 17301 => 1)) { #Travelers Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56837); # Item: Travelers Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56837 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17301); # Item: Travelers Pack
  }
  elsif (plugin::check_handin(\%itemcount, 17300 => 1)) { #Travelers Pouch
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56836); # Item: Travelers Pouch Token
  }
  elsif (plugin::check_handin(\%itemcount, 56836 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17300); # Item: Travelers Pouch
  }
  elsif (plugin::check_handin(\%itemcount, 17702 => 1)) { #Treasure Hunter's Satchel
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56856); # Item: Treasure Hunter`s Satchel Token
  }
  elsif (plugin::check_handin(\%itemcount, 56856 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17702); # Item: Treasure Hunter`s Satchel
  }
  elsif (plugin::check_handin(\%itemcount, 17705 => 1)) { #Treasure Seekers Pack
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56859); # Item: Treasure Seekers Pack Token
  }
  elsif (plugin::check_handin(\%itemcount, 56859 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17705); # Item: Treasure Seekers Pack
  }
  elsif (plugin::check_handin(\%itemcount, 92881 => 1)) { #Troll Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56883); # Item: Troll Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56883 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92881); # Item: Troll Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17812 => 1)) { #Vale Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(51543); # Item: Worn Vale Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 51543 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17812); # Item: Worn Vale Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 92882 => 1)) { #Vale Sewing Kit
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56884); # Item: Vale Sewing Kit Token
  }
  elsif (plugin::check_handin(\%itemcount, 56884 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(92882); # Item: Vale Sewing Kit
  }
  elsif (plugin::check_handin(\%itemcount, 17207 => 1)) { #Very Large Coin Purse
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56831); # Item: Very Large Coin Purse Token
  }
  elsif (plugin::check_handin(\%itemcount, 56831 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17207); # Item: Very Large Coin Purse
  }
  elsif (plugin::check_handin(\%itemcount, 17104 => 1)) { #Xakra Runed Jar
    quest::say("Here you go. Bring this token back to me when you would like your bag back.");
    quest::summonitem(56812); # Item: Xakra Runed Jar Token
  }
  elsif (plugin::check_handin(\%itemcount, 56812 => 1)) {
    quest::say("Here you go. Here is your bag back.");
    quest::summonitem(17104); # Item: Xakra Runed Jar
  }
  plugin::return_items(\%itemcount);
}
#End of File zone: bazaar ID: 151004 -- Caerlyna
#By Kovou