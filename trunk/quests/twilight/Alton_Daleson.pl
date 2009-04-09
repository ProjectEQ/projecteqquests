sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to Jern's Rest!  I'm the owner and proprietor of this inn. its been in my family for generations.  My great grandaddy. Jern. built it back when Katta Castellum was first being built.  If ya be wantin' of anything don't hesitate to ask.'"); 
}
  if ($text=~/armor/i) {
    quest::say("His armor has also been in the family for generations, if ye be a [ranger] I don't have much use for it running this inn. I'll just need something in return for it.");
  }
  if ($text=~/ranger/i) {
    quest::say("Excellent! If you are interested I have the Woodsman's [Helm], Woodsmand's [Mail], Woodsman's [Vambraces], Woodsman's [Greaves], Woodsman's [Bracer], Woodsman's [Boots], and the Woodsman's [Axe]. If youa re interested in the rest of his armor you'll have to ask my wife Ellen, she'll have some errands you can run for her.");
  }
  if ($text=~/axe/i) {
    quest::say("If you want the Woodsman's Axe you will have to aquire these items: a sun jewel, a mark of the naturalist, some ancient pottery, and a fossilized skull.");
  }
  if ($text=~/boots/i) {
    quest::say("If you want the Woodsman's Boots you will have to acquire these items: a star jewel, a mark of timber, and a gilded steel rod.");
  }
  if ($text=~/bracer/i) {
    quest::say("If you want the Woodsman's Bracer you will have to acquire these items: a moon jewel, a mark of lakes, and some lightning dust.");
  }
  if ($text=~/greaves/i) {
    quest::say("If you want the Woodsman's Greaves you will have to acquire these items: an astral jewel, a mark of oceans, a pouch of fire stones, and a cat skin pouch.");
  }
  if ($text=~/helm/i) {
    quest::say("For the Woodsman's Helm you will have to acquire these items: a cloud jewel, a mark of leaves, a frost covered leaf, and some sea grass.");
  }
  if ($text=~/mail/i) {
    quest::say("To get the Woodsman's Mail you will have to acquire these items: a sky jewel, a mark of forests, a frozen vial, and a tro jeg brain.");
  }
  if ($text=~/vambraces/i) {
    quest::say("If you want the Woodsman's Vambraces you will have to acquire these items: a meteor jewel, a mark of mountains, a tro jeg eye, and a solstice rune.");
}
}
sub EVENT_ITEM{
  if (plugin::check_handin(\%itemcount, 5852 => 1, 5853 => 1, 5851 => 1, 4488 => 1)) { #axe
  quest::emote("smiles.");
  quest::say("Here is what I promised, $name.");
  quest::exp(25000);
    quest::summonitem(3958);
  }
  elsif (plugin::check_handin(\%itemcount, 5695 => 1, 5694 => 1, 4490 => 1)) { #boots
    quest::summonitem(3952);
  }
  elsif (plugin::check_handin(\%itemcount, 5693 => 1, 5692 => 1, 4489 => 1)) { #bracer
    quest::summonitem(3951);
  }
  elsif (plugin::check_handin(\%itemcount, 4494 => 1, 5689 => 1, 5687 => 1, 5688 => 1)) { #greaves
    quest::summonitem(3949);
  }
  elsif (plugin::check_handin(\%itemcount, 4491 => 1, 5679 => 1, 5678 => 1, 5680 => 1)) { #helm
    quest::summonitem(3946);
  }
  elsif (plugin::check_handin(\%itemcount, 5682 => 1, 5681 => 1, 4492 => 1, 5683 => 1)) { #bp
    quest::summonitem(3947);
  }
  elsif (plugin::check_handin(\%itemcount, 5684 => 1, 4493 => 1, 5686 => 1, 5685 => 1)) { #vambs
    quest::summonitem(3948);
  
  
  }
}
#not sure on the proper amount of exp to be awarded
#END of FILE Zone:twilight  ID:170151 -- Alton_Daleson 

