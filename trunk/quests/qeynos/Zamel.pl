#############
#Quest Name: Finding Lucie Elron (1/3)
#Author: BWStripes
#NPC's Involved: 2
#Items involved: 1
#############
###NPC 1
#Name: Zamel
#Race 1 (Human), Texture of 0, Size 6, gender of 0
#Location X,Y,Z: -395.0, 149.0, 3.7 in South Qeynos
#Level: 10
#Type: Quest NPC
#Reward:  Random between: -
# 10018:Hematite
# 10320:Golden Ear Stud
#############
###Item 1
#Name: A Small Tattered Dress
#ID: 13713
###

#Description: The point of this quest is to locate the child. Sadly, she has been eaten by a viscious (or is that viscous?) gel cube from the Qeynos Sewers.
#You randomly find the remains of her bloodied dress on Cuburt. This was a boon to low level int casters as the reward was randomly (I recall one in 5 ish) a +3 int earring.
#Personal note: EQEmu spawn/drop rate on the dress from Cuburt is awful, compared to live, so I have upped the "good" reward to 35% chance.
#Other NPCs that you can hand the dress into: Guard Elron, North Qeynos; Endric, South Qeynos

#Quest for Zamel in South Qeynos
sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Greetings, good $name.  My name is Zamel and I have the much coveted duty of pulling sludge up out of the pools and [aqueducts] of Qeynos..");
    }
  if($text=~/what aqueducts/i){
    quest::say("Aye, the aqueducts are a horrible place.  I have heard rumors of horrible [beasts] who live under the city in the water and just the other day, a child playing in the water just up and disappeared!");
  }
  if($text=~/what beasts/i){
    quest::say("I know nothing of what or where they may be, just rumors, friend.  However, should you foolishly choose to enter the waters to brave the possibilities and return with some evidence of the [child's] fate, I would be most appreciative.");
  }
  if($text=~/what child/i){
    quest::say("The daughter of one of our own guardsmen is missing.  He has offered me a reward for any information about her disappearance.  So, if you find out anything, let me know and I will cut you in on the reward.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13713 => 1)){
    quest::say("Yes,  I do believe this was the child's dress.  Here, take this as your share of the reward.  Her father will be heartbroken..");
    my $ZamelReward = int(rand(100));
    if ($ZamelReward<=35){
      quest::summonitem("10320","1");
    }
    else {
      quest::summonitem("10018","1");
    }
    quest::givecash("0","4","0","0");
    quest::faction(36,5); #Guards of Qeynos
    quest::faction(9,5); #Antonius Bayle
    quest::faction(53,-1); #Corrupt Guards of Qeynos
    quest::faction(33,-1); #Circle Of Unseen Hands
    quest::faction(217,5); #Merchants of Qeynos
    quest::exp("100");
  }
}

#End of updated file Zamel.pl