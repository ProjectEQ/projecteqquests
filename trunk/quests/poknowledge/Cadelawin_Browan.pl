#Cadelawin_Browan.pl
#Mystic Cloak Recharge


sub EVENT_SAY {
  if($text=~/Hail/i && plugin::check_hasitem($client, 1057)){
    quest::say("Wow, you have a Mystic Cloak! I was just reading a book about cloaks with similar enchantments. I'm studying to try and learn how to make magical and enchanted armor. I'm pretty sure I have figured out a way to [recharge] a Mystic Cloak.");
  }
  elsif($text=~/Hail/i) {
  	quest::say("Hello there.  Fine afternoon. isn't it?");  	
  }
  if($text=~/recharge/i) {
    quest::say("Well, in the case of the Mystic Cloak at least, the true enchantment is in the brooch that you use to clip the cloak around your shoulders. The cloak itself cannot run out of magic, the brooch, however, can. When it no longer has the ability to cast spells you should be able to attach a [new brooch] and regain the magic the cloak once possessed.");
  }
  if($text=~/new brooch/i) {
    quest::say("'I figured that would be your next question. Each enchanted cloak has its own brooch, and you need to know the specifics of the brooch for your cloak in order to replace it. You happen to be in luck today as I happen to know the specifications for the cloak associated with the Mystic Cloak. First you will need talisman made from Chrysoberyl. That talisman will need to be affixed inside a Planar Jeweler's kit by a skilled jewelcrafter to an enchanted platinum bar with a magic scroll of steelskin and a vial of distilled mana. Once you have the brooch simply attach it to your cloak in one of the looms you can find in Jeral, it shouldn't be terribly difficult.");
  }
}
  
  
sub EVENT_ITEM {
	quest::say("I don't need this."); #text made up
	plugin::return_items(\%itemcount); 
}#Done
#END of FILE Zone:poknowledge  ID:202053 -- Cadelawin_Browan 

