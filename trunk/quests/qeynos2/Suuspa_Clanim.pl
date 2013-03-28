#############
#Quest Name: Hunt the Bloodsabers
#Author: ?? (Update by BWStripes)
#NPC's Involved: 1
#Items involved: 1
#############
###NPC 1
#Name: Suuspa_Clanim
#Race 1 (Human), Texture of 3, Size 6, gender of 1
#Location XYZ: -629.0, -180.0, -11.0 in North Qeynos
#Level: 61
#Type: Paladin GM
##
#Reward: Cash
#############
###Item
#Name: Rat shaped ring
#ID: 13301
###
###Item
#Name: Busted Prayer Beads
#ID: 13908
###
sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Welcome to the Temple of Life, $name.  It is here that you may pay tribute to the Prime Healer. Does not your heart beat with the sound of life? It is He who makes it so. Do not let the hand of Bertoxxulous and his [new disease] lay upon your soul or, like so many, you shall meet your fate at the end of my sword!");
  }
  if($text=~/new disease/i){
  quest::say("The new disease I speak of is called the Bloodsabers. They are the loyal followers of Bertoxxulous and as such have been condemned by our temple. Do you wish to [join the fight]?");
  }
  if($text=~/join the fight/i){
  quest::say("Then seek out those who worship the Plaguebringer. End their threat!! Each member has upon them the mark of the Bloodsabers, a rat-shaped ring. I shall reward all those who return such rings to me.");
  }
  if($text=~/Brother Trintle attacked Brother Estle/i){
    quest::say("Impossible!! What madness do you speak of!!? If he did he must have had a reason. Maybe Trintle had been tainted by the words of Bertoxxulous..?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13301 => 1)) {
    my $suuspa_randomSP = int(rand(20));
    my $suuspa_randomCP = int(rand(20));
    quest::say("Ah, one less of the Plaguebringer's followers to poison these lands. Take this as a reward for your service."); #Text improvised
    quest::givecash("$suuspa_randomCP","$suuspa_randomSP","0","0"); # Random from 20cp20sp
    quest::faction("9","4"); #Antonius Bayle
    quest::faction("135","4"); #Guards of Qeynos
    quest::faction("257","4"); #Priests of Life
    quest::faction("183","4"); #Knights of Thunder
    quest::faction("21","-5"); #Bloodsabers
    quest::exp("1000");
  }
  if (plugin::check_handin(\%itemcount, 13908 => 1)) {
    my $suuspa_randomSP = int(rand(20));
    my $suuspa_randomCP = int(rand(20));
    quest::say("This is not good. Hmph. It appears they are shattered. For the first time one of our members has been swayed. I reward you for your deed. Also, if you have found anything upon Trintle, let me know.");
    quest::givecash("$suuspa_randomCP","$suuspa_randomSP","0","0"); # Random from 20cp20sp
    quest::faction("9","4"); #Antonius Bayle
    quest::faction("135","4"); #Guards of Qeynos
    quest::faction("257","4"); #Priests of Life
    quest::faction("183","4"); #Knights of Thunder
    quest::faction("21","-5"); #Bloodsabers
    quest::exp("1000");
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2048 -- Suuspa_Clanim