#############
#Quest Name: The Lost Snake
#Zone: rathemtn
#Author: Loftus
#NPCs Involved: Animal_Trainer_Visop
#Items Involved: 54001, 54002
#################
# items: 54001, 54002

sub EVENT_SAY
{
  if($text=~/hail/i){ 
quest::say("Come to look at my animals, have you? I have managed to capture and 

train some of the finest specimens in all of Norrath. Do you have any [skill with 

animals] yourself?");
  }
  if($text=~/skill with animals/i)
  {
  quest::say("Those blasted Trolls caused me to lose one of my finest specimens! I 

had captured a beautiful giant water moccasin while studying the swamplands. I did 

so love that [snake], I even fancy she grew to love me. I spent many hours training 

her.");
  }
  if($text=~/snake/i)
  {
  quest::say("There was a band of Troll invaders moving through our supply line one 

day, while I was attempting to calm one of the spiderlings they struck. My crates 

were smashed and they panicked the poor things rather badly. We were able to fend 

them off and I gathered together most of the freed animals, but alas my snake was 

nowhere to be found. I have been so busy helping them adjust to their new 

surroundings that I find myself lacking the time to go [look for her].");
  }
  if($text=~/look for her/i)
  {
quest::say("She answers to the name of Sethena when she is in the mood. She wore a 

trinket around her neck that she was rather fond of. If you could bring her back to 

me I would be most grateful, I do fear that she may have gone wild again. If this is 

the case, bring me back the trinket she wears as evidence of this. I must get back 

to work, it is feeding time. Good luck!");
  }
}

sub EVENT_ITEM
{
if(plugin::check_handin(\%itemcount, 54001 => 1))
  {
  quest::say("Alas, my poor Sethena! Thank you for this trinket, $name. Please, take 

this as a token of my gratitude.");
  quest::ding();
  quest::faction(1709,100); # Faction: Protectors of Gukta
  quest::exp(25000);
  quest::summonitem(54002); # Item: Trainer's Bauble
  }
  plugin::return_items(\%itemcount);
}
