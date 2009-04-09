#############
#Quest Name: Faren's Tacklebox
#Author: ?? (Update by BWStripes)
#NPC's Involved: 1
#Items involved: 1
#############
###NPC 1
#Name: Faren
#Race 1 (Human), Texture of 1, Size 0, gender of 0
#Location XYZ: 89.2, -161.0, 3.8 in South Qeynos
#Level: 3
#Type: Quest NPC
#Reward: itemid 13129: Hurrieta's Tunic
#############
###Item 1
#Name: Wooden Fishing Tackle
#ID: 13702
#Ground Spawn
###

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Oh.. Hiya, I'm just out here fishing, since I can't find a job. I hope this [bait] I just bought catches me a big ol' fish.");
  }
  if($text=~/what bait/i){
    quest::say("I use Captain Rohand's Secret Recipe Super Magic Catch-A-Lot brand bait. I bought my pole from Sneed's up by the north pond.");
  }
  if($text=~/tacklebox/i){
    quest::say("Oh. That mean [dwarf], Trumpy, just knocked my tacklebox into the water. Could you please get it for me? I can't swim.");
  }
  if($text=~/fishboy/i){
    quest::say("Hey! My [tacklebox]! You rotten dwarf!");
  }
  if($text=~/dwarf/i){
    quest::say("Yes, that Trumpy is a dwarf, and a mean one too. I think he got kicked out of Kaladim and came here. Avoid him if you can."); #Improvised text
  }
}

sub EVENT_ITEM {
  if($itemcount{13702} == 1){
    my $faren_randomcash = int(rand(20));
    quest::say("Thank you so much!  If you want some free advice, steer clear of those [Irontoes]! They are nothing but trouble. Here, It's not much but I must thank you somehow.");
    quest::summonitem("13129"); #Hurrieta's Tunic
    quest::givecash("$faren_randomcash","0","0","0");# Random from 20cp
    quest::faction("135","4"); #Guards of Qeynos
    quest::faction("9","4"); #Antonius Bayle
    quest::faction("53","-5"); #Corrupt Qeynos Guards
    quest::faction("33","-5"); #Circle Of Unseen Hands
    quest::faction("217","4"); #Merchants of Qeynos
    quest::exp("200");
  }
}

#END of FILE Zone:qeynos  ID:1091 -- Faren
