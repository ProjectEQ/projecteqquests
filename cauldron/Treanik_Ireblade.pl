#zone Cauldron
#by Angelox -- rewritten for berserker epic: wizardanim

sub EVENT_SAY
	
	{

	if($text=~/Hail/i && $class == 16 && $level >= 46)
		{
		quest::say("You berserker, but me have nothing for you!")
		}

	
	if($text=~/Hail/i && $class == 16 && $level < 46)
		{
		quest::say("Me has nothing to do with you youngling.")
		}

	
	if($text=~/Hail/i && $class != 16)
		{
		quest::say("You not berserker, so you go away. Me no talk to you!");
		}
	
	
	if($text=~/beast fights/i && $handin == 1)
		{
		quest::say("Da only way to learn is to fight. It called Praklion of the Cauldron or sometin. Me hear it live here very long time, but rarely come out. It feed at weird times. Course, dat when it most mad. McArik found it traveling through deep craggy lands. Dat is how he decided it was good beast to test his ability to beat a baddy dat had some [sense of strategy]. It even took him long time to defeat it.");
		}
	
	if($text=~/sense of strategy/i)
		{
		quest::say("It do have sense of stragegy. It a creature dat has got smartz wit da magic too. Da way it mixes its abilities is good stuffs. You gots to try to catch it when it eats. It usually comes out when it dark out. And when you kill it, can you get my axe back? Me lost it to dat beast. Plus me needs proof you killed it so me can give you sumtin to give to McArik.");
		$handin=undef;
		}




}

sub EVENT_ITEM

	{
	
	if(plugin::check_handin(\%itemcount, 60199 => 1))
		{
		quest::say("Me hopes you can hold your breath, $name. Me make sure to stock up before makin' dat long swim. Pesky goblins all over. Treanik must tell dat dere is much more dan pests here to taunt da likes of us. Dere be a beast down dere dat me not killed yet. Me much younger dan you, but me learn how dat [beast fights] -- it smarter dan da average creature, you know. Don't be fooled.");
		$handin=1;
		quest::settimer(1,600);
		}

	
	
	if(plugin::check_handin(\%itemcount, 60200 => 1))
		{
		quest::say("My axe! Me so happy! You are big force to be rekoned with, $name. Me wasn't sure... but now, look at you, like spiroc fluffing feathers. McArik be so pleased! Take dis amulet me made. I know not much, but me swore to McArik that anyone who passes dis test would get a trinket from me.");
		quest::summonitem(60201);
		}
  plugin::return_items(\%itemcount);
}


sub EVENT_TIMER ## incase quest is bugged... and person does not complete dialogue... quest will reset itself.

	{
	if($timer == 1)
		{
		quest::stoptimer(1);
		$handin=undef
		}
}