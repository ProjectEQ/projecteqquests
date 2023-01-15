# Phylactery Will Get You Nowhere
# Created by Gonner
# items: 14759, 55275, 5741, 55278, 55295, 55280, 26744, 55285, 27930, 55286, 1117, 55291, 55290, 55298, 55299

sub EVENT_SAY {

if($text=~/way/i && $phylactory == 7){
	quest::say("Look for Raotin Teawel, I believe he can be found on an island somewhere nearby where you would acquire a robe or tunic of Kael, Skyshrine or Thurgadin manufacture. Take one of those items and my token of service when you are ready and he shall share with you his newest creation, a robe or tunic of great power. If you are not satisfied with your robe or tunic, hand it to the Guardian of K'Arnon and he will exchange it for you.");  
	}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 14759 => 1 && $phylactory == 1)) { # Tome of Miragul
	quest::say("An auspicious beginning. To reward your start, I will enlighten you with the secret of palatable mana, which is required to create a phylactery, but also has independent uses as well. Brew it like wine, but include a vial of mana as created by the ablest enchanters plus a pinch of this special sugar as well as grapes that can be grown only by the halflings of Rivervale. When you are ready to continue with the next step, return with the history of the Di'Zok and give it to me.");  
	quest::setglobal("phylactory", 2, 5, "F");
	quest::summonitem(55275); # Sea-foam sugar
	}

if (plugin::check_handin(\%itemcount, 5741 => 1 && $phylactory == 2)) { # History of the Di`zok
	quest::say("Excellent work. This book is not easily come by. This next step is the first of creating components for the phylactery itself, the silk insert. This is the base inside of the box and it must be made of durable stone silk to withstand the energies within a phylactery. When you are ready to continue with the next step, return the long-lost Journal of Aataltaal to me. His tomb is rumored to be in the Hills of Shade, and while I doubt this is true, rumor depends on some truths so somewhere nearby is where to discover this book.");  
	quest::setglobal("phylactory", 3, 5, "F");
	quest::summonitem(55278); # Insert Pattern
	}

if (plugin::check_handin(\%itemcount, 55295 => 1 && $phylactory == 3)) { # Journal of Aataltaal
	quest::say("Impressive, young one. I truly did not believe you would locate this volume. My instructions for constructing a phylactery shall continue. The third step requires the construction of the soul net -- the silken binding for inside the lid of the phylactery. This requires delicate and balanced threading that only the ablest fletchers can perform. To create this mystic mesh, you'll need the silk of a spider that itself deals with the immaterial as well as shadewood clips to attach the soul net to the lid of the phylactery. You must also use the glue I have given to you. When you are ready to continue, bring the book guarded by yet another spider, this one found in the Planes of Power.");  
	quest::setglobal("phylactory", 4, 5, "F");
	quest::summonitem(55280); # Incorporeal Bond
	}

if (plugin::check_handin(\%itemcount, 26744 => 1 && $phylactory == 4)) { # Firebone Notebook
	quest::say("My, my, you are serious about this effort, aren't you? This book is a excellent find from the Planes of Power and has earned you instructions for the fourth step in the process of creating a phylactery. A spellcaster may willingly give his soul to a phylactery to become a lich, but the process will not hold unless the phylactery can keep hold of the soul. The net snatches it, but a crucible of containment secures it. This sketch will help you get started, then you need merely follow similar, well-documented methods such as are used for a Crucible of Escape. The modifications should be obvious to one as talented as yourself. Also, the penultimate book I require is a bloody tome from Antonica.");  
	quest::setglobal("phylactory", 5, 5, "F");
	quest::summonitem(55285); # Crucible Sketch
	}

if (plugin::check_handin(\%itemcount, 27930 => 1 && $phylactory == 5)) { # Sanguine Tome
	quest::say("Thank you for this addition to my library. You're drawing close to the end of your quest. Only two more steps to complete and you will be glad to hear they are no more complicated than the first ones. The lids of the phylactery must be hinged and as no portion of the item can be of ordinary manufacture. You must fashion clasps of sealing. This mold will help you, but the Velium bits used must be enchanted and combined with a seemingly mundane object that yet holds great powers over the soul of an undead and weighs it down, anchoring it to this world. Undead elves especially are held here in this way. The results are then carefully filed smooth. Finally, the volume I require from you in exchange for the last information you require is the spellbook of the greatest living wizard on Velious.");  
	quest::setglobal("phylactory", 6, 5, "F");
	quest::summonitem(55286); # Clasp Mold
	}

if (plugin::check_handin(\%itemcount, 1117 => 1 && $phylactory == 6)) { # Velketor's Spellbook
	quest::say("I am impressed by your efforts. The deeds are truly no less outstanding than my own when I stole into Miragul's Menagerie and stole a most unique tome and learned much of what I am passing along to you. The last step required of you will demand as much attention as all the prior travels and efforts to this point. Here is a decorated box I found in Miragul's laboratory that will form the substance of your phylactery. Once you have acquired and lacquered a precious garnet with the blood of a vampire, then apply the garnet and the five other pieces you've created to the decorated box and you'll have your prize. But remember, a precious garnet can be gained only from a god. As I find it unlikely you shall succeed in crafting a phylactery, and despite my payment in advice, allow me to thank you for your services in another [way].");  
	quest::setglobal("phylactory", 7, 5, "F");
	quest::summonitem(55291); # Token of Service
	quest::summonitem(55290); # Decorated Box
	}

if (plugin::check_handin(\%itemcount, 55298 => 1)) { # Phylactery
	quest::say("Excellent work. There is only one slight error that I have now corrected for you.");  
	quest::summonitem(55299); # Dark Phylactery
	}

if (plugin::check_handin(\%itemcount, 55299 => 1)) { # Dark Phylactery
	quest::say("Ah, you wish to perform your own alterations? Very well.");  
	quest::summonitem(55298); # Phylactery
}

}

# END of FILE Zone:oot  ID:69087 -- Assistant_Jeyular.pl

