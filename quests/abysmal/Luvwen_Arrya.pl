# Bard Abysmal Sea armor
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, adventurer. Welcome aboard! Should you be a bard like myself, I am sure you have collected quite a few stories thus far in your travels. Would you be a [bard]?"); 
  }
  if ($text=~/bard/i) {
    quest::say("Well, then, perhaps I can be of even greater assistance to you. If you are in need of new equipment such as [helm], [legplates], [chestplate], [bracer], [vambraces], [gloves], or pair of [boots] let me know."); 
  }
  if ($text=~/bracer/i) {
    quest::say("A bracer is rather simple to reshape. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite metal to strengthen it. One sheet of infused Muramite metal along with a reworked bracer from me in a forge should yield a fine bracer."); 
  }
  if ($text=~/helm/i) {
    quest::say("I can easily reform a Muramite helm into something suitable for you. Nalasrine has managed to form a powerful compound that reinforces some native materials. Bring me Muramite Helm Armor and I wil rework it for you. Once I have finished with that you need only to fuse your infused Muramite metal and the helm I give you in a forge."); 
  }
  if ($text=~/gloves/i) {
    quest::say("I can make you a wonderful pair of gloves. Take the time to dig up some Muramite metal and have Nalasrine assist you with infusing it. Bring me Muramite Glove Armor and I can reshape it into something that you can use. Strengthen the gloves in a forge with the newly infused metal, and a fine pair shall be yours."); 
  }
  if ($text=~/legplates/i) {
    quest::say("Reforming some Muramite legplates into a pair that would serve you well should be no great feat. Bring me a pair of Muramite Greaves and I will rework them for you. For these you will need to infuse two sheets of Muramite metal with Nalasrine's special solvent. Combine both sheets with the new greaves in a forge and voila!"); 
  }
  if ($text=~/chestplate/i) {
    quest::say("Ahh, a chestplate. Such a thing of beauty! I can craft one for you farily easily if you do the legwork. Travel into the hostile areas and bring back two sheets of Muramite metal and Muramite Chest Armor. Make sure to speak to Nalasrine about infusing the sheets of metal. Bring me the chest piece for reworking, then simply weld together the new chest and sheets in a forge."); 
  }
  if ($text=~/boots/i) {
    quest::say("A pair of boots you want, hmm? Yes, I can see the pair you are wearing seem a bit worn. Bring me back Muramite Boot Armor and I bevlive I can rework them into something quite fine for you. Place them into a forge with one sheet of Infused Muramite metal to yield your boots. If you need help in the infusing process, just talk to Nalasrine."); 
  }
  if ($text=~/vambraces/i) {
    quest::say("A new set of vambraces is what you seek? Hardly a challenge, at least for me. You, however, have some work to do. Venture into these strange lands and bring me Muramite Sleeve Armor. I will rework the sleeves for you, but you will need to talk to Nalasrine about infusing a sheet of Muramite metal as well. Place the bracer from me along with one sheet of infused Muramite metal in a forge for your sleeves."); 
  }
}

sub EVENT_ITEM {
	if ($class eq "Bard") {
		if (plugin::check_handin(\%itemcount, 68222 => 1)) { # Bracer
			quest::summonitem(54163); # reworked Bracer
		}
		elsif (plugin::check_handin(\%itemcount, 68220 => 1)) { # helm
			quest::summonitem(54161); # reworked helm
		}
		elsif (plugin::check_handin(\%itemcount, 68223 => 1)) { # Gloves
			quest::summonitem(54164); # reworked gloves
		}
		elsif (plugin::check_handin(\%itemcount, 68225 => 1)) { # legplates
			quest::summonitem(54166); # reworked legplates
		}
		elsif (plugin::check_handin(\%itemcount, 68226 => 1)) { # chestplate
			quest::summonitem(54167); # reworked chestplate
		}
		elsif (plugin::check_handin(\%itemcount, 68224 => 1)) { # boots
			quest::summonitem(54165); # reworked boots
		}
		elsif (plugin::check_handin(\%itemcount, 68221 => 1)) { # vambraces
			quest::summonitem(54162); # reworked vambraces
		}
		else{     
			quest::say("I have no use for this.");    
			plugin::return_items(\%itemcount);
		}
	}
	plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279016 -- Luvwen_Arrya.pl