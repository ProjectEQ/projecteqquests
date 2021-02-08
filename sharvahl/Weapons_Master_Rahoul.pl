# items: 57056, 9050, 17363, 9051, 9055, 9056, 9053, 9054, 9052, 52931
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail friend, are you a new recruit or have you been at it for a bit?");
  }
  if ($text=~/i am a new recruit/i) {
    quest::say("Well... perhaps you should head to the combat training grounds and pick up a few pointers.  Walk west along the ledge that runs just outside of the city's walls and you shouldn't be able to miss it.");
  }
  if ($text=~/i have been at it for a bit/i) {
    quest::say("Good good... keep at it!  We need all of the strong willed thick headed Khala Dun we can muster!  Now, get back to the fight!");
  }
  if ($text=~/ore/i) {
    quest::say("The ore that I require is often used to create living rock formations. These collections of rocks and boulders will often leave a trail of energy that causes other rocks to collect and come to life. Our scouts have seen these formations in a variety of areas. Take care when you attempt to gather this ore.");
  }
  if ($text=~/void/i) {
    quest::say("If you look in the Maiden's Eye, you will find entities that are the embodiment of darkness. Their twisted spirits are not allowed to escape the form that they inhabit. They have no hope of escape, unless they are released during the destruction of their material form. There are some occasions when the power that is used to keep them in this realm will turn upon itself during this period of destruction. This process is what produces the Gems of the Void.");
  }
  if ($text=~/padding/i) {
    quest::say("When traversing the Deep, you will run across a shrieking fungus. Those creatures are much more durable and dangerous than the other fungi that you may encounter in the caverns of Luclin. It is for this reason that we use their flesh as padding. Take care when hunting them, for they will provide a good challenge.");
  }
  if ($client->GetGlobal("beast_turnin") == 1 && $text=~/willing/i) {
    quest::say("First, we will need you to contribute some of your own funds in order to obtain this particular piece. It is in a form of a statuette that will grant you an audience with Muada. I have used some rare components to make these that will cost you in the order of 2000 platinum pieces. Yes, it's a high cost, but we must keep our coffers healthy. You will need to create your own leather [" . quest::saylink("adornments") . "] however. When you have given me the required funds, I will give you the beastlord's statuette to work with.");
  }
  if($client->GetGlobal("beast_turnin") == 1 && $text=~/adornments/i) {
    quest::say("Yes, Muada demands that each beastlord put some care and devotion into the making of this artifact. You will need to craft your own decoration to this statue to be made from two hides of the strange flesh hounds in Taelosia. You will need to be sure your tailoring is up to par for this, or it will become a very expensive endeavor to gain favor with Muada. Take this pattern to work with when you have your hides. You will need to tan them first and acid wash will do well to remove the impurities and markings, of course. When you are finished, you may present the item to Elder Muada.");
    quest::summonitem(57056); # Item: Adornments Pattern
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9050 => 1)) {
    quest::say("You are just the time. The weapon that Elder Dumul requested has almost been completed. We need you to gather a few items in order to complete the weapon. These items will not require much effort to acquire, but I will need to tell you where to look. Place all of the items that I request in this box and return it to me as quickly as possible.");
    quest::summonitem(17363); # Item: Rahoul's Collection Box
    quest::say("Now, seek out a large chunk of perfect acrylia [" . quest::saylink("ore") . "], two Gems of the [" . quest::saylink("void") . "], and chunk of dense fungal [" . quest::saylink("padding") . "]. Once I have those items, I can finish the weapon that you will need to use to kill the dark animist.");
  }
  if (plugin::check_handin(\%itemcount, 9051 => 1)) {
    quest::say("These claws should work well for you. The design was research by Historian Qua. They should work to neutralize the magical field that protects the dark animist and allow you to tear his scaly flesh from his frame. Remember that all of this is theoretical. Those claws are an original creation. You will be the first to prove their effectiveness in combat.");
    quest::summonitem(9055); # Item: Jagged Claw of Rending
    quest::summonitem(9056); # Item: Jagged Claw of Rending
    quest::say("Take the claws back to Animist Dumul and show him their design. Use them well, $name. May the spirits guide you in your attack.");
  }
  if($client->GetGlobal("beast_turnin") ==undef) {
  		if (plugin::check_handin(\%itemcount, 9053 => 2, 9054 => 1, 9052 => 1)) {
    			quest::say("Ah, I see you have been so kind as to help us. Muada would like you take your assistance one step further. If you are [" . quest::saylink("willing") . "], of course.");
			quest::setglobal("beast_turnin", "1", 5, "F");
		}
  }
  if ($platinum >= 2000) {
    quest::say("I wasn't sure you would part with such a great amount of coin. I am impressed. Here is your statuette to work with. You will need to tailor the leather adornments you create and work with them into the statue itself, making it your own.");
    quest::summonitem(52931); # Item: Plain Beastlord Statuette
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155243 -- Weapons_Master_Rahoul
