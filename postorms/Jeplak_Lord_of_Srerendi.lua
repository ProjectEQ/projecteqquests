#check if any Hleytis Maor,Hleyta Menn, or Named are up
#If none alive depop and spawn real named

my $x;
my $y;
my $z;
my $h;
my $trash1check;
my $trash2check;
my $trash3check;
my $name1check;
my $name2check;

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
} 

sub EVENT_SIGNAL { # Signal from the death of any appropriate named or trash
  $trash1check = $entity_list->GetMobByNpcTypeID(210056); # a_hleytis_maor
  $trash2check = $entity_list->GetMobByNpcTypeID(210057); # a_hleyta_menn
  $trash3check = $entity_list->GetMobByNpcTypeID(210058); # a_hleyta_menn
  $name1check = $entity_list->GetMobByNpcTypeID(210028);  # Paruek_the_Strong
  $name2check = $entity_list->GetMobByNpcTypeID(210029);  # Faruek_the_Bold
  if(!$trash1check && !$trash2check && !$trash3check && !$name1check && !$name2check) {
    quest::spawn2(210231,0,0,$x,$y,$z,$h); #Jeplak_Lord_of_Srerendi
    quest::depop_withtimer();
  }
}
# End of File  Zone: PoStorms ID: 210179 -- Jeplak_Lord_of_Srerendi


local activated = false;
local guards = {};	--spawned once fake Jeplak is activated

function event_spawn(e)
	--depop mobs if happen to be up since cycle is restarting
	eq.depop_all(210267) --a_confused_castaway (210267)
	eq.depop_all(210231) --Jeplak_Lord_of_Srerendi (210231)
	activated = false;
end


function event_signal(e)-- Signal from the death of any appropriate named or trash
	if not trash_check() and not activated then
		activate(e.self);	--activate if trash is cleared
	end
end

function event_timer(e)
	if e.timer == "monitor" then
		if trash_check() and not e.self:IsEngaged() then
			deactivate(e.self);
		else
			eq.stop_timer(e.timer);
			eq.set_timer("monitor", 15 * 1000);
		end
	end
end

function event_death_complete(e)
	eq.unique_spawn(210267,0,0,346,-2512,-450,0);	 --a_confused_castaway (210267)
end


function deactivate(mob)
	activated = false;
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);	--will not aggro
	mob:SetSpecialAbility(35, 1);	--no harm from players
	mob:WipeHateList();
	mob:GotoBind();
	depop_guards();
end

function activate(mob)
	activated = true;
	mob:SetBodyType(1, true);		--humanoid
	mob:SetSpecialAbility(24, 0);	--will not aggro
	mob:SetSpecialAbility(35, 0);	--no harm from players
	eq.set_timer("monitor", 30 * 60 * 1000);	--remain targetable for 30 minutes at a minimum.  after that point will go untargetable if spwanpoints repop and mob is not engaged
	spawn_guards();
end

function trash_check()	--iterate through related spawnpoints for both Jeplak camps
	local spawn_table = {346712,346713,346714,346715,346716,346717,346718,346719,346720,346721,346722,346730,346376,346377,346379,346378,346380,346381,346382,346383,346384,346385};

	for _,spawns in pairs(spawn_table) do
		local giant = eq.get_entity_list():GetSpawnByID(spawns);
		
		if giant:NPCPointerValid() then
			return true;
		end
	end
	return false;
end

function spawn_guards()
	local spawn_locs = {	[1] = {435,-2400,-460,0}, [2] = {426,-2415,-460,0}, [3] = {447,-2415,-451,0}, [4] = {378,-2400,-462,0}, [5] = {362,-2400,-462,0}, 
							[6] = {370,-2415,-462,0}, [7] = {317,-2415,-462,0}, [8] = {267,-2415,-462,0}, [9] = {260,-2400,-462,0}, [10] = {253,-2415,-462,0}	};
	
	for n = 1,10 do
		guards[n] = eq.spawn2(eq.ChooseRandom(210056,210099,210058),0,0,spawn_locs[n][1],spawn_locs[n][2],spawn_locs[n][3],spawn_locs[n][4]);
	end
end

function depop_guards()
	for k,v in pairs(guards) do
		guards[k]:Depop(false);
	end
end
