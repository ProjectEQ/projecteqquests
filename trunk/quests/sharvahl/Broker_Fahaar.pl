#Zone:sharvahl  ID:155074 -- Broker_Fahaar
#Progressive Taioling Quest

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello $name, if you know any citizens looking for work please tell them to show me their acrylia slate.");
  }
  if($text=~/belt strap/i) {
    quest::say("Belt straps are cut from medium quality rockhopper hides. Just take the knife and cut a strap out of a good section in the hide. The medium quality hides are nice and tough, but you have to search a bit to find a decent strip in the material. Good luck with it.");
  }
  if($text=~/black chitin belts/i) {
    quest::say("Black chitin belts are made by using the Vah Shir needle set and a Shade Silk to thread some sections of scorpion carapace onto a rough belt strap. The belts look great and they are rumored to make you feel stronger. You'll want to use the Vah Shir needle set I just gave you with the silk, as normal needles will most likely break off if you try to push them through a scorpion carapace.");
  }
  if($text=~/bone beaded belts/i) {
    quest::say("Bone beaded belts are made by threading grimling finger bones onto a rough belt strap with a Shade silk thread. The bones are often tough to pierce, so you'll have to use your Vah Shir needle set on them. Be careful not to poke yourself.");
  }
  if($text=~/owlbear feathered leggings/i) { #text ad lib no log available
    quest::say("Owlbear feathered leggings are made by stitching owlbear feathers to a sonic wolf pelt. Go ahead and use shade silk thread also but you will need more than with the belts. Stories are told of the pelt and feathers combining to protect against magic, but you know how stories go. Remember to use your new acrylia needle to stitch everything together.");
  }
  if($text=~/owlbear hide tunic/i) {
    quest::say("Owlbear hide tunics are notoriously difficult to make; you'll need to use your acrylia needle to sew two owlbear hides together. You'll need two lengths of Shade Silk thread for the stitching, as well as a tunic pattern.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 2877 => 1)) { #Acrylia Slate of Shar Vahl
    quest::say("Excellent. I can always use someone eager to work. I require young rockhopper hides to stretch for some special tailoring projects. Combine in this sack the hides of four young rockhoppers and return to me the full hopperhide sack. I will give you a stretched hide in return.");
    quest::summonitem(17236); #Young Hopperhide Sack
    quest::ding();
    quest::summonitem(2877); #Acrylia Slate of Shar Vahl
  }
  elsif(plugin::check_handin(\%itemcount, 3661 => 1)) { #Full Hopperhide Sack
    quest::say("Very nice. I thank you $name. Here is the stretched hide I promised and a leather cord I made from the scraps. If you have no need for the hide itself, any merchant will purchase it from you. If you desire to become my apprentice, save four of the cords that you earn from me and return them when you desire to learn more. May the spirits guide and protect you!");
    quest::summonitem(3655); #Stretched Hopperhide
    quest::summonitem(3656); #Leather Cord
    quest::ding();
    quest::exp(1000);
  }
  elsif(plugin::check_handin(\%itemcount, 3656 => 4)) { #Leather Cord x 4
    quest::say("So you wish to learn the way of the Vah Shir tailors, do you? I assure you it is among the most difficult to master of any of the great Vah Shir disciplines, but one of the most rewarding as well. If you truly wish to learn how to manipulate fabrics and materials of all types you'll have to start with a basic task. Take this Vah Shir skinning knife and use it to cut a [belt strap]. Once you feel that you've mastered that task, bring me an example of your work and the Vah Shir skinning knife I gave you and we'll start you on some needle work.");
    quest::exp(1000);
    quest::ding();
    quest::summonitem(3913); #Vah Shir Skinning Knife
  }
  elsif(plugin::check_handin(\%itemcount, 3922 => 1)) { #Rough Belt Strap
    quest::emote("briefly glances at the strap and throws it over his shoulder. He then says");
    quest::say("I can tell it's hurried work, but it will do. I suppose you're ready to learn some needlework. The needlework really makes the belt. Here, this needle set will allow you to learn the basics of our trade. You'll want to practice on some [Black Chitin Belts] and some [Bone Beaded Belts]. Bring me one example of each of these and your needle set to show me that you've mastered the basics of this sort of needlework. If your work is good enough you might be able to sell a piece or two as well.");
    quest::exp(1000);
    quest::ding();
    quest::summonitem(3914); #Vah Shir Needle Set
  }
  elsif(plugin::check_handin(\%itemcount, 3914 => 1, 3924 => 1, 3925 =>1 )) { #Vah Shir Needle Set, Bone Beaded Belt, Black Chitin Belt
    quest::say("You're getting better, $name, these are very well done. I believe you're ready to take the acrylia needle that is so necessary to our work. With this needle you'll be able to pierce even the toughest hides almost effortlessly, as well as to stitch the most delicate fabrics without tearing them. The first thing you should work on with this needle are some [Owlbear feathered leggings]. When you have managed to fashion a set of these, bring them to me with your acrylia needle and I'll provide the final tool for your journey toward master tailor.");
    quest::exp(1000);
    quest::ding();
    quest::summonitem(3915); #Acrylia Needle
  }
  elsif(plugin::check_handin(\%itemcount, 3915 => 1, 3926 => 1)) { #Acrylia Needle, Owlbear Feathered Leggings
    quest::say("Well done, $name. These leggings are truly the work of an aspiring master tailor. I have just received word from the palace that the king is planning a celebration in the near future, and he wishes the guards to have new uniforms. Take this case and fill it with [owlbear hide tunics] and take it to Elder Hymnist Hortitosh on the roof of the palace. I'm sure the king will be pleased with your work.");
    quest::exp(1000);
    quest::ding();
    quest::summonitem(3916); #Acrylia Thimble and Needle Set
    quest::summonitem(17109); #Clothing Case
  }
  elsif(plugin::check_handin(\%itemcount, 3921 => 1)) { #Order Receipt
    quest::say("Well done, $name. You have done very well and the king is pleased. You have been a great help to me filling that order for the king. Here, take this jerkin and wear it with pride. All who see it will know that you are an accomplished tailor and a friend of Fahaar!");
    quest::exp(2000);
    quest::summonitem(3927); #Sleek Sonic Wolf Hide Jerkin
    quest::ding();
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:sharvahl  ID:155074 -- Broker_Fahaar