include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Hybrid', 'FullTH'}
  TreasureHunter = M(false, 'Treasure Hunter')
  -- Capacity = M(false, 'Capacity Mantle')
  -- DamageDown = M(false, 'Damage Down')

  Abyssea = {
    current = 0,
    weapons = {
      { name="Pluto's Staff", ws="Earth Crusher=Earth, Sunburst=Light" },
      { name="Wax Sword", ws="Red Lotus Blade=Fire, Seraph Blade=Light" },
      { name="Ash Club", ws="Seraph Strike=Light" },
      -- { name="Uchigatana", ws="Tachi Jinpu=Wind, Koki=Light" },
      { name="Bronze Dagger", ws="Cyclone=Wind, Energy Drain=Dark" },
      -- { name="Kunai", ws="Blade: Ei=Dark" },
      { name="Lost Sickle", ws="Shadow of Death=Dark" },
      { name="Lament", ws="Freezebite=Ice" },
      { name="Tzee Xicu's Blade", ws="Raiden Thrust=Thunder"}
    }
  }
end

function define_binds()
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle TreasureHunter")
  send_command("alias g15v2_m1g5 gs c abbyweapon")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()

  gear = {
    toutatis = {
      tp={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
      ws={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }
  }

  sets.idle = {
  }
  sets.modes = {}
  sets.modes.Normal = {
    -- ammo="Ginsen",
    ranged="Exalted Crossbow +1",
    ammo="Gashing Bolt",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back=gear.toutatis.tp,
  }
  sets.modes.Hybrid = {
    -- ammo="Staunch Tathlum +1",
    ranged="Exalted Crossbow +1",
    ammo="Gashing Bolt",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,    -- 2 PDT
    legs="Meg. Chausses +2",             -- 6 PDT
    feet=augments.herc.feet.triple,      -- 2 PDT
    neck="Loricate Torque +1",           -- 6 DT
    waist="Flume Belt +1",               -- 4 PDT
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",          -- 10 PDT
    right_ring="Moonbeam Ring",          -- 4 DT
    back=gear.toutatis.tp,               -- 10 PDT
  }                                      -- 47 PDT
  sets.modes.FullTH = {
    -- ammo="Ginsen",
    ranged="Exalted Crossbow +1",
    ammo="Gashing Bolt",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Plunderer's Armlets +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.th2,
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back=gear.toutatis.tp,
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.Rudra = {
    -- ammo="Falcon Eye",
    head=augments.herc.head.dimi,
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs=augments.herc.legs.ws,
    feet=augments.herc.feet.dimi,
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring +1",
    back=gear.toutatis.ws
  }
  -- sets.WS['Exenterator'] = {
  -- }
  sets.WS['Evisceration'] = {
    -- ammo="Yetshila",
    head="Adhemar Bonnet",
    neck="Fotia Gorget",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back=gear.toutatis.ws,
    waist="Fotia Belt",
    legs=augments.herc.legs.ws,
    feet=augments.herc.feet.dimi
  }
  sets.WS['Savage Blade'] = {
    head=augments.herc.head.wsd,
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    left_ring="Karieyh Ring +1",
    right_ring="Regal Ring",
    back=gear.toutatis.ws,
    waist="Prosilio Belt +1",
    legs=augments.herc.legs.ws,
    feet=augments.herc.feet.triple
  }
  sets.WS['Aeolian Edge'] =  {
    -- ammo="Ombre Tathlum +1",
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    left_ring="Dingir Ring",
    right_ring="Karieyh Ring +1",
    back=gear.toutatis.ws,
    waist="Eschan Stone",
    legs=augments.herc.legs.magic,
    feet= augments.herc.feet.mab
  }
  sets.WS['Circle Blade'] = {
    -- ammo="Falcon Eye",
    head={ name="Herculean Helm", augments={'Rng.Atk.+18','Weapon skill damage +4%','MND+10','Rng.Acc.+13',}},
    body="Herculean Vest",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Weapon skill damage +3%','DEX+7',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+18','Weapon skill damage +2%','INT+4','"Mag.Atk.Bns."+10',}},
    neck="Fotia Gorget",
    waist="Caudata Belt",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    left_ring="Ilabrat Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
  }

  -- Job Abilities
  --
  sets.JAs = {}
  sets.JAs.Waltz = {
    lring = 'Asklepian Ring'
  }
  sets.TreasureHunter = {
    hands="Plunderer's Armlets +1",
    waist="Chaac Belt",
    legs=augments.herc.legs.treasure
  }
  sets.DamageDown = {
    neck = "Loricate Torque +1",
    lring = "Gelatinous Ring +1",
    rring = "Defending Ring",
    waist = "Flume Belt +1",
  }
  sets.run = {
    feet = "Fajin boots"
  }

  -- Magic
  sets.MA = {}
  sets.MA.FastCast = {
    -- ammo="Impatiens",
    head=augments.herc.head.fc,         -- 12
    neck="Orunmila's Torque",           -- 5
    body="Taeon Tabard",                -- 8
    hands="Leyline Gloves",             -- 7
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    lring="Kishar Ring",                -- 4
    rring="Prolix Ring",                -- 2
    legs=augments.taeon.legs.phalanx,   -- 3
  }
  sets.MA.SpellInterrupt = {
    -- ammo="Staunch Tathlum +1",          -- 10
    head=augments.taeon.head.SID,    -- 7
    neck="Loricate Torque +1",
    -- lear="Halasz Earring",           -- 5
    rear="Magnetic earring",         -- 8
    hands="Rawhide Gloves",          -- 15
    left_ring="Defending Ring",      -- PDT
    right_ring="Warden's Ring",      -- PDT
    waist="Flume Belt +1",
    feet=augments.taeon.feet.phalanx -- 9
  }

  sets.Preshot = {                           -- Snap | Rapid
    head=augments.taeon.head.snapshot,       --   8    0
    legs=augments.adhemar.kecks.rapidShot,   --   9    10
    feet="Meg. Jam. +2",                     --  10    0
    waist="Yemaya Belt",                     --   0    5
  }
  sets.Ranged = {
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Regal Ring",
    right_ring="Dingir Ring",
    back=gear.toutatis.tp
  }
end

function precast(spell)
  if spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english] or sets.WS.Rudra)
  elseif spell.type == 'JobAbility' then
    if sets.JAs[spell.english] then
      equip(sets.JAs[spell.english])
    end
  elseif spell.action_type == 'Magic' then
    equip(sets.MA.FastCast)
    if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
      send_command('@wait 3.0; cancel 66; cancel 444; cancel 445')
    end
  elseif spell.english == "Ranged" then
    equip(sets.Preshot)
  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.5)
    send_command('@cancel 71;')
  elseif spell.english == 'Curing Waltz II' or spell.english == 'Curing Waltz III' then
    equip(sets.JAs.Waltz)
  end

  maintain_reraise_equip()
end

function midcast(spell)
  if spell.action_type == 'Magic' then
    equip(sets.MA.SpellInterrupt)
  elseif spell.english == 'Ranged' then
    equip(sets.Ranged)
  end
end

function aftercast(spell)
  if player.in_combat then
    equip_set_for_current_mode()
  end
  maintain_reraise_equip()
end

function status_change(new, old)
  if new == 'Engaged' then
    equip_set_for_current_mode()
    maintain_reraise_equip()
  elseif new == 'Idle' then
    equip(sets.run)
  end
end

function self_command(commandArgs)
  local commandArgs = commandArgs
  if type(commandArgs) == 'string' then
    commandArgs = commandArgs:split(' ')
    if #commandArgs == 0 then
        return
    end
  end
  command = commandArgs[1]

  if command == 'mode' then
    equip_set_for_current_mode()
  elseif command == 'cycle' then

    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip_set_for_current_mode()
    end
  elseif command == 'idle' then
    equip(sets.idle)
  elseif command == 'run' then
    equip(sets.run)
  elseif command == 'abbyweapon' then
    cycle_weapon()
  end
end

function set_for_engaged()
  local set = sets.modes[PrimaryMode.current]
  if TreasureHunter.value then
    set = set_combine(set, sets.TreasureHunter)
  end
  return set
end

function equip_set_for_current_mode()
  equip(set_for_engaged())
  maintain_reraise_equip()
end

function maintain_reraise_equip()
  if player.equipment.rear == 'Reraise Earring' then
    equip({rear = 'Reraise Earring'})
  end
  if player.equipment.lear == 'Reraise Earring' then
    equip({lear = 'Reraise Earring'})
  end
end

function cycle_weapon()
  Abyssea.current = Abyssea.current + 1
  local len = tablelength(Abyssea.weapons)

  -- if Abyssea.current > tablelength(Abyssea.weapons) then
  if Abyssea.current > #Abyssea.weapons then
    add_to_chat(122, '*** DD Weapons Equiped ***')
    equip({ main = "Skinflayer", sub = "Taming Sari" })
    Abyssea.current = 0
  else
    local set = Abyssea.weapons[Abyssea.current]
    add_to_chat(122, 'Switching to ' .. set.name ..'. Use weapon skills: ' .. set.ws)
    equip({ main = set.name, sub = '-' })
  end
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
