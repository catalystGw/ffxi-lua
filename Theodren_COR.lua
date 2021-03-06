include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')
include('utils.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy',
  -- 'Odyssey'
  }
  Weapons = M{
    ['description'] = 'Weapons',
    'DeathPenalty',
    'Fomalhaut',
    'Anarchy'
  }
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
  send_command("alias g15v2_m1g4 gs c weapon")
end

function define_gear()

end

function get_sets()

  define_modes()
  define_binds()

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
      Fomalhaut = "Fomalhaut",
      Anarchy = "Anarchy +2",
      DeathPenalty = "Death Penalty"
    },
    bullets = {
      ratt = "Chrono Bullet",
      magic = "Living Bullet"
    }
  }

  sets.Idle = {
    head="Malignance Chapeau",        -- 6 DT
    body="Malignance Tabard",         -- 9 DT
    hands="Malignance Gloves",        -- 5 DT
    legs="Carmine Cuisses +1",
    feet="Malignance Boots",          -- 4 DT
    neck="Loricate Torque +1",        -- 6 DT
    waist="Flume Belt +1",            -- 4 PDT
    left_ear="Etiolation Earring",    -- 3 MDT
    right_ear="Odnowa Earring +1",    -- 2 MDT
    left_ring="Defending Ring",       -- 10 DT
    right_ring="Purity Ring",         -- 4 MDT, 10 Meva
    back=gear.camulus.meleeTp,        -- 10 PDT
  }                                   --
  sets.modes = {}
  sets.modes.Normal = {
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Epona's Ring",
    back=gear.camulus.meleeTp,
  }
  sets.modes.HybridLight = {
    head="Malignance Chapeau",        -- 6 DT
    body="Adhemar Jacket +1",
    hands="Adhemar Wristbands +1", -- 2 PDT
    legs="Meg. Chausses +2",
    feet="Malignance Boots",          -- 4 DT
    neck="Loricate Torque +1",        -- 6 DT
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",       -- 10 DT
    right_ring="Epona's Ring",
    back=gear.camulus.meleeTp,        -- 10 PDT
  }                                   -- 33 PDT | 31 MDT
  sets.modes.HybridHeavy = {
    head="Malignance Chapeau",        -- 6 DT
    body="Malignance Tabard",         -- 9 DT
    hands="Malignance Gloves",        -- 5 DT
    legs="Malignance Tights",         -- 7 DT
    feet="Malignance Boots",          -- 4 DT
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",        -- 10 DT
    right_ring="Epona's Ring",
    back=gear.camulus.meleeTp,        -- 10 PDT
  }                                   -- 52 PDT | 47 MDT
                                      -- Lanun knife provides +4/roll if equipped
  sets.modes.Odyssey = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet=augments.herc.feet.th2,
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",
    right_ring="Epona's Ring",
    back=gear.camulus.meleeTp,
  }

  -- Shooting
  sets.Preshot = {                           -- Snap | Rapid
    ammo=gear.bullets.ratt,
    head=augments.taeon.head.snapshot,       --   10   0
    neck="Commodore Charm +1",               --   3
    body="Laksamana's Frac +3",              --   0    18
    hands="Carmine Finger Gauntlets +1",     --   8    11
    legs="Adhemar Kecks",                    --   9    10
    feet="Meg. Jam. +2",                     --  10    0
    waist="Yemaya Belt",                     --   0    5
    back=gear.camulus.snapShot               --  10    0
                                      -- Total:  50    44
  }
  sets.TripleShot = set_combine(sets.Preshot, {
    body="Chasseur's Frac +1",
    hands="Lanun Gants +3"
  })
  sets.Ranged = {
    ammo=gear.bullets.ratt,
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedTp
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    head=augments.herc.head.fc,         -- 12
    neck="Orunmila's Torque",           -- 5
    body="Taeon Tabard",                -- 9
    hands="Leyline Gloves",             -- 7
    lear="Etiolation earring",          -- 1
    rear="Loquacious Earring",          -- 2
    lring="Kishar Ring",                -- 4
    rring="Weatherspoon Ring +1",                 -- 2
    legs=augments.taeon.legs.phalanx,   -- 4
    feet="Carmine Greaves +1"           -- 8
  }                                     -- 54
  sets.Magic.SpellInterrupt = {
    head=augments.taeon.head.SID,
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Carmine Cuisses +1",
    feet=augments.taeon.feet.phalanx,
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Magnetic Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back=gear.camulus.meleeTp
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS['Last Stand'] = {
    ammo=gear.bullets.ratt,
    head="Lanun Tricorne +3",
    body="Laksamana's Frac +3",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Lanun Bottes +3",
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back=gear.camulus.rangedWsPhys,
    waist="Fotia Belt"
  }
  sets.WS['Leaden Salute'] = {
    ammo=gear.bullets.magic,
    head="Pixie Hairpin +1",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3",
    neck="Commodore Charm +1",
    -- waist="Svelt. Gouriz +1",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Archon Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic
  }
  sets.WS['Wildfire'] = {
    ammo=gear.bullets.magic,
    head=augments.herc.head.mab,
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3",
    neck="Commodore Charm +1",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic
  }
  sets.WS['Savage Blade'] = {
    head=augments.herc.head.wsStr,
    neck="Fotia Gorget",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    body="Laksamana's Frac +3",
    hands="Meg. Gloves +2",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back=gear.camulus.meleeWs,
    waist="Sailfi Belt +1",
    legs=augments.herc.legs.wsDex,
    feet="Lanun Bottes +3"
  }
  sets.WS['Aeolian Edge'] = {
    ammo=gear.bullets.magic,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Shiva Ring +1",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    waist="Orpheus's Sash",
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3"
  }
  sets.WS['Detonator'] = sets.WS['Last Stand']
  sets.WS['Slug Shot'] = sets.WS['Last Stand']
  sets.WS['Requiescat'] = sets.WS['Savage Blade']
  sets.WS['Circle Blade'] = sets.WS['Savage Blade']
  sets.WS['Evisceration'] = sets.WS['Savage Blade']

  -- Quick Draw
  --
  sets.JAs = {}
  sets.JAs.QuickDrawMab = {
    ammo=gear.bullets.magic,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    left_ear="Friomisi Earring",
    right_ear="Dignitary's Earring",
    body="Lanun Frac +3",
    hands="Carmine Fin. Ga. +1",
    left_ring="Shiva Ring +1",
    right_ring="Dingir Ring",
    back=gear.camulus.rangedWsMagic,
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3",
    waist="Eschan Stone"
  }
  sets.JAs.QuickDrawAcc = {
    ammo=gear.bullets.magic,
    head=augments.herc.head.mab,
    neck="Sanctity Necklace",
    -- left_ear="Gwait Earring",
    right_ear="Dignitary's Earring",
    body="Lanun Frac +3",
    hands="Leyline Gloves ",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.camulus.rangedWsMagic,
    legs=augments.herc.legs.magic,
    feet="Lanun Bottes +3",
    waist="Eschan Stone"
  }

  -- Job Abilities
  --
  sets.JAs.PhantomRoll = {
    -- ranged="Compensator",
    head="Lanun Tricorne +3",
    neck="Regal Necklace",
    hands="Chasseur's Gants +1",
    rring="Luzaf's Ring",
    back="Camulus's Mantle",
    legs="Desultor Tassets"
  }
  sets.JAs['Snake Eye'] = { legs = "Lanun Trews" }
  sets.JAs['Random Deal'] = { body = "Lanun Frac +3" }
  sets.JAs['Wild Card'] = { feet = "Lanun Bottes +3" }

  sets.Doom = {
    neck="Nicander's Necklace",
    left_ring="Purity Ring",
    right_ring="Blenmot's Ring",
    waist="Gishdubar Sash"
  }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'CorsairRoll' then
    equip(sets.JAs.PhantomRoll)
    if spell.english == "Tactician's Roll" then
      equip({ body="Chasseur's Frac +1" })
    end

  elseif spell.english == "Double-Up" then
    equip({ rring="Luzaf's Ring" })

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.type == 'CorsairShot' then
    if spell.english == 'Light Shot' or spell.english == 'Dark Shot' then
      equip(sets.JAs.QuickDrawAcc)
    else
      equip(sets.JAs.QuickDrawMab)
      equip_elemental_waist(spell)
    end

  elseif spell.english == "Ranged" then
    if buffactive['Triple Shot'] then
      equip(sets.TripleShot)
    else
      equip(sets.Preshot)
    end

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english])

    if spell.english == "Leaden Salute" or
       spell.english == "Wildfire" or
       spell.english == "Aeolian Edge" then
       equip_elemental_waist(spell)
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
    equip(sets.Ranged)

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end
end

function aftercast(spell)
  if player.status == 'Engaged' then
    equip(set_for_engaged())
  else
    equip(sets.Idle)
  end
end

function status_change(new, old)
  if new == 'Engaged' then
    equip(set_for_engaged())
  else
    equip(sets.Idle)
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
  return sets.modes[PrimaryMode.current]
end
