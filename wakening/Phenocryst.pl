# The Velium Focus
# Created by Gonner
# items: 1694, 1692, 1701, 1693, 1695, 1697, 1696, 1698, 1699, 1700


sub EVENT_SAY {
if($text=~/hail/i) {
	quest::emote("speaks with a soundless voice, as if you are hearing your own thoughts. 'We sense you are attempting communication with us but do not understand what it is you are trying to convey. We are eager to know more. Perhaps there is one who knows the language of the stone and will speak with us");
	}

if($text=~/help you/i) {
	quest::emote("speaks from within your mind as well as conveys a sense of joy empathically. It is said that the harbringer will find all of our people and unite them. When we join we will know all of our experiences and perhaps then be aware of how to proceed with the next step in our asscention. We implore you to find others like us and make them aware of us. You know the language of the stone and can tell them. We await your return with proof that you have spoken to them.");
	}

if($veliumfcous == 1 && $text=~/find what/i) { 
	quest::emote("says in the form of thoughts, We must call to it. We must make ourselves heard past these rocks though. A menhir must be constructed to amplify our voice. The stones we will need are not found in this area though. We hear whispers of stones far away that have the ability to channel and amplify our thoughts. We ask you to gather these stones for us harbinger.");
	}

if($veliumfocus == 1 && $text=~/gather these stones for you/i) {
	quest::emote("thoughts flood your mind, 'Thank you Harbinger. We need 3 crystals. One of Beryl, one of Stibnite, and one of the purest Iron. These minerals will only be found deep within the earth where the geology is relatively stable. This Focus will aid you in finding the right crystals. Return it to me with the 3 crystals and we will construct our Menhir. Please hurry Harbinger, our prophecy awaits.");
	quest::faction(458,10); # Geonid Collective
	quest::summonitem(1694); # Elbaite Focus
	}

}


sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 1692 => 1)) { # Velium Focus V1
	quest::emote("speaks to you from within your mind, You know the stone! This is wonderful! The fullfillment of the prophecy is now one step closer. The most ancient of the stone tells us that one not of stone will come forth and act as our harbringer of asscention. We believe you to be our harbringer. Please help us!");
	quest::summonitem(1701); # Velium Focus V3
	quest::faction(458,15); # Geonid Collective
	}

if(plugin::check_handin(\%itemcount, 1693 => 1)) { # Velium Focus V2
	quest::emote("sends it's thoughts to you, a feeling of disappointment washes over you, It seems the others are not aware of themselves yet. We are alone..So many questions yet we can find no answers. We have been given a very special gift but without direction we are lost. We must find who has made us aware of ourselves and why it has done so.");
	quest::faction(458,15); # Geonid Collective
	quest::setglobal("veliumfocus", 1, 5, "F");	# Prevent skipping steps
	}

if(plugin::check_handin(\%itemcount, 1694 => 1, 1695 => 1, 1697 =>1, 1696 => 1)) { # Elbaite Focus, The Reddish Crystal, Heavy Metal Crystal, Bent Metallic Crystal
	quest::emote("makes no sound but it's voice fills your mind. We have always held our memories within the earth and stone but only recently have we become aware of them. We do not know what happened or who gave us this wonderful gift but we can now access those memories and are aware of it's storage. With that knowledge has come questions and desires. When the prophecy comes to be then we will have our answers and fulfill our desires.");
	quest::emote("familiar thoughts flood into your mind again, You truly are the Harbinger, take this Focus as a mark of your friendship with us. Now we can construct the Menhir, we need .. the stones speak.. , There is a problem. Ones of flesh are coming, the large ones, 3 of them. They must not disturb us while we construct the Menhir! Please stop them Harbinger! bring us proof of their distruction along with your Focus and then we will begin the calling. Our asscention is at hand!");
	quest::faction(458,15); # Geonid Collective
	quest::summonitem(1698); # Azurite Focus
	quest::spawn2(119158,0,0,408.10, -690.21, -201.55,374); # accolyte of Zek  A
	quest::spawn2(119158,0,0,-564.04, -985.80, -191.31,374); # accolyte of Zek  B
	quest::spawn2(119164,0,0,303.02, 254.44, -201.54,374); # Bloodpriest Ioukond  C
	quest::settimer(5,3600); # 1 hour
	}

if(plugin::check_handin(\%itemcount, 1698 => 1, 1699 => 3)) {
	quest::emote("thoughts become your own, a feeling of joy overwhelms you, 'Because of you we can at last speak with our maker. We were once given a gift, and we ask that you accept this gift from us now so that we may come closer to that which we owe our sentience to. Now. ,we must construct the Menhir.");
	quest::faction(458,10); # Geonid Collective
	quest::summonitem(1700); # Phenocryst's Focus
	}

}

sub EVENT_TIMER {
if($timer == 5) {
	quest::signal(119158); # Depops accolyte of Zeks
	quest::signal(119164); # Depops Bloodpriest Ioukond
	}
}


#END of FILE zone:wakening ID:119024 -- Phenocryst.pl
