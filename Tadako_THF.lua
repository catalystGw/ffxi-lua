include('Modes.lua')
include('augments_tadako.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'Hybrid', 'FullTH'}
  Capacity = M(false, 'Capacity Mantle')
end

function define_aliases()
  -- Self Buffs
  send_command('bind !f5 stoneskin')
  send_command('bind !f6 phalanx')
  send_command('bind !f7 blink')
  send_command('bind !f8 aquaveil')
  send_command("alias g15v2_m2g1 gs c cycle PrimaryMode")
end

function get_sets()
  define_modes()
  define_aliases()

  gear = {
    toutatis = {
      tp={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
      ws={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      magic={ name="Toutatis's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
    }
  }

  -- Modes
  sets.Engaged = {}
  sets.Engaged.Normal = {
    main="Aeneas",
    sub="Sandung",
    ranged="Exalted Crossbow +1",
    ammo="Gashing Bolt",
    head="Skormoth Mask",
    body="Pillager's Vest +3",
    hands=augments.herc.hands.tp,
    legs="Samnuha Tights",
    feet=augments.herc.feet.tp,
    neck="Anu Torque",
    waist="Sarissapho. Belt",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back=gear.toutatis.tp
  }
  sets.Engaged.Hybrid = {
    main="Aeneas",
    sub="Sandung",
    ranged="Exalted Crossbow +1",
    ammo="Gashing Bolt",
    head="Skormoth Mask",
    body="Pillager's Vest +3",
    hands=augments.herc.hands.tp,
    legs="Meg. Chausses +2",
    feet=augments.herc.feet.tp,
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Gelatinous Ring +1",
    back=gear.toutatis.tp,
  }
  sets.Engaged.FullTH = {
    main="Aeneas",
    sub="Sandung",
    ranged="Exalted Crossbow +1",
    ammo="Gashing Bolt",
    head="Skormoth Mask",
    body="Pillager's Vest +3",
    hands="Plunderer's Armlets +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.tp,
    neck="Anu Torque",
    waist="Chaac Belt",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",
    back=gear.toutatis.tp
  }
  sets.Idle = {
    feet="Fajin Boots"
  }

  -- Weapon Skills
  sets.WS = {}
  sets.WS.Rudra = {
    head=augments.herc.head.ws,
    body="Plunderer's Vest +3",
    hands="Meg. Gloves +2",
    legs=augments.herc.legs.crit,
    feet=augments.herc.feet.crit,
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ramuh Ring",
    right_ring="Apate Ring",
    back=gear.toutatis.ws,
  }
  sets.WS.Evisceration = {
    head="Adhemar bonnet",
    body=augments.herc.body.ws,
    hands="Mummu wrists +2",
    legs=augments.herc.legs.crit,
    feet=augments.herc.feet.crit,
    neck="Soil Gorget",
    waist="Shadow Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Mummu Ring",
    right_ring="Apate Ring",
    back=gear.toutatis.ws,
  }
  sets.WS['Aeolian Edge'] = {
    head=augments.herc.head.magic,
    body=augments.herc.body.magic,
    hands=augments.herc.hands.magic,
    legs=augments.herc.legs.magic,
    feet=augments.herc.feet.magic,
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Vertigo Ring",
    right_ring="Acumen Ring",
    back=gear.toutatis.magic,
  }

  -- Abilities
  sets.JobAbility = {}
  sets.Preshot = {
    -- head="Taeon Chapeau",
    body="Pursuer's Doublet",
    -- hands="Taeon Gloves",
    -- legs="Adhemar Kecks",
    feet="Meg. Jam. +1",
    -- waist="Yemaya Belt",
    -- back="Toutatis's Cape"
  }
  sets.Ranged = {
    head="Mummu Bonnet +1",
    body="Mummu Jacket +1",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Mummu Ring",
    right_ring="Petrov Ring",
    back=gear.toutatis.tp
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.Precast = {
    body="Samnuha Coat",
    hands="Leyline Gloves",
    neck="Orunmila's torque",
    left_ring="Weatherspoon Ring",
    left_ear="Loquacious earring",
    right_ear="Etiolation Earring"
  }
  sets.Magic.SpellInterrupt = {
  }
end

function precast(spell)
  if spell.type == 'JobAbility' then
    equip(sets.JobAbility[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.Precast)

  elseif spell.type == 'WeaponSkill' then
    equip(sets.WS[spell.english] or sets.WS.Rudra)

  elseif spell.english == "Ranged" then
    equip(sets.Preshot)
  end

  precast_cancelations(spell)
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
  if player.status=='Engaged' then
    equip(sets.Engaged[PrimaryMode.current])
  end
end

function status_change(new, old)
  if new == 'Resting' then
    equip(sets.Resting)
  elseif new == 'Engaged' then
    equip(sets.Engaged[PrimaryMode.current])
  else
    equip(set_combine(
      equip(sets.Engaged[PrimaryMode.current]),
      sets.Idle
    ))
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
    -- if player.status=='Engaged' then
      equip(sets.Engaged[PrimaryMode.current])
    -- else
    --   equip(sets.Idle)
    -- end
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
      equip(sets.Engaged[mode.current])
    end
  elseif command == 'idle' then
    equip(sets.Idle)
  end
end
