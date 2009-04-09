#############
#Quest Name: Finding Lucie Elron (3/3)
#Author: BWStripes
#NPC's Involved: 2
#Items involved: 1
#############
###NPC 1
#Name: Guard Elron
#Race 71 (Qeynos Guard), Texture of 1, Size 6, gender of 0
#Location X,Y,Z: 56.0, 290.0, 47.6 in South Qeynos
#Level: 35
#Type: Quest NPC
#Reward:
# 13188: Golden Locket
#############
###Item 1
#Name: A Small Tattered Dress
#ID: 13713
###

#Description: The point of this quest is to locate the child. Sadly, she has been eaten by a viscious (or is that viscous?) gel cube from the Qeynos Sewers.
#You randomly find the remains of her bloodied dress on Cuburt. This was a boon to low level int casters as the reward was randomly (I recall one in 5 ish) a +3 int earring.
#Personal note: EQEmu spawn/drop rate on the dress from Cuburt is awful, compared to live, so I have upped the "good" reward to 35% chance.
#Other NPCs that you can hand the dress into: Zamel, South Qeynos; Endric, South Qeynos

#Quest for Guard Elron in North Qeynos
sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Greetings. I am sorry but I can't concentrate on my post and talk to you at the same time. Especially when I should be out searching for [Lucie]..  Please excuse me.");
  }
  if($text=~/lucie/i){
    quest::say("Lucie is my only daughter. Her mother was killed by gnolls a little over a year ago, now Lucie is missing. Ton Firepride said he saw her playing in the south pond.  I have told her a million times to stay out of the aqueducts..  She never listens..  Now I spend every free moment searching for my little girl, if only I could find some clue to her fate. Well, I need to get back to work. Fare well, $name."); }
  }

sub EVENT_ITEM {
  if($itemcount{13713} == 1){
    quest::say("Oh gods.. no.. no.. I warned her about the aqueducts.. I warned her.. I coudn't watch her every minute of the day, could I? Oh Lucie.. Why didn't you listen to me? I'm sorry... Oh, here, take this - it belonged to her mother. She always said that in times of need, it gave her courage to go on. Thank you for your help, but I'd like to be alone now."); 
    #Changed dialog to make it sound like he actually cared about his daughter!
    quest::summonitem("13188");
    quest::givecash("0","3","0","0");
    quest::faction(36,5); #Guards of Qeynos
    quest::faction(9,5); #Antonius Bayle
    quest::faction(53,-1); #Corrupt Guards of Qeynos
    quest::faction(33,-1); #Circle Of Unseen Hands
    quest::faction(217,5); #Merchants of Qeynos
    quest::exp("100");
  }
}

#END of updated FILE Zone:qeynos2  ID:2071 -- Guard_Elron

