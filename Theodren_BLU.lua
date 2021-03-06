include('Mote-Mappings.lua')
include('Modes.lua')
include('augments.lua')

function define_modes()
  PrimaryMode = M{['description'] = 'Primary Mode', 'Normal', 'HybridLight', 'HybridHeavy'}
end

function define_binds()
  -- Modes
  send_command("alias g15v2_m1g1 gs c cycle PrimaryMode")
end

function get_sets()

  define_modes()
  define_binds()
  define_blue_magic()

  gear = {
    rosmerta = {
      mab={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
      tp={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
      ws={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
      fast={ name="Rosmerta's Cape", augments={'MND+20','"Fast Cast"+10',}},
    }
  }

  sets.Idle = {
    ammo="Staunch Tathlum +1",         -- 3 DT
    head="Malignance Chapeau",         -- 6 DT
    body="Assimilator's Jubbah +3",    -- Refresh
    hands="Malignance Gloves",          -- 5 DT
    legs="Carmine Cuisses +1",         -- Zoomies
    feet="Malignance Boots",           -- 4 DT
    neck="Loricate Torque +1",         -- 6 DT
    waist="Fucho-no-Obi",              -- Refresh
    left_ear="Eabani Earring",         -- Meva
    right_ear="Etiolation Earring",    -- 3 MDT
    left_ring="Stikini Ring +1",       -- Refresh
    right_ring="Stikini Ring +1",      -- Refresh
    back=gear.rosmerta.tp              -- 10 PDT
  }                                    -- 31 PDT

  -- DW Traits:
  -- Delta Thrust + Barbed Crescent = 1
  -- Molting Plumage = 1
  -- Job Points = 2
  -- Total DW: DW IV
  --
  -- DW gear needed to cap with DW IV:
  -- Haste DW
  -- 0    44
  -- 10   40
  -- 15   37   (Single Haste or March)
  -- 30   26   (Haste II)
  -- Cap  6   (Double March or Haste + March)
  --
  -- Various gear bonuses:
  -- Adhemar Jacket +1: 6 DW
  -- Suppanomimi:       5 DW
  -- Reiki Yotai:       7 DW
  -- Total:             18 DW

  sets.modes = {}
  sets.modes.Normal = {
    ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,
    neck="Mirage Stole +1",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp
  }
  sets.modes.HybridLight = {
    ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
    body="Malignance Tabard",       -- 9 DT
    hands="Adhemar Wristbands +1",  -- 2 PDT
    legs="Samnuha Tights",
    feet=augments.herc.feet.triple,    -- 2 PDT
    neck="Mirage Stole +1",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",        -- 10 DT
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp              -- 10 PDT
  }                                    -- 33 PDT
  sets.modes.HybridHeavy = {
    ammo="Aurgelmir Orb +1",
    head="Malignance Chapeau",         -- 6 DT
    body="Malignance Tabard",          -- 9 DT
    hands="Malignance Gloves",         -- 5 DT
    legs="Malignance Tights",          -- 7 DT
    feet="Malignance Boots",           -- 4 DT
    neck="Mirage Stole +1",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",        -- 10 DT
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp              -- 10 PDT
  }                                    -- 51 PDT

  -- JAs
  sets.JAs = {}
  sets.JAs.Provoke = { -- Enmity+ Set
    ammo="Sapience Orb",
    body="Emet Harness +1",
    waist="Kasiri Belt",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Supershear Ring",
    right_ring="Eihwaz Ring",
  }

  -- Magic
  sets.Magic = {}
  sets.Magic.FastCast = {
    ammo="Impatiens",             -- 2 Quick
    head=augments.herc.head.fc,   -- 12
    neck="Orunmila's Torque",     -- 5
    lear="Loquacious earring",    -- 2
    rear="Etiolation Earring",    -- 1
    body="Taeon Tabard",          -- 9
    hands="Leyline Gloves",       -- 7
    left_ring="Kishar Ring",      -- 4
    right_ring="Weatherspoon Ring +1",      -- 2
    back=gear.rosmerta.fast,      -- 10
    waist="Witful Belt",          -- 3, 3 Quick
    legs="Aya. Cosciales +2",     -- 6
    feet="Carmine Greaves +1"     -- 8
                                  -- 65 FastCast, 6 QuickCast
  }
  sets.Magic.SpellInterrupt = {
    ammo="Staunch Tathlum +1",       -- 11
    head="Aya. Zucchetto +2",        -- PDT
    neck="Loricate Torque +1",       -- DT
    lear="Odnowa Earring +1",        -- MDT/HP
    rear="Magnetic Earring",         -- 8
    body="Malignance Tabard",        -- PDT
    hands="Rawhide Gloves",          -- 15
    left_ring="Defending Ring",      -- DT
    right_ring="Gelatinous Ring +1", -- PDT
    back=gear.rosmerta.tp,           -- PDT
    waist="Rumination Sash",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
                                     -- 8 Merit
                                     -- 81 Total
  }

  -- Blue Magic
  sets.BlueMagic = {}
  sets.BlueMagic.Macc = {
    ammo="Pemphredo Tathlum",
    head="Amalric Coif +1",
    body="Amalric Doublet +1",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.rosmerta.mab
  }
  sets.BlueMagic.Mab = {
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    legs="Amalric Slops +1",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Stikini Ring +1",
    back=gear.rosmerta.mab -- INT/MAB/Macc/Mdmg
  }
  sets.BlueMagic.Physical = {
    -- ammo="Falcon Eye", -- Stored
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Caro Necklace",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Dignitary's Earring",
    left_ring="Ilabrat Ring",
    right_ring="Shukuyu Ring",
    back=gear.rosmerta.ws
  }
  sets.BlueMagic.Healing = {
    -- ammo="Quartz Tathlum +1",        -- MND
    head="Aya. Zucchetto +2",        -- MND/VIT
    body="Vrikodara Jupon",          -- 13%
    hands="Telchine Gloves",         -- 18%
    legs="Psycloth Lappas",          -- 36 MND
    feet="Medium's Sabots",          -- 10%
    neck="Phalaina Locket",          -- 4%
    waist="Luminary Sash",           -- MND
    left_ear="Regal Earring",        -- MND
    right_ear="Mendi. Earring",      -- 5%
    left_ring="Stikini Ring +1",     -- 11 skill 8 MND
    right_ring="Stikini Ring +1",    -- 11 skill 8 MND
    back=gear.rosmerta.fast,         -- MND
                             -- Total: +50% Cure Potency
  }
  sets.BlueMagic.HealingSelf = set_combine(sets.BlueMagic.Healing, {
    neck="Phalaina Locket",      -- 4% self
    left_ring='Kunaji Ring',     -- 5% self
    waist="Gishdubar Sash"       -- 10% self
                                 -- Total: 19%
  })
  sets.BlueMagic['White Wind'] = {
    -- ammo="Falcon Eye",            -- 10 HP, Stored
    head="Carmine Mask +1",          -- 118 HP
    body="Vrikodara Jupon",          -- 13%
    hands="Telchine Gloves",         -- 18%
    legs="Carmine Cuisses +1",       -- 130 HP
    feet="Medium's Sabots",          -- 10%
    neck="Phalaina Locket",          -- 4%  4% self
    waist="Gishdubar Sash",          --     10% self
    left_ear="Odnowa Earring +1",    -- 100 HP
    right_ear="Mendi. Earring",      -- 5%
    left_ring="Kunaji ring",         --     5% self
    right_ring="Ilabrat Ring",       -- 60 HP
    back=gear.rosmerta.fast
    -- back="Aenoth. Mantle +1"         -- 120 HP  -- Moonbeam Cape 250 HP
                             -- Total: 50% Cure Potency
                             --        19% Self
  }
  sets.BlueMagic['Battery Charge'] = {
    head="Amalric Coif +1",
    waist="Gishdubar Sash"
  }
  sets.BlueMagic['Tenebral Crush'] = set_combine(sets.BlueMagic.Mab, {
    head="Pixie Hairpin +1",
    right_ring="Archon Ring"
  })
  sets.BlueMagic['Dream Flower'] = {
    ammo="Staunch Tathlum +1",       -- 11
    head="Malignance Chapeau",
    neck="Loricate Torque +1",       -- DT
    -- left_ear="Genmei Earring",
    right_ear="Magnetic Earring",    -- 8
    body="Malignance Tabard",
    hands="Malignance Gloves",
    left_ring="Defending Ring",      -- DT
    right_ring="Gelatinous Ring +1", -- PDT
    back=gear.rosmerta.mab,
    waist="Rumination Sash",         -- 10
    legs="Carmine Cuisses +1",       -- 20
    feet=augments.taeon.feet.phalanx -- 9
                                     -- 8 Merit
                                     -- 81 Total
  }
  sets.BlueMagic.Jettatura = sets.JAs.Provoke
  sets.BlueMagic.Diffusion = {
    feet="Luhlaza Charuqs"
  }

  -- Weapon Skills
  --
  sets.WS = {}
  sets.WS['Savage Blade'] = {
    ammo="Aurgelmir Orb +1",
    head=augments.herc.head.wsStr,
    neck="Mirage Stole +1",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    body="Assimilator's Jubbah +3",
    hands="Jhakri Cuffs +2",
    left_ring="Epaminondas's Ring",
    right_ring="Shukuyu Ring",
    back=gear.rosmerta.ws,
    waist="Sailfi Belt +1",
    legs=augments.herc.legs.wsDex,
    feet="Jhakri Pigaches +2",
  }
  sets.WS['Requiescat'] = {}
  sets.WS['Chant du Cygne'] = {
    ammo="Yetshila +1",
    head="Adhemar Bonnet +1",
    body="Ayanmo Corazza +2",
    hands="Jhakri Cuffs +2",
    legs="Samnuha Tights",
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Brutal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back=gear.rosmerta.tp
  }
  sets.WS['Shining Blade'] = {}
  sets.WS['Circle Blade'] = {}
  sets.WS['Burning Blade'] = {}
  sets.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    neck="Sanctity Necklace",
    lear="Regal Earring",
    rear="Friomisi earring",
    body="Amalric Doublet +1",
    hands="Jhakri Cuffs +2",
    lring="Archon Ring",
    rring="Epaminondas's Ring",
    back=gear.rosmerta.mab,
    waist="Orpheus's Sash",
    legs="Amalric Slops +1",
    feet="Jhakri Pigaches +2",
  }

  -- Spell Learning
  -- sets.learn={
  --   main="Wax Sword",
  --   ammo="Staunch Tathlum +1",
  --   hands="Magus Bazubands",
  --   neck="Loricate Torque +1",
  --   waist="Flume Belt +1",
  --   left_ear="Brutal Earring",
  --   right_ear="Telos Earring",
  --   left_ring="Ayanmo Ring",
  --   right_ring="Defending Ring",
  --   back="Solemnity Cape",
  -- }
end

function precast(spell)
  precast_cancelations(spell)

  if spell.type == 'WeaponSkill' then
    equip(set_for_ws(spell.english))

  elseif sets.JAs[spell.english] then
    equip(sets.JAs[spell.english])

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.FastCast)
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
  if sets.BlueMagic[spell.english] then
    equip(sets.BlueMagic[spell.english])

  elseif BlueMagic_Macc:contains(spell.english) then
    equip(sets.BlueMagic.Macc)

  elseif BlueMagic_Mab:contains(spell.english) then
    equip(sets.BlueMagic.Mab)

  elseif BlueMagic_Physical:contains(spell.english) then
    equip(sets.BlueMagic.Physical)

  elseif BlueMagic_Healing:contains(spell.english) then
    if spell.target.type == 'SELF' then
      equip(sets.BlueMagic.HealingSelf)
    else
      equip(sets.BlueMagic.Healing)
    end

  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.BlueMagic.Macc)

  elseif spell.action_type == 'Magic' then
    equip(sets.Magic.SpellInterrupt)
  end

  if buffactive['Diffusion'] and spell.target.type == 'SELF' then
    equip(sets.BlueMagic.Diffusion)
  end
end

function aftercast(spell)
  equip(set_for_current_mode())
end

function status_change(new, old)
  equip(set_for_current_mode())
end

function set_for_current_mode()
  if player.status=='Engaged' then
    return sets.modes[PrimaryMode.current]
  else
    return sets.Idle
  end
end

function set_for_ws(named)
  if sets.WS[named] then
    return sets.WS[named]
  else
    return sets.WS['Savage Blade']
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
    equip(sets.modes[PrimaryMode.current])
  elseif command == 'cycle' then
    local mode = _G[commandArgs[2]]
    if mode ~= nil and mode._class == 'mode' then
      mode:cycle()
      add_to_chat(122, 'SET [' .. mode.description .. '] to ' .. mode.current)
    end
    equip(sets.modes[PrimaryMode.current])
  end
end

function define_blue_magic()
  BlueMagic_Macc = S{
    'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
    'Thunderbolt','Whirl of Rage',
    '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
    'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
    'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
    'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
    'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
    'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
    'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
    'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'
  }

  BlueMagic_Mab = S{
    'Acrid Stream','Dark Orb','Droning Whirlwind','Embalming Earth','Evryone. Grudge',
    'Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer',
    'Regurgitation','Rending Deluge','Tem. Upheaval','Thermal Pulse','Water Bomb','Subduction','Retinal Glare',
    'Searing Tempest','Spectral Floe','Silent Storm','Entomb','Anvil Lightning','Scouring Spate',
    'Blinding Fulgor','Tenebral Crush','Diffusion Ray',
    'Bad Breath','Flying Hip PrePress','Final Sting','Frost Breath','Heat Breath',
    'Magnetite Cloud','Poison Breath','Radiant Breath','Self Destruct','Thunder Breath',
    'Wind Breath'
  }

  BlueMagic_Physical = S{
    'Asuran Claws','Bludgeon','Feather Storm','Mandibular Bite',
    'Queasyshroom','Ram Charge', 'Spinal Cleave','Spiral Spin','Terror Touch',
    'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
    'Heavy Strike','Quadrastrike','Uppercut','Tourbillion','Vertical Cleave',
    'Whirl of Rage', 'Power Attack', 'Smite of Rage', 'Screwdriver',
    'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
    'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
    'Vanity Dive','Sinker Drill', 'Sickle Slash',
    'Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Quad. Continuum',
    'Sprout Smack', 'Body Slam',
    'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb',
    'Wild Oats'
  }

  BlueMagic_Healing = S{
    'Healing Breeze','Plenilune Embrace','Pollen','White Wind',
    'Wild Carrot','Restoral','Magic Fruit'}
end
