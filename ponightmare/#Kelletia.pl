##Kelletia.pl
#Alternate PoP Flag: Bypass Hedge & Terris Thule
# items: 51615, 51616, 51617

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("Shhh $name, [they] can hear and see every move that you make.");
	}
	
	if ($text=~/they/i) {
		quest::say("Terris Thule and her henchman are after me. I thought I had completed my [work] without being noticed but something went wrong.");
	}
	
	if ($text=~/work/i) {
		quest::say("I came here to find the pieces of the dagger for Variok. Terris did a good job at scattering them across her maze but I was able to sneak around and find each of them without being noticed. I crafted the dagger back together and I made my escape out of the maze to here. I was going to take a night's rest then leave this plane and return the dagger to Variok but that's when the [nightmares] started.");
	}
	
	if ($text=~/nightmares/i) {
		quest::say("I fell asleep here that night and in my dreams I saw Terris Thule ordering her henchman to kill me at all costs because I have the dagger in my possession. I try and fight the urge to sleep but eventually I find myself running from them, fighting to stay alive. My only hope of surviving is to assassinate her henchman before he assassinates me. I have scouted the area and I know my point of attack but with the many sleepless nights I don't think I have the power to assassinate him myself. Do you think you [can help] me?");
	}
	
	if ($text=~/can help/i) {
		quest::say("Ok every night he appears just south east of the maze. He has two guardsmen with him when he is around. If he were alone I could assassinate him but his two guards pose a problem for me. Kill him and bring his heart back to me.");
	}
	
	if ($text=~/three items/i) {
		if (defined{pop_pot_tt_hedge_bypass} && $qglobals{pop_pot_tt_hedge_bypass} == 1) {
			quest::say("I need a secured wooden case and two pieces of silky cloth. If you can bring them back to me I'll be able to return this to Veriok.");
		}
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 51615 => 1)) {#Heart of the Tyrant 
		quest::say("You made fast work of him. I need to clean this dagger before returning it to Variok. With Terris and her henchman chasing me I couldn't collect the pieces that I needed. Could you collect [three items] for me?");
		quest::setglobal("pop_pot_tt_hedge_bypass",1,5,"F");#First stage complete.
	}
	
	if(plugin::check_handin(\%itemcount, 51616 => 1, 51617 => 2)) {#Secured Wooden Case, 2x Silky Cloth
		if (defined{pop_pot_tt_hedge_bypass} && $qglobals{pop_pot_tt_hedge_bypass} == 1) {
			quest::say("Perfect I can clean this dagger up and return it to Veriok. You were a great help to me. I'll be sure to report that to Veriok when I get back.");
			quest::setglobal("pop_pot_tt_hedge_bypass",2,5,"F");#Second, final stage complete.  TT and Hedge will be bypassed when you hail Veriok Dreik in potranquility again.
			quest::exp(10000);
		}
	}
	plugin::return_items(\%itemcount); #return items if not the ones required
}#END of FILE Zone:ponightmare ID:204055 --#Kelletia.pl
