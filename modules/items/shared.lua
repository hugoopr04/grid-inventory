-- Items may point at an export in another resource. If that resource is not
-- installed we must not throw: a missing optional integration should disable
-- just that item, with one clear console warning, instead of erroring every
-- time a player uses it.
local missingExports = {}

local function useExport(resource, export)
	return function(...)
		if GetResourceState(resource) ~= 'started' then
			local key = ('%s.%s'):format(resource, export)

			if not missingExports[key] then
				missingExports[key] = true
				warn(("item export '%s' is unavailable because the resource '%s' is not started")
					:format(key, resource))
			end

			return
		end

		local ok, result = pcall(function(...)
			return exports[resource][export](nil, ...)
		end, ...)

		if not ok then
			warn(("item export '%s.%s' failed: ^1%s^0"):format(resource, export, result))
			return
		end

		return result
	end
end

local ItemList = {}
local isServer = IsDuplicityVersion()

local function setImagePath(path)
    if path then
        return path:match('^[%w]+://') and path or ('%s/%s'):format(client.imagepath, path)
    end
end

-- Default grid sizes for items that don't specify sizeX/sizeY
-- Format: { sizeX, sizeY }
local defaultSizes = {
	-- Bottles & drinks (1x2)
	water = {1,2}, sprunk = {1,2}, mustard = {1,2}, vermouth = {1,2}, Vermouth_dry = {1,2},
	manman_coconut = {1,2}, manman_dragon_fruit = {1,2}, manman_pineapple = {1,2},
	bottle = {1,2}, powerade = {1,2}, gasoline = {1,2}, petrol = {1,2}, petrol_raffin = {1,2},
	casino_coke = {1,2}, casino_sprite = {1,2}, casino_beer = {1,2}, casino_coffee = {1,2},
	casino_ego_chaser = {1,2}, casino_luckypotion = {1,2},
	blood_bag_250 = {1,2}, blood_bag_500 = {1,2}, water_bottle = {1,2},
	disinfectant = {1,2}, acetone = {1,2}, spraycan = {1,2},

	-- Phones & small electronics (2x1)
	phone = {2,1}, burner_phone = {2,1}, simcard = {1,1}, emstablet = {2,1},

	-- Tablets & electronics (2x2)
	tuning_tablet = {2,2}, police_tablet = {2,2}, police_cad = {2,2},
	racingtablet = {2,2}, boostingtablet = {2,2}, ambulance_gps = {2,1},
	hackingdevice = {2,2}, gpshackingdevice = {2,2}, laptop = {3,2},
	harddrive = {2,1}, camera = {2,2}, evidence_camera = {2,2}, instant_camera = {2,2},
	body_cam = {1,1}, gps = {1,1}, snakecam = {2,1}, vehicle_tracker = {1,1},
	fingerprint_scanner = {2,1}, megaphone = {2,2}, breathalyzer = {2,1},
	radiocasete = {2,1}, fire_mdt = {2,2},

	-- Tools (2x1)
	lockpick = {2,1}, screwdriver = {2,1}, handsaw = {2,1}, wirecutters = {2,1},
	pincracker = {2,1}, tools = {2,1}, carotool = {2,1}, fixtool = {2,1},
	drill = {2,2}, cutter = {2,1},

	-- Food items (1x1 default, some bigger)
	burger = {1,1}, pizza_ham_box = {2,2}, pizza_ham_slice = {1,1},
	hotdog_chillicheesedog = {2,1},

	-- Chip bags (1x2)
	chipscheese_new = {1,2}, chipshabanero_new = {1,2}, chipsribs_new = {1,2},

	-- Medical supplies
	medikit = {2,2}, medical_kit = {2,2}, advanced_medical_kit = {2,3},
	medicalbag = {2,2}, medicbag = {2,3}, fixkit = {2,2},
	defibrillator = {2,2}, defibrilator = {2,2}, stretcher = {3,2},
	bandage = {1,1}, suturekit = {1,2}, suture_kit = {1,2}, icepack = {1,2},
	splint = {1,2}, tourniquet = {1,1}, collar_cervical = {2,1},
	crutch = {1,3}, bodybag = {3,2},

	-- Police & tactical
	shield = {3,3}, police_shield = {3,3}, cuffs = {1,1}, handcuffkey = {1,1},
	spikestrip = {3,1}, spike_strip = {3,1}, headbag = {1,1},
	police_rappel = {2,1}, wheel_clamp = {2,2}, police_stormram = {2,2},
	police_diving_suit = {2,3}, jammer = {2,1},
	cable_ties = {1,1}, mouthtape = {1,1},

	-- Armor & vests (2x2)
	armour = {2,3}, vest_normal = {2,3}, vest_strong = {2,3},

	-- Vehicle parts (2x2)
	vehicle_door = {3,2}, vehicle_hood = {3,2}, veh_wheels = {2,2},
	veh_suspension = {2,2}, ['car-battery'] = {2,2}, plate = {2,1},

	-- Radio (2x1)
	radio = {2,1},

	-- Crafting & drugs (1x1 or 1x2)
	cauldron = {2,2}, mixer = {2,2}, press = {2,2},
	meth_cooking_table = {2,2}, meth_oven = {2,2}, coke_oven = {2,2},
	bagging_table = {2,2}, weed_processing_table = {2,2}, cocaine_processing_table = {2,2},
	gazbottle = {1,2}, plant_pot = {2,2}, default_lamp = {2,2},
	watering_can = {1,2}, fertilizer = {1,2}, advanced_fertilizer = {1,2}, liquid_fertilizer = {1,2},
	coke_brick = {2,1},

	-- Explosives
	c4 = {2,1}, c4_bomb = {2,1}, thermite = {2,1}, thermite_bomb = {2,1},
	trojan_usb = {1,1}, nitrous = {2,2},

	-- Clothing items (2x2)
	player_clothes = {2,2}, backpack = {2,3},
	clothes_hat = {2,2}, clothes_tshirt = {2,2}, clothes_torso = {2,2},
	clothes_pants = {2,2}, clothes_shoes = {2,2}, clothes_mask = {2,2},
	clothes_vest = {2,2}, clothes_bag = {2,2}, clothes_arms = {2,2},
	clothes_glasses = {1,1}, clothes_watch = {1,1}, clothes_chain = {1,1},
	clothes_bracelet = {1,1}, clothes_ears = {1,1},

	-- Licenses & cards (1x1)
	identification = {1,1}, mastercard = {1,1}, id_card_f = {1,1},
	secure_card = {1,1}, bankcard = {1,1}, group6card = {1,1},
	paletobankcard = {1,1}, bigbankcard = {1,1}, bankidcard = {1,1},

	-- Fishing (rods 1x3, fish 1x2)
	basic_rod = {1,3}, titanium_rod = {1,3}, graphite_rod = {1,3},
	grouper = {1,2}, haddock = {1,2}, piranha = {1,1}, anchovy = {1,1},
	shark = {2,3}, mahi_mahi = {1,2}, tuna = {1,2}, salmon = {1,2},
	trout = {1,2}, red_snapper = {1,2}, fish = {1,2},

	-- Robbery/heist
	bag = {2,2}, vanDiamond = {1,1},

	-- BBQ
	bbq_grill = {3,2},

	-- Misc large items
	wheelchair = {2,3}, skateboard = {3,2},
	shisha = {2,2}, barrier = {2,2}, roadcone_light = {1,2}, road_cone = {1,2}, consign = {2,1},

	-- Pet items
	petfood = {1,2}, petwaterbottleportable = {1,2}, firstaidforpet = {1,2},
	petgroomingkit = {2,2},

	-- Paper & documents
	invoice = {1,1}, report_evidence = {1,1}, weazelnews_paper = {2,1}, photo = {1,1},
}

---@param data OxItem
local function newItem(data)
	data.weight = data.weight or 0

	if not data.sizeX and not data.sizeY then
		local ds = defaultSizes[data.name]
		if ds then
			data.sizeX = ds[1]
			data.sizeY = ds[2]
		end
	end

	data.sizeX = data.sizeX or 1
	data.sizeY = data.sizeY or 1

	if data.close == nil then
		data.close = true
	end

	if data.stack == nil then
		data.stack = true
	end

	local clientData, serverData = data.client, data.server
	---@cast clientData -nil
	---@cast serverData -nil

	if not data.consume and (clientData and (clientData.status or clientData.usetime or clientData.export) or serverData?.export) then
		data.consume = 1
	end

	if isServer then
        ---@cast data OxServerItem
        serverData = data.server
		data.client = nil

		if not data.durability then
			if data.degrade or (data.consume and data.consume ~= 0 and data.consume < 1) then
				data.durability = true
			end
		end

        if not serverData then goto continue end

        if serverData.export then
            data.cb = useExport(string.strsplit('.', serverData.export))
        end
	else
        ---@cast data OxClientItem
        clientData = data.client
		data.server = nil
		data.count = 0

        if not clientData then goto continue end

        if clientData.export then
            data.export = useExport(string.strsplit('.', clientData.export))
        end

        clientData.image = setImagePath(clientData.image)

        if clientData.propTwo then
            clientData.prop = clientData.prop and { clientData.prop, clientData.propTwo } or clientData.propTwo
            clientData.propTwo = nil
        end
	end

    ::continue::
	ItemList[data.name] = data
end

-- Weapon size overrides (pistols, melee, throwables, heavy weapons)
local weaponSizes = {
	-- Pistols (2x1)
	WEAPON_PISTOL = {2,1}, WEAPON_PISTOL50 = {2,1}, WEAPON_PISTOL_MK2 = {2,1},
	WEAPON_COMBATPISTOL = {2,1}, WEAPON_APPISTOL = {2,1}, WEAPON_HEAVYPISTOL = {2,1},
	WEAPON_SNSPISTOL = {2,1}, WEAPON_SNSPISTOL_MK2 = {2,1}, WEAPON_VINTAGEPISTOL = {2,1},
	WEAPON_CERAMICPISTOL = {2,1}, WEAPON_PISTOLXM3 = {2,1}, WEAPON_GADGETPISTOL = {2,1},
	WEAPON_MARKSMANPISTOL = {2,1}, WEAPON_MACHINEPISTOL = {2,1}, WEAPON_STUNGUN = {2,1},
	WEAPON_FLAREGUN = {2,1}, WEAPON_DOUBLEACTION = {2,1}, WEAPON_NAVYREVOLVER = {2,1},
	WEAPON_REVOLVER = {2,1}, WEAPON_REVOLVER_MK2 = {2,1}, WEAPON_RAYPISTOL = {2,1},
	WEAPON_FN57B = {2,1}, WEAPON_FN57S = {2,1}, WEAPON_FNX45C = {2,1},
	WEAPON_G43XCS = {2,1}, WEAPON_G17P80G5 = {2,1}, WEAPON_G19XB = {2,1},
	WEAPON_G19XS = {2,1}, WEAPON_G45 = {2,1}, WEAPON_G45C = {2,1},
	WEAPON_G19XC = {2,1}, WEAPON_G40C = {2,1}, WEAPON_G19G = {2,1},
	WEAPON_MDC = {2,1}, WEAPON_PSAD = {2,1}, WEAPON_TRIARC = {2,1},
	WEAPON_G19G5C = {2,1}, WEAPON_SIGP320 = {2,1},
	-- SMGs (3x2 - default)
	-- Shotguns (4x2)
	WEAPON_PUMPSHOTGUN = {4,2}, WEAPON_PUMPSHOTGUN_MK2 = {4,2},
	WEAPON_SAWNOFFSHOTGUN = {2,2}, WEAPON_ASSAULTSHOTGUN = {4,2},
	WEAPON_BULLPUPSHOTGUN = {3,2}, WEAPON_COMBATSHOTGUN = {4,2},
	WEAPON_DBSHOTGUN = {3,2}, WEAPON_HEAVYSHOTGUN = {4,2},
	WEAPON_AUTOSHOTGUN = {2,2}, WEAPON_BEANBAGSHOTGUN = {4,2},
	-- Rifles (5x2)
	WEAPON_ASSAULTRIFLE = {5,2}, WEAPON_ASSAULTRIFLE_MK2 = {5,2},
	WEAPON_CARBINERIFLE = {5,2}, WEAPON_CARBINERIFLE_MK2 = {5,2},
	WEAPON_ADVANCEDRIFLE = {4,2}, WEAPON_SPECIALCARBINE = {5,2},
	WEAPON_SPECIALCARBINE_MK2 = {5,2}, WEAPON_BULLPUPRIFLE = {4,2},
	WEAPON_BULLPUPRIFLE_MK2 = {4,2}, WEAPON_COMPACTRIFLE = {3,2},
	WEAPON_MILITARYRIFLE = {5,2}, WEAPON_HEAVYRIFLE = {5,2},
	WEAPON_TACTICALRIFLE = {5,2},
	-- Sniper rifles (5x2)
	WEAPON_SNIPERRIFLE = {5,2}, WEAPON_HEAVYSNIPER = {5,2},
	WEAPON_HEAVYSNIPER_MK2 = {5,2}, WEAPON_MARKSMANRIFLE = {5,2},
	WEAPON_MARKSMANRIFLE_MK2 = {5,2}, WEAPON_PRECISIONRIFLE = {5,2},
	-- MGs (5x2)
	WEAPON_MG = {5,2}, WEAPON_COMBATMG = {5,2}, WEAPON_COMBATMG_MK2 = {5,2},
	WEAPON_GUSENBERG = {5,2},
	-- Heavy weapons (5x3)
	WEAPON_MINIGUN = {5,3}, WEAPON_RAYMINIGUN = {5,3},
	WEAPON_RPG = {5,3}, WEAPON_GRENADELAUNCHER = {5,2},
	WEAPON_HOMINGLAUNCHER = {5,3}, WEAPON_RAILGUN = {5,2},
	WEAPON_RAILGUNXM3 = {5,2}, WEAPON_RAYCARBINE = {4,2},
	WEAPON_COMPACTLAUNCHER = {2,2}, WEAPON_EMPLAUNCHER = {3,2},
	WEAPON_LESSLAUNCHER = {4,2},
	-- Melee (2x1)
	WEAPON_KNIFE = {1,2}, WEAPON_DAGGER = {1,2}, WEAPON_SWITCHBLADE = {1,1},
	WEAPON_MACHETE = {1,3}, WEAPON_BAT = {1,3}, WEAPON_CROWBAR = {1,3},
	WEAPON_GOLFCLUB = {1,3}, WEAPON_POOLCUE = {1,3}, WEAPON_NIGHTSTICK = {1,2},
	WEAPON_HAMMER = {1,2}, WEAPON_HATCHET = {1,2}, WEAPON_STONE_HATCHET = {1,2},
	WEAPON_KNUCKLE = {1,1}, WEAPON_BATTLEAXE = {1,3}, WEAPON_WRENCH = {1,2},
	WEAPON_FLASHLIGHT = {1,2}, WEAPON_CANDYCANE = {1,2}, WEAPON_BOTTLE = {1,2},
	-- Throwables (1x1)
	WEAPON_GRENADE = {1,1}, WEAPON_BZGAS = {1,1}, WEAPON_SMOKEGRENADE = {1,1},
	WEAPON_MOLOTOV = {1,1}, WEAPON_STICKYBOMB = {1,1}, WEAPON_PROXMINE = {1,1},
	WEAPON_PIPEBOMB = {1,1}, WEAPON_BALL = {1,1}, WEAPON_SNOWBALL = {1,1},
	WEAPON_FLARE = {1,1}, WEAPON_FIREWORK = {1,2},
	-- Utility (1x2)
	WEAPON_PETROLCAN = {1,3}, WEAPON_FIREEXTINGUISHER = {1,3},
	WEAPON_HAZARDCAN = {1,3}, WEAPON_FERTILIZERCAN = {1,3},
	WEAPON_METALDETECTOR = {1,3},
}

for type, data in pairs(lib.load('data.weapons') or {}) do
	for k, v in pairs(data) do
		v.name = k
		v.close = type == 'Ammo' and true or false
        v.weight = v.weight or 0

		if type == 'Weapons' then
			---@cast v OxWeapon
			v.model = v.model or k -- actually weapon type or such? model for compatibility
			v.hash = joaat(v.model)
			v.stack = v.throwable and true or false
			v.durability = v.durability or 0.05
			v.weapon = true
			local ws = weaponSizes[k]
			if not v.sizeX and not v.sizeY and ws then
				v.sizeX = ws[1]
				v.sizeY = ws[2]
			end
			v.sizeX = v.sizeX or 3
			v.sizeY = v.sizeY or 2
		else
			v.sizeX = v.sizeX or 1
			v.sizeY = v.sizeY or 1
			v.stack = true
		end

		v[type == 'Ammo' and 'ammo' or type == 'Components' and 'component' or type == 'Tints' and 'tint' or 'weapon'] = true

		if isServer then v.client = nil else
			v.count = 0
			v.server = nil
			local clientData = v.client

			if clientData?.image then
                clientData.image = setImagePath(clientData.image)
			end
		end

		ItemList[k] = v
	end
end

for k, v in pairs(lib.load('data.items') or {}) do
	v.name = k
	local success, response = pcall(newItem, v)

    if not success then
        warn(('An error occurred while creating item "%s" callback!\n^1SCRIPT ERROR: %s^0'):format(k, response))
    end
end

ItemList.cash = ItemList.money

-- Report optional integrations that are not installed, so a fresh install gets
-- one readable summary instead of errors appearing later during play.
CreateThread(function()
	Wait(2000)

	local missing = {}

	for name, item in pairs(ItemList) do
		local def = isServer and item.server or item.client
		local export = type(def) == 'table' and def.export

		if export then
			local resource = string.strsplit('.', export)

			if resource and GetResourceState(resource) ~= 'started' then
				missing[resource] = (missing[resource] or 0) + 1
			end
		end
	end

	if not next(missing) then return end

	local list = {}

	for resource, count in pairs(missing) do
		list[#list + 1] = ('%s (%d item%s)'):format(resource, count, count == 1 and '' or 's')
	end

	table.sort(list)

	warn(('%d optional integration(s) are not installed, so the items using them will do nothing when used: %s')
		:format(#list, table.concat(list, ', ')))
end)

return ItemList
