include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Hybrid', 'Accuracy'}
  DamageDown = M(false, 'Damage Down')
  Capacity = M(false, 'Capacity Mantle')
  Luzaf = M(true, 'Luzaf')
  Compensator = M(true, 'Compensator')
  Weapons = M{
    ['description'] = 'Weapons',
    'HollidayMagic',
    'HollidayPhys',
    'Anarchy',
  }
end

function define_binds()
  -- windower.send_command('lua reload autora')

  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g2 gs c cycle DamageDown")
  send_command("alias g15v2_m1g3 gs c cycle Luzaf")
  send_command("alias g15v2_m1g4 gs c weapon")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()
  define_roll_values()

  gear = {
    camulus = {
      meleeTp = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
      rangedTp = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
      rangedWsMagic = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
      rangedWsPhys = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
      meleeWs = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      snapShot = { name="Camulus's Mantle", augments={'"Snapshot"+10',}}
    },
    weapons = {
      HollidayMagic = { name="Holliday", augments={'"Mag.Atk.Bns."+21','Potency of "Cure" effect received+7%','Mag. Acc.+20 "Mag.Atk.Bns."+20','DMG:+5',}},
      HollidayPhys = { name="Holliday", augments={'"Store TP"+6','Rng.Acc.+28','Rng.Atk.+18','DMG:+28',}},
      Anarchy = "Anarchy +2",
    },
    bullets = {
      quickDraw = "Animikii Bullet",
      rangedAtt = "Eminent Bullet",
      magicWs = "Orichalc. Bullet"
    }
  }

  sets.modes = {}
  sets.modes.Normal = {}
  sets.modes.Normal.Engaged = {
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=augments.herc.hands.triple,
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back=gear.camulus.meleeTp,
  }
  sets.modes.Normal.Ranged = {
    ammo=gear.bullets.rangedAtt,
    head="Meghanada Visor +2",
    body="Mummu Jacket +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedTp
  }

  sets.modes.Hybrid = {}
  sets.modes.Hybrid.Engaged = {
    -- If Lanun:                      -- 8 DT
    head="Adhemar Bonnet +1",
    body="Lanun Frac +3",             -- 6 PDT
    hands=augments.herc.hands.triple, -- 2 PDT
    legs="Meg. Chausses +2",          -- 6 PDT
    feet=augments.herc.feet.triple,   -- 2 PDT
    neck="Loricate Torque +1",        -- 6 DT
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Gelatinous Ring +1",   -- 7 PDT
    right_ring="Defending Ring",      -- 10 DT
    back=gear.camulus.meleeTp,        -- 5 DT
  }                                   -- 52 PDT | 29 MDT
  sets.modes.Hybrid.Ranged = sets.modes.Normal.Ranged

  -- TODO: Create accuracy sets
  sets.modes.Accuracy = {}
  sets.modes.Accuracy.Engaged = {}
  sets.modes.Accuracy.Ranged = {}

  -- DT / Idle Sets
  sets.DamageDown = {
    head=augments.herc.head.pdt,
    neck="Loricate Torque +1",
    body="Lanun Frac +3",
    right_ear="Etiolation Earring",
    lring="Gelatinous Ring +1",
    rring="Defending Ring",
    waist="Flume Belt +1",
    legs="Meg. Chausses +2"
  }
  sets.Regain = {
    lring="Karieyh Ring +1"
  }
  sets.Idle = set_combine(
    sets.modes.Normal.Engaged,
    sets.DamageDown,
    sets.Regain
  )

  -- Shooting
  sets.Preshot = {                           -- Snap | Rapid
    head=augments.taeon.head.shapshot,       --   8    0
    neck="Commodore Charm +1",               --   3
    body="Laksamana's Frac +3",              --   0    18
    hands="Carmine Finger Gauntlets +1",     --   7    10
    legs=augments.adhemar.kecks.rapidShot,   --   9    10
    feet="Meg. Jam. +2",                     --  10    0
    waist="Yemaya Belt",                     --   0    5
    back=gear.camulus.snapShot               --  10    0
                                      -- Total:  47    43
  }
  sets.TripleShot = {
    -- body="Chasseur's Frac"
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    head=augments.herc.head.fc,         -- 12
    neck="Orunmila's Torque",           -- 5
    body="Taeon Tabard",                -- 8
    hands="Leyline Gloves",             -- 7
    lear="Loquacious earring",          -- 2
    rear="Etiolation Earring",          -- 1
    lring="Kishar Ring",                -- 4
    rring="Prolix Ring",                -- 2
    legs=augments.taeon.legs.phalanx,   -- 3
    feet="Carmine Greaves +1"           -- 8
  }
  sets.Magic.SpellInterrupt = {
    -- ammo="Staunch Tathlum +1",          -- 10
    head=augments.taeon.head.SID,    -- 7
    neck="Loricate Torque +1",
    lear="Halasz Earring",           -- 5
    rear="Magnetic earring",         -- 8
    body="Lanun Frac +3",
    hands="Rawhide Gloves",          -- 15
    left_ring="Defending Ring",      -- PDT
    right_ring="Warden's Ring",      -- PDT
    back=gear.camulus.meleeTp,
    waist="Flume Belt +1",
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS.RangedPhys = {
    ammo=gear.bullets.rangedAtt,
    head="Meghanada Visor +2",
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade earring",
    body="Laksamana's Frac +3",
    hands="Meg. Gloves +2",
    lring="Ilabrat Ring", -- Replace w/ Regal Ring
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsPhys,
    waist="Fotia Belt",
    legs="Meg. Chausses +2",
    feet="Lanun Bottes +3"
  }
  sets.WS.RangedMagic = {
    ammo=gear.bullets.magicWs,
    head=augments.herc.head.mab,
    neck="Commodore Charm +1",
    left_ear="Friomisi Earring",
    right_ear="Ishvara Earring",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Karieyh Ring +1",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    waist="Eschan Stone",
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3"
  }
  sets.WS.Melee = {
    head=augments.herc.head.wsd,
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    body="Laksamana's Frac +3",
    hands="Meg. Gloves +2",
    left_ring="Karieyh Ring +1",
    right_ring="Regal Ring",
    back=gear.camulus.meleeWs,
    waist="Prosilio Belt +1",
    legs=augments.herc.legs.ws,
    feet="Lanun Bottes +3"
  }

  -- WS Specific
  sets.WS['Leaden Salute'] = set_combine(sets.WS.RangedMagic, {
    head="Pixie Hairpin +1",
    right_ear="Moonshade Earring",
    lring="Archon Ring",
    waist="Svelt. Gouriz +1"
  })
  sets.WS['Wildfire'] = sets.WS.RangedMagic
  sets.WS['Last Stand'] = sets.WS.RangedPhys
  sets.WS['Detonator'] = sets.WS.RangedPhys
  sets.WS['Slug Shot'] = sets.WS.RangedPhys
  sets.WS['Requiescat'] = sets.WS.Melee
  sets.WS['Savage Blade'] = sets.WS.Melee
  sets.WS['Circle Blade'] = sets.WS.Melee
  sets.WS['Evisceration'] = {
    head=augments.herc.head.reso,
    body=augments.herc.body.reso,
    hands="Meg. Gloves +2",
    legs=augments.herc.legs.ws,
    feet=augments.herc.feet.reso,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Regal Ring",
    back=gear.camulus.meleeWs,
  }
  sets.WS['Aeolian Edge'] = {
    ammo=gear.bullets.quickDraw,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Acumen Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    waist="Eschan Stone",
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3"
  }

  -- Quick Draw
  --
  sets.JAs = {}
  sets.JAs.QuickDrawMab = {
    ammo=gear.bullets.quickDraw,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Arvina Ringlet +1",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3",
    waist="Eschan Stone"
  }
  sets.JAs.QuickDrawAcc = {
    ammo=gear.bullets.quickDraw,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Dignitary's Earring",
    right_ear="Gwati Earring",
    body="Mummu Jacket +2",
    hands="Leyline Gloves ",
    left_ring="Arvina Ringlet +1",
    right_ring="Stikini Ring",
    back=gear.camulus.rangedWsMagic,
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3",
    waist="Eschan Stone"
  }

  -- Job Abilities
  --
  sets.JAs.PhantomRoll = {
    -- ranged = "Compensator",
    head="Lanun Tricorne +1",
    neck="Regal Necklace",
    hands="Chasseur's Gants +1",
    -- rring = "Luzaf's Ring",
    back="Camulus's Mantle",
    legs="Desultor Tassets"
  }
  sets.JAs['Snake Eye'] = { legs = "Lanun Trews" }
  sets.JAs['Random Deal'] = { body = "Lanun Frac +3" }
  sets.JAs['Wild Card'] = { feet = "Lanun Bottes +3" }
  sets.JAs.Waltz = { lring = 'Asklepian Ring' }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
    equip(sets.JAs.PhantomRoll)
    if Luzaf.value then
      equip({rring = "Luzaf's Ring"})
    end
    if Compensator.value
        and player.tp < 1000
        and player.status ~= 'Engaged'
        and spell.type == 'CorsairRoll' then
      equip({ranged = "Compensator"})
    end
    if not spell.interrupted then
      -- display_roll_info(spell)
    end

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.type == 'CorsairShot' then
    if spell.english == 'Light Shot' or spell.english == 'Dark Shot' then
      equip(sets.JAs.QuickDrawAcc)
    else
      equip(sets.JAs.QuickDrawMab)
    end

  elseif spell.english == "Ranged" then
    equip(sets.Preshot)
    equip({ammo = gear.bullets.rangedAtt})

    if buffactive['Triple Shot'] then
      equip(sets.TripleShot)
    end

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)

  elseif spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))

    if spell.english == "Leaden Salute" then
      -- Replace moonshade earring if tp is capped
      if player.tp > 2900 then
        equip({ right_ear="Ishvara Earring" })
      end
      -- Equip elemental obi in dark weather
      if world.weather_element == "Dark" or world.day_element == "Dark" then
        equip({ waist = "Anrin Obi" })
      end
    end
  end
end

function precast_cancelations(spell)
  if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
    send_command('@wait 0.4; cancel 66; cancel 444; cancel 445')
  elseif spell.english == 'Spectral Jig' then
    cast_delay(0.25)
    send_command('@cancel 71;')
  end
end

function midcast(spell)
  if spell.english == 'Ranged' then
    equip(sets.modes[PrimaryMode.current].Ranged)

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end
end

function aftercast(spell)
  if player.in_combat then
    if player.status == 'Engaged' then
      equip(set_for_engaged())
    else
      equip(sets.Idle)
    end
  end
  if Compensator.value and player.equipment.ranged == 'Compensator' then
    equip({ ranged = gear.weapons[Weapons.current] })
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(set_for_engaged())
  else
    equip(sets.Idle)
  end
  if Capacity.value then
    equip(sets.CapacityMantle)
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

  if command == 'run' then
    equip(sets.Idle)
  elseif command == "mode" then
    equip(set_for_engaged())
  elseif command == 'weapon' then
    Weapons:cycle()
    add_to_chat(122, 'SET [Weapon] to ' .. Weapons.current)
    equip({ ranged = gear.weapons[Weapons.current] })
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(set_for_engaged())
  end
end

function set_for_engaged()
  local set = sets.modes[PrimaryMode.current].Engaged
  if DamageDown.value then
    set = set_combine(set, sets.DamageDown)
  end
  return set
end

function set_for_ws(named)
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS
  end
end

function array_contains(arr, value)
  for k, v in pairs(arr) do
    if value == v then
      return true
    end
  end
  return false
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
  rolls = {
    ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
    ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
    ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
    ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
    ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
    ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
    ["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
    ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
    ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
    ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
    ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
    ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
    ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
    ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
    ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
    ["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
    ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
    ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
    ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
    ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
    ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
    ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
    ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
    ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
    ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
    ["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
    ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
    ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
    ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
    ["Runeist's Roll"]   = {lucky=4, unlocky=8, bonus="Magic Evasion"},
  }
end

function display_roll_info(spell)
  rollinfo = rolls[spell.english]
  -- local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

  if rollinfo then
    -- add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
    add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.')
    add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
  end
end