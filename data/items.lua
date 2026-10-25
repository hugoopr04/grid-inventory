return {
	
	['black_money'] = {
		label = 'Dirty Money',
		sizeX = 1,
		sizeY = 1,
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['formulariosico'] = {
		label = 'Formulario SICO',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		client = {
			event = 'sa_utils:sicoform:open'
		}
	},

	['pasta_butanesa'] = {
		label = 'Pasta Butanesa',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			usetime = 2500,
		},
	},

	['bistec'] = {
		label = 'Bistec',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			usetime = 2500,
		},
	},

	['patatas_fritas'] = {
		label = 'Patatas Fritas',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			usetime = 2500,
		},
	},

	['helado'] = {
		label = 'Helado',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			usetime = 2500,
		},
	},

	['torta_helada'] = {
		label = 'Torta Helada',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			usetime = 2500,
		},
	},


	['salsa_blanca'] = {
		label = 'Salsa Blanca',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			usetime = 2500,
		},
	},

	['tinto'] = {
		label = 'Tinto',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			usetime = 2500,
		},
	},

		['vino_blanco'] = {
		label = 'Vino Blanco',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			usetime = 2500,
		},
	},

		['margarita'] = {
		label = 'Margarita',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			usetime = 2500,
		},
	},

		['vodka_shot'] = {
		label = 'Vodka Shot',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			usetime = 2500,
		},
	},

		['blackbeer'] = {
		label = 'Cerveza Negra',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			usetime = 2500,
		},
	},

		['noalcoholbeer'] = {
		label = 'Cerveza sin alcohol',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			usetime = 2500,
		},
	},

	['gunkit'] = {
		label = 'Kit de limpieza de armas',
		weight = 500,
		sizeX = 1,
		sizeY = 2,
		stack = false,
		client = {
			event = 'sa_utils:gunrestore:open'
		}
	},

	['invoice'] = {
		label = 'Factura',
		weight = 1,
		sizeX = 2,
		sizeY = 1,
		stack = false,
		consume = 0,
		buttons = {
			{
				label = 'Ver Factura',
				action = function(slot)
					TriggerServerEvent('comercios:useInvoiceItem', slot)
				end
			},

		},

	},
	
	["spraycloth"] = {
	    label = "Trapo",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true
	},


	['truckerbox'] = {
    	label = 'Caja de reparto',
    	weight = 1000,
    	sizeX = 3,
    	sizeY = 2,
    	stack = false,
    	close = true,
    	description = 'Caja de cartón para transportar mercancía de camionero.',
		buttons = {
        	{
				label = 'Abrir caja',
				action = function(slot)
					TriggerServerEvent('nr-truckerjob:server:useBox', slot)
				end
			}
    	}
	},


	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		sizeX = 3,
		sizeY = 3,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
		sizeX = 1,
		sizeY = 1,
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		sizeX = 1,
		sizeY = 1,
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		sizeX = 1,
		sizeY = 1,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
		sizeX = 1,
		sizeY = 1,
		consume = 0,
		client = {
			export = 'RAGE_CarLock.UseLockpick'
		}
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
		sizeX = 1,
		sizeY = 1,
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Botella de Agua',
		weight = 500,
		sizeX = 1,
		sizeY = 2,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		sizeX = 1,
		sizeY = 1,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
		sizeX = 1,
		sizeY = 1,
	},

	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Bread",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Tools",
		weight = 2,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Cloth",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Copper",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Fish",
		weight = 1,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Repair Kit",
		weight = 3,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Repair Tools",
		weight = 2,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Gas Bottle",
		weight = 2,
		sizeX = 2,
		sizeY = 3,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Medikit",
		weight = 2,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Chicken fillet",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Packaged wood",
		weight = 1,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Processed oil",
		weight = 1,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Stone",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Washed stone",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Wood",
		weight = 1,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
	},

	['medicalbag'] = {
    	label = 'Bolsa Médica',
    	weight = 220,
		sizeX = 2,
		sizeY = 2,
    	stack = true,
    	description = "Kit médico para emergencias.",
	},

	['bandage'] = {
	    label = 'Venda',
	    weight = 100,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    description = "Una venda simple para curar heridas.",
	},

	['defibrillator'] = {
	    label = 'Desfibrilador',
	    weight = 100,
		sizeX = 2,
		sizeY = 2,
	    stack = true,
	    description = "Aparato para usar en caso de infarto o paro cardiaco.",
	},

	['tweezers'] = {
	    label = 'Pinzas',
	    weight = 100,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    description = "Pinzas de precisión para sacar balas u objetos afilados.",
	},

	['burncream'] = {
	    label = 'Crema para quemaduras',
	    weight = 100,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    description = "Crema especializada para la curación de quemaduras.",
	},

	['suturekit'] = {
	    label = 'Kit de sutura',
	    weight = 100,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    description = "Kit que contiene los materiales necesarios para la .",
	},

	['icepack'] = {
	    label = 'Bolsa de Hielo',
	    weight = 200,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    description = "Usada para calmar hinchazón.",
	},

	['stretcher'] = {
	    label = 'Camilla',
	    weight = 200,
		sizeX = 3,
		sizeY = 4,
	    stack = true,
	    description = "Camilla para transportar heridos.",
	},

	['emstablet'] = {
	    label = 'Ems tablet',
	    weight = 200,
		sizeX = 2,
		sizeY = 2,
	    stack = true,
	},

	["shield"] = {
        label = "Police shield",
        weight = 8000,
		sizeX = 2,
		sizeY = 3,
        stack = false,
        consume = 0,
        client = {
            export = "ND_Police.useShield",
            add = function(total)
                if total > 0 then
                        pcall(function() return exports["ND_Police"]:hasShield(true) end)
                    end
                end,
            remove = function(total)
                if total < 1 then
                    pcall(function() return exports["ND_Police"]:hasShield(false) end)
                end
            end
        }
    },
    ["spikestrip"] = {
        label = "Spikestrip",
        weight = 500,
		sizeX = 2,
		sizeY = 2,
        client = {
            export = "ND_Police.deploySpikestrip"
        }
    },
    ["cuffs"] = {
        label = "Handcuffs",
        weight = 150,
		sizeX = 1,
		sizeY = 1,
        client = {
            export = "ND_Police.cuff"
        }
    },
    ["zipties"] = {
        label = "Zipties",
        weight = 10,
		sizeX = 1,
		sizeY = 1,
        client = {
            export = "ND_Police.ziptie"
        }
    },
    ["tools"] = {
		label = "Tools",
        description = "Can be used to hotwire vehicles.",
		weight = 800,
		sizeX = 1,
		sizeY = 2,
		consume = 1,
        stack = true,
        close = true,
		client = {
            export = "ND_Core.hotwire",
            event = "ND_Police:unziptie"
		}
	},
    ["handcuffkey"] = {
        label = "Handcuff key",
        weight = 10,
		sizeX = 1,
		sizeY = 1,
        client = {
            export = "ND_Police.uncuff"
        }
    },
    ["casing"] = {
        label = "Bullet Casing",
		sizeX = 1,
		sizeY = 1,
    },
    ["projectile"] = {
        label = "Projectile",
		sizeX = 1,
		sizeY = 1,
    },

	['tuning_tablet'] = {
		label = 'Tuning Tablet',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = false,
	},

	['police_tablet'] = {
		label = 'Police Tablet',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = false,
	},

	['usb_tuning'] = {
		label = 'USB Tuning',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['suspension_controller'] = {
		label = 'Suspension Controller',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['meat3'] = {
		label = 'Carne Deshilachada',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['taco_shell'] = {
		label = 'Tortilla de maíz',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	["taco_beef"] = {
	    label = "Taco de res",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true,
		buttons = {
			{
				label = 'Consumir',
				action = function(slot)
					TriggerEvent("sa_utils:client:consumeItem", "eat", "prop_taco_01", slot, 5)
				end
			},
		},
	},

	['police_cad'] = {
		label = 'Tablet de Servicio',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = false,
	},

	["cigarette"] = {
		label = "Cigarrillo",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'ng_proc_cigarette01a') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'ng_proc_cigarette01a') end }
		},
	},

	["cigarettes_redwood"] = {
		label = "Cigarettes Redwood",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		buttons = {
			{
				label = 'Dividir',
				action = function(slot)
					TriggerServerEvent('NR-items:server:splitItem', slot, 'cigarette', 21)
				end
			},

		},
	},

	
	["burner_phone"] = {
	    label = "Teléfono desechable",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = false,
	    close = true,
		client = {
			export = 'nr_ilegalphone.OpenPhone'
		}
	},

	['collar_cervical'] = {
		label = "Collar Cervical",
		weight = 500,
		sizeX = 1,
		sizeY = 2,
		stack = false,
		close = false,
		buttons = {
			{
				label = 'Ponerte el collar',
				action = function(slot)
					TriggerEvent('nr-collar:applyCollarSelf')
				end
			},
			{
				label = 'Poner a jugador cercano',
				action = function(slot)
					TriggerEvent('nr-collar:applyCollarOnPlayer')
				end
			},
		},
	},

	["id_card_f"] = {
	    label = "Id Card",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true
	},

	["secure_card"] = {
	    label = "Security Card",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true
	},

	["vermouth"] = {
		label = "Vermouth",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		client = {
			image = 'vermouth.png',
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing vermouth'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_ld_flow_bottle') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_ld_flow_bottle') end }
		},
	},

	['shisha'] = {
		label = 'Shisha',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		client = {
			event = 'nr-shisha:client:useShisha',
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_bong_01') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_bong_01') end }
		},
	},

	["hotdog_chillicheesedog"] = {
		label = "Hotdog Chillicheesedog",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		client = {
			image = 'hotdog_chillicheesedog.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = { model = `prop_cs_hotdog_01`, pos = vec3(0.01, 0.01, 0.01), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You ate a delicious hotdog'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_cs_hotdog_01') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_cs_hotdog_01') end }
		},
	},

	["chipscheese_new"] = {
		label = "Chipscheese New",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = true,
		client = {
			image = 'chipscheese_new.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = { model = `v_ret_ml_chips4`, pos = vec3(0.01, 0.01, 0.01), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You ate some delicious chips'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'v_ret_ml_chips4') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'v_ret_ml_chips4') end }
		},
	},

	["chipshabanero_new"] = {
		label = "Chipshabanero New",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = true,
		client = {
			image = 'chipshabanero_new.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = { model = `v_ret_ml_chips2`, pos = vec3(0.01, 0.01, 0.01), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You ate some spicy chips'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'v_ret_ml_chips2') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'v_ret_ml_chips2') end }
		},
	},

	["manman_coconut"] = {
		label = "Manman Coconut",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		client = {
			image = 'manman_coconut.png',
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing coconut water'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_ld_flow_bottle') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_ld_flow_bottle') end }
		},
	},

	["manman_dragon_fruit"] = {
		label = "Manman Dragon Fruit",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		client = {
			image = 'manman_dragon_fruit.png',
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing dragon fruit juice'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_ld_flow_bottle') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_ld_flow_bottle') end }
		},
	},

	["manman_pineapple"] = {
		label = "Manman Pineapple",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		client = {
			image = 'manman_pineapple.png',
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing pineapple juice'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_ld_flow_bottle') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_ld_flow_bottle') end }
		},
	},

	["Vermouth_dry"] = {
		label = "Vermouth Dry",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		client = {
			image = 'vermouth_dry.png',
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing vermouth'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_ld_flow_bottle') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_ld_flow_bottle') end }
		},
	},

	["chipsribs_new"] = {
		label = "Chipsribs New",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = true,
		client = {
			image = 'chipsribs_new.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = { model = `v_ret_ml_chips1`, pos = vec3(0.01, 0.01, 0.01), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You ate some delicious chips'
		},
	},

	["pizza_ham_box"] = {
		label = "Pizza Ham Box",
		weight = 1,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = true,
		buttons = {
			{
				label = 'Dividir',
				action = function(slot)
					TriggerServerEvent('NR-items:server:splitItem', slot, 'pizza_ham_slice', 8)
				end
			},
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_pizza_box_02') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_pizza_box_02') end }
		},
	},

	["pizza_ham_slice"] = {
		label = "Pizza Ham Slice",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = true,
		client = {
			image = 'pizza_ham_slice.png',
			status = { hunger = 25000 },
			anim = 'eating',
			prop = { model = `v_res_tt_pizzaplate`, pos = vec3(0.01, 0.01, 0.01), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You ate a slice of pizza'
		},
		buttons = {
			{ label = 'Tirar con Prop',  action = function(slot) exports['sa_utils']:sendData(slot, 'prop_pizza_box_02') end },
			{ label = 'Lanzar', action = function(slot) exports['ox_inventory']:throwSlot(slot, 'prop_pizza_box_02') end }
		},
	},

	['simcard'] = {
		label = 'SIM Card',
		weight = 10,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		consume = 0,
		server = {
			export = 'p_phone.useSimCard'
		},
		buttons = {
			{ label = 'Tirar con Prop', action = function(slot) exports['sa_utils']:sendData(slot, 'hei_prop_heist_card_hack') end },
			{
				label = 'Lanzar',
				action = function(slot)
					exports['ox_inventory']:throwSlot(slot,
						'hei_prop_heist_card_hack')
				end
			}
		},
	},

	['crutch'] = {
		label = 'Crutch',
		weight = 100,
		sizeX = 1,
		sizeY = 3,
		stack = false,
		close = true,
	},

	['wheelchair'] = {
		label = 'Wheelchair',
		weight = 100,
		sizeX = 3,
		sizeY = 3,
		stack = false,
		close = true,
	},

	['medical_kit'] = {
		label = 'Medical Kit',
		weight = 200,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		description = 'A basic medical kit containing essential supplies for treating minor injuries and illnesses.',
	},

	['advanced_medical_kit'] = {
		label = 'Advanced Medical Kit',
		weight = 200,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		description =
		'A more advanced medical kit containing additional supplies and equipment for treating injuries and illnesses.',
	},

	['blood_bag_250'] = {
		label = 'Blood Bag 250ml',
		weight = 250,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = false,
		description = 'A 250ml bag of blood used for blood transfusions.',
	},

	['blood_bag_500'] = {
		label = 'Blood Bag 500ml',
		weight = 500,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = false,
		description = 'A 500ml bag of blood used for blood transfusions.',
	},

	['painkillers'] = {
		label = 'Painkillers',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = false,
		description = 'A medication used to relieve pain and reduce fever.',
	},

	['adrenaline'] = {
		label = 'Adrenaline',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = false,
	},

	['morphine'] = {
		label = 'Morphine',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = false,
		description = 'A medication used to relieve pain and reduce fever.',
	},

	['suture_kit'] = {
		label = 'Suture Kit',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = false,
		description = 'A medical device used to close wounds or surgical incisions.',
	},

	['splint'] = {
		label = 'Splint',
		weight = 100,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = false,
		description = 'A device that is used to apply pressure to a limb.',
	},

	['defibrilator'] = {
		label = 'Defibrillator',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = true,
	},

	['bodybag'] = {
		label = 'Body Bag',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = false,
	},

	['gauze'] = {
		label = 'Gauze',
		weight = 20,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description =
		'A thin, transparent fabric with a loose open weave, used for dressings, bandages, and surgical sponges.',
	},

	['ointment'] = {
		label = 'Ointment',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = 'A medical cream used to promote healing and prevent infection in minor cuts, scrapes, and burns.',
	},

	['disinfectant'] = {
		label = 'Disinfectant',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = 'A liquid that kills bacteria and other microorganisms on surfaces.',
	},

	["spraycan"] = {
		label = "Spray ",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["acetone"] = {
		label = "acetone ",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	['cyclonamine'] = {
		label = 'Cyclonamine',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	['tourniquet'] = {
		label = 'Tourniquet',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = 'A device that is used to apply pressure to a limb.',
	},

	['medicbag'] = {
		label = 'Medic Bag',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = true,
		description = 'A bag containing medical supplies and equipment.',
	},

	['antipyretics'] = {
		label = 'Antipyretics',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = 'A medication that reduces fever.',
	},

	['ambulance_gps'] = {
		label = 'Ambulance GPS',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = true,
	},

	['casino_chips'] = {
		label = 'Casino Chips',
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	['police_rappel'] = {
		label = 'Police Rappel',
		weight = 100,
		sizeX = 1,
		sizeY = 2,
		stack = false,
		close = true,
		consume = 0,
		client = {
			event = 'p_policejob/client/heli/usePoliceRappel'
		}
	},

	['fingerprint_scanner'] = {
		label = 'Fingerprint Scanner',
		weight = 500,
		sizeX = 1,
		sizeY = 2,
		stack = false,
		close = true,
		client = {
			export = 'p_policejob.useScanner'
		}
	},

	['spike_strip'] = {
		label = 'Spike strip',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		consume = 1,
		client = {
			export = 'p_policejob.spike_strip'
		}
	},

	['road_cone'] = {
		label = 'Road cone',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = true,
	},

	['consign'] = {
		label = 'Road sign',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = true,
	},

	['barrier'] = {
		label = 'Road barrier',
		weight = 50,
		sizeX = 3,
		sizeY = 2,
		stack = true,
	},

	['roadcone_light'] = {
		label = 'Road cone light',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = true,
	},

	["lighter_1"] = {
		label = "Lighter 1",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true
	},

	['headbag'] = {
		label = 'Head bag',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false
	},

	['police_diving_suit'] = {
		label = 'Police Diving Suit',
		weight = 2000,
		sizeX = 2,
		sizeY = 2,
		consume = 0,
		stack = false,
		server = {
			export = 'p_policejob.police_diving_suit'
		}
	},

	['player_clothes'] = {
		label = 'Your clothes',
		weight = 250,
		sizeX = 2,
		sizeY = 2,
		consume = 0,
		stack = false,
		server = {
			export = 'p_policejob.player_clothes'
		}
	},

	['fingerprint'] = {
		label = 'Fingerprint Sample',
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		consume = 0,
	},

	['bullet'] = {
		label = 'Bullet Sample',
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		consume = 0
	},

	['blood'] = {
		label = 'Blood Sample',
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		consume = 0
	},

	['tracking_band'] = {
		label = 'GPS Band',
		weight = 300,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['jammer'] = {
		label = 'Inhibidor de frecuencias',
		weight = 1000,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		allowArmed = true
	},

	['vest_normal'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		consume = 1,
		client = {
			export = 'p_policejob.vest_normal'
		}
	},

	['vest_strong'] = {
		label = 'Strong Bulletproof Vest',
		weight = 3000,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		consume = 1,
		client = {
			export = 'p_policejob.vest_strong'
		}
	},

	['body_cam'] = {
		label = 'Police Bodycam',
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0,
		stack = false,
		server = {
			export = 'p_policejob.body_cam'
		}
	},

	['gps'] = {
		label = 'GPS',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		consume = 0,
		allowArmed = true,
		client = {
			export = 'p_policejob.gps',
			remove = function(total)
				if total < 1 then
					local activeGPS = exports['p_policejob']:isGpsActive()
					if activeGPS then
						exports['p_policejob']:gps()
					end
				end
			end
		}
	},

	['snakecam'] = {
		label = 'Snake Cam',
		weight = 50,
		sizeX = 1,
		sizeY = 2,
		stack = false,
		close = true,
		client = {
			event = 'p_policejob/client/snakecam/start'
		}
	},

	['vehicle_tracker'] = {
		label = 'Vehicle GPS Tracker',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = true,
	},

	['camera'] = {
		label = 'Camera',
		stack = false,
		close = true,
		consume = 0,
		weight = 1000,
		sizeX = 1,
		sizeY = 1,
		client = {
			export = 'p_policejob.camera'
		}
	},

	['cable_ties'] = {
		label = 'Cable ties',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['mouthtape'] = {
		label = 'Mouth Tape',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['police_shield'] = {
		label = 'Police Shield',
		weight = 250,
		sizeX = 2,
		sizeY = 3,
		stack = false,
		close = false,
		consume = 0,
		client = {
			event = 'p_policejob/client/objects/togglePoliceShield'
		}
	},

	['evidence_camera'] = {
		label = 'Evidence Camera',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = true,
		client = {
			export = 'p_policejob.evidence_camera'
		}
	},





	['breathalyzer'] = {
		label = 'Breathalyzer',
		weight = 150,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = true,
		consume = 0,
		client = {
			export = 'p_policejob.useBreathalyzer'
		}
	},

	['wheel_clamp'] = {
		label = 'Wheel Clamp',
		weight = 250,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		consume = 0
	},

	['clothes_hat'] = {
		label = 'Hat',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		buttons = {
			{
				label = 'Show/Hide Hair',
				action = function(slot)
					TriggerEvent('p_itemclothes/client/toggleHair')
				end
			},
		},
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_ears'] = {
		label = 'Ear Accessories',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_tshirt'] = {
		label = 'T-Shirt',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_torso'] = {
		label = 'Jacket',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_arms'] = {
		label = 'Gloves',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_pants'] = {
		label = 'Pants',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_shoes'] = {
		label = 'Shoes',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_mask'] = {
		label = 'Mask',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		buttons = {
			{
				label = 'Show/Hide Face',
				action = function(slot)
					TriggerEvent('p_itemclothes/client/toggleFace')
				end
			},
			{
				label = 'Show/Hide Hair',
				action = function(slot)
					TriggerEvent('p_itemclothes/client/toggleHair')
				end
			},
		},
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_glasses'] = {
		label = 'Glasses',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_vest'] = {
		label = 'Vest',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_bag'] = {
		label = 'Bag',
		weight = 50,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_watch'] = {
		label = 'Watch',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_chain'] = {
		label = 'Chain',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['clothes_bracelet'] = {
		label = 'Bracelet',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = false,
		close = false,
		consume = 0,
		server = {
			export = 'p_itemclothes.useClothingItem'
		}
	},

	['weed'] = {
		label = 'Weed',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['liquid_meth'] = {
		label = 'Liquid Meth',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['baggy'] = {
		label = 'Baggy',
		weight = 10,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['bagged_weed'] = {
		label = 'Weed Bag',
		weight = 20,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['bagged_meth'] = {
		label = 'Meth Bag',
		weight = 20,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['bagging_table'] = {
		label = 'Bagging Table',
		weight = 1000,
		sizeX = 3,
		sizeY = 3,
		stack = true,
	},

	['cauldron'] = {
		label = 'Cauldron',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = true,
	},

	['coca_leaf'] = {
		label = 'Coca Leaf',
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['coke_base'] = {
		label = 'Cocaine Base',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['meth_cooking_table'] = {
		label = 'Meth Cooking Table',
		weight = 1000,
		sizeX = 3,
		sizeY = 3,
		stack = true,
	},

	['phos'] = {
		label = 'phos',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['acid'] = {
		label = 'Acid',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['pseudo'] = {
		label = 'Pseudo',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['explosive_meth'] = {
		label = 'Explosive Meth',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['mixer'] = {
		label = 'Mixer',
		weight = 1,
		sizeX = 2,
		sizeY = 2,
		stack = true,
	},

	['gasoline'] = {
		label = 'Gasoline',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = true,
	},

	['meth_oven'] = {
		label = 'Meth Oven',
		weight = 2500,
		sizeX = 3,
		sizeY = 3,
		stack = true,
	},

	['coke_oven'] = {
		label = 'Coke Oven',
		weight = 2500,
		sizeX = 3,
		sizeY = 3,
		stack = true,
	},

	['meth'] = {
		label = 'Meth',
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['plant_pot'] = {
		label = 'Plant Pot',
		weight = 100,
		sizeX = 2,
		sizeY = 2,
		stack = true,
	},

	['water_bottle'] = {
		label = 'Water Bottle',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['default_lamp'] = {
		label = 'Lamp',
		weight = 200,
		sizeX = 1,
		sizeY = 2,
		stack = true,
	},

	['press'] = {
		label = 'Press',
		weight = 2500,
		sizeX = 3,
		sizeY = 3,
		stack = true,
	},

	['coke_brick'] = {
		label = 'Coke Brick',
		weight = 100,
		sizeX = 2,
		sizeY = 2,
		stack = true,
	},




	["goldbracelet"] = {
		label = "Gold Bracelet",
		weight = 30,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A heavy gold bracelet",
		client = {
			image = "goldbracelet.png",
		}
	},

	["goldwatch"] = {
		label = "Gold Watch",
		weight = 40,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "An expensive gold watch",
		client = {
			image = "goldwatch.png",
		}
	},

	["purpleusb"] = {
		label = "Purple USB",
		weight = 10,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A mysterious purple USB drive",
		client = {
			image = "purpleusb.png",
		}
	},

	["salvagedlockpick"] = {
		label = "Salvaged Lockpick",
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A worn-out salvaged lockpick",
		client = {
			image = "salvagedlockpick.png",
		}
	},

	["silverring"] = {
		label = "Silver Ring",
		weight = 15,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A delicate silver ring",
		client = {
			image = "silverring.png",
		}
	},

	["unmarkedsimcard"] = {
		label = "Unmarked SIM Card",
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "An unmarked SIM card, could be useful for something",
		client = {
			image = "unmarkedsimcard.png",
		}
	},

	["bandsofnotes"] = {
		label = "Bands of Notes",
		weight = 10,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A bundle of high-value notes, could be valuable.",
		client = { image = "bandsofnotes.png" }
	},

	["bankcard"] = {
		label = "Bank Card",
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A standard bank card for transactions.",
		client = { image = "bankcard.png" }
	},

	["group6card"] = {
		label = "Group 6 Security Card",
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A Group 6 security card granting access to restricted areas.",
		client = { image = "group6card.png" }
	},

	["humaneco2"] = {
		label = "Compound X2",
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A Compound X2, potentially useful for specific tasks.",
		client = { image = "humaneco2.png" }
	},

	["paletobankcard"] = {
		label = "Paleto Bank Card",
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "An ID card for Paleto Bank employees.",
		client = { image = "paletobankcard.png" }
	},

	["rubynecklace"] = {
		label = "Ruby Necklace",
		weight = 3,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A valuable ruby necklace.",
		client = { image = "rubynecklace.png" }
	},

	["stacksofcash"] = {
		label = "Stacks of Cash",
		weight = 15,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A large stack of cash.",
		client = { image = "stacksofcash.png" }
	},

	["thermite"] = {
		label = "Thermite",
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "An explosive thermite device, useful for breaking through strong barriers.",
		client = { image = "thermite.png" }
	},

	["handsaw"] = {
		label = "Hand Saw",
		weight = 3,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
		description = "A basic hand saw, useful for cutting wood and other materials.",
		client = { image = "handsaw.png" }
	},

	["harddrive"] = {
		label = "Hard Drive",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = false,
		description = "An internal hard drive, useful for storing data.",
		client = { image = "harddrive.png" }
	},

	["silverbar"] = {
		label = "Silver Bar",
		weight = 5,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = false,
		description = "A bar of pure silver, valuable for trading and crafting.",
		client = { image = "silverbar.png" }
	},

	["wirecutters"] = {
		label = "Wire Cutters",
		weight = 2,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A tool for cutting wires, essential for various tasks.",
		client = { image = "wirecutters.png" }
	},

	["pincracker"] = {
		label = "Pin Cracker",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A tool used for cracking pin-based locks, essential for skilled lockpickers.",
		client = { image = "pincracker.png" }
	},

	["bigbankcard"] = {
		label = "Big Bank Card",
		weight = 5,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A bank card that provides access to bank services.",
		client = { image = "bigbankcard.png" }
	},

	["c4"] = {
		label = "C4 Explosive",
		weight = 10,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
		description = "A powerful explosive device, useful for breaching strong barriers.",
		client = { image = "c4.png" }
	},

	["humaneusb"] = {
		label = "Humane Labs USB",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "A USB stick containing sensitive data, property of Humane Labs.",
		client = { image = "humaneusb.png" }
	},

	["bankidcard"] = {
		label = "Bank ID Card",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = "An ID card for bank employees, granting access to certain areas.",
		client = { image = "bankidcard.png" }
	},

	['instant_camera'] = {
		label = "Instant Camera",
		weight = 200,
		sizeX = 1,
		sizeY = 2,
		server = {
			export = "origen_police.instant_camera"
		},
		consume = 0
	},

	['photo'] = {
		label = "Photo",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		server = {
			export = "origen_police.photo"
		},
		consume = 0
	},

	['report_evidence'] = {
		label = "Report Evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		server = {
			export = "origen_police.report_evidence"
		},
		consume = 0
	},


	['lspd_badge'] = {
		label = "LSPD Badge",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		server = {
			export = "origen_police.lspd_badge"
		},
		consume = 0
	},

	['bcsd_badge'] = {
		label = "LSSD Badge",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		server = {
			export = "origen_police.bcsd_badge"
		},
		consume = 0
	},

	['fib_badge'] = {
		label = "FIB Badge",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		server = {
			export = "origen_police.fib_badge"
		},
		consume = 0
	},

	['evidence_a'] = {
		label = "Bullet evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0
	},

	['evidence_az'] = {
		label = "Evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0
	},

	['evidence_b'] = {
		label = "Vehicle evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0
	},

	['evidence_n'] = {
		label = "Impact evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0
	},

	['evidence_ne'] = {
		label = "Footprint evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0
	},

	['evidence_r'] = {
		label = "Blood evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0
	},

	['evidence_ro'] = {
		label = "Evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0
	},

	['evidence_v'] = {
		label = "Drug evidence",
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		consume = 0
	},

	['racingtablet'] = {
		label = 'Racing tablet',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		description = 'Seems like something to do with cars.',
		stack = false,
		client = {
			export = 'rahe-racing.racingtablet',
		}
	},

	["housekey"] = {
		label = "House Key",
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = false,
	},

		['whisky'] = {
		label = 'whisky',
		weight = 220,
		sizeX = 1,
		sizeY = 1,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			usetime = 2500,
		},
	},

	["weed_white-widow"] = {
		label = "White Widow weed",
		weight = 150,
		sizeX = 1,
		sizeY = 1,
		stack = false,
	},

	["weed_skunk"] = {
		label = "Skunk weed",
		weight = 150,
		sizeX = 1,
		sizeY = 1,
		stack = false,
	},

	["weed_purple-haze"] = {
		label = "Purple Haze weed",
		weight = 150,
		sizeX = 1,
		sizeY = 1,
		stack = false,
	},

	["weed_og-kush"] = {
		label = "OG Kush weed",
		weight = 150,
		sizeX = 1,
		sizeY = 1,
		stack = false,
	},

	["weed_amnesia"] = {
		label = "Amnesia weed",
		weight = 150,
		sizeX = 1,
		sizeY = 1,
		stack = false,
	},

	["empty_weed_bag"] = {
		label = "Empty weed bag",
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	["weed_nutrition"] = {
		label = "Weed nutrition",
		weight = 500,
		sizeX = 1,
		sizeY = 2,
		stack = false,
	},

	["police_stormram"] = {
		label = "Police Storm Ram",
		weight = 800,
		sizeX = 3,
		sizeY = 2,
		stack = false,
	},

	['backpack'] = {
		label = 'Backpack',
		weight = 220,
		sizeX = 2,
		sizeY = 3,
		stack = false,
		consume = 0,
		client = {
			export = 'sa_utils.openBackpack'
		}
	},



	["powerade"] = {
		label = "Powerade",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},


	['vehicle_door'] = {
		label = 'Puerta de vehiculo',
		weight = 2000,
		sizeX = 3,
		sizeY = 3,
		stack = false,
		close = true,
		description = 'Una puerta de algun vehiculo'
	},

	['vehicle_hood'] = {
		label = 'Capo de vehiculo',
		weight = 3000,
		sizeX = 3,
		sizeY = 3,
		stack = false,
		close = true,
		description = 'Un capo de algun vehiculo'
	},

	['veh_wheels'] = {
		label = 'Rueda de vehiculo',
		weight = 5000,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = true,
		description = 'Una rueda de algun vehiculo'
	},

	['veh_suspension'] = {
		label = 'Suspension de vehiculo',
		weight = 4000,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = true,
		description = 'Un conjunto de suspensiones de algun vehiculo'
	},

	['car-battery'] = {
		label = 'Bateria de vehiculo',
		weight = 1000,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
		description = 'Una bateria de algun vehiculo'
	},

	['plate'] = {
		label = 'Matricula',
		weight = 100,
		sizeX = 2,
		sizeY = 1,
		stack = false,
		close = true,
		description = 'Una matricula de algun vehiculo'
	},

	["tape"] = {
		label = "Cinta americana",
		weight = 1,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},


	-- PET SYSTEM,

	['petfood'] = {
		label = 'Comida para Mascotas',
		weight = 200,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
		description = 'Deliciosa comida para tu compañero fiel.'
	},

	['collarpet'] = {
		label = 'Collar de Mascota',
		weight = 100,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = 'Un collar resistente para asignar dueño.'
	},

	['petnametag'] = {
		label = 'Placa de Nombre',
		weight = 50,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = 'Placa para poner nombre a tu mascota.'
	},

	['firstaidforpet'] = {
		label = 'Botiquín Veterinario',
		weight = 500,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
		description = 'Suministros médicos para curar o revivir a tu mascota.'
	},

	['petgroomingkit'] = {
		label = 'Kit de Aseo',
		weight = 1000,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = true,
		description = 'Todo lo necesario para mantener a tu mascota limpia y feliz.'
	},

	['petwaterbottleportable'] = {
		label = 'Botella de Agua Portátil',
		weight = 300,
		sizeX = 1,
		sizeY = 2,
		stack = false,
		close = true,
		description = 'Botella de agua para hidratar a tu mascota en cualquier lugar.'
	},


	["casino_coke"] = {
		label = "Casino Kofola",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_donut"] = {
		label = "Casino Donut",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_ego_chaser"] = {
		label = "Casino Ego Chaser",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_luckypotion"] = {
		label = "Casino Lucky Potion",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_psqs"] = {
		label = "Casino Ps & Qs",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_sandwitch"] = {
		label = "Casino Sandwitch",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_sprite"] = {
		label = "Casino Sprite",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_beer"] = {
		label = "Casino Beer",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_burger"] = {
		label = "Casino Burger",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["casino_coffee"] = {
		label = "Casino Coffee",
		weight = 0,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["licenseplate"] = {
		label = "Matricula",
		weight = 0,
		sizeX = 2,
		sizeY = 1,
		stack = false,
		close = true,
	},

	['boostingtablet'] = {
		label = 'Boosting tablet',
		weight = 0,
		sizeX = 2,
		sizeY = 2,
		description = "Seems like something's installed on this.",
		client = {
			export = 'rahe-boosting.boostingtablet',
		}
	},

	['hackingdevice'] = {
		label = 'Hacking device',
		weight = 0,
		sizeX = 1,
		sizeY = 2,
		description = 'Will allow you to bypass vehicle security systems.',
		client = {
			export = 'rahe-boosting.hackingdevice',
		}
	},

	['gpshackingdevice'] = {
		label = 'GPS hacking device',
		weight = 0,
		sizeX = 1,
		sizeY = 2,
		description = 'If you wish to disable vehicle GPS systems.',
		client = {
			export = 'rahe-boosting.gpshackingdevice',
		}
	},

	




	['bottle'] = {
		label = 'Bottle',
		weight = 20,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		description = nil,
	},



	['aluminum'] = {
		label = 'aluminum',
		weight = 20,
		sizeX = 1,
		sizeY = 1,
		stack = true,
	},

	['skateboard'] = {
		label = 'Skateboard',
		weight = 3000,
		sizeX = 2,
		sizeY = 3,
		stack = false,
		close = true,
		description = 'Un skateboard para desplazarte por la ciudad.',
		client = {
			image = 'skateboard.png',
		}
	},


	--------------------------------- LICENSES,

	["license_driver"] = {
	    label = "Driver License",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = false,
	    close = true,
		buttons = {
			{ label = 'Enseñar',  action = function(slot) TriggerEvent("Nr-License:useLicense", 'driver') end },
		}
	},

	["license_weapon"] = {
	    label = "Weapon License",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = false,
	    close = true,
		buttons = {
			{ label = 'Enseñar',  action = function(slot) TriggerEvent("Nr-License:useLicense", 'weapons') end },
		}
	},

	["license_hunting"] = {
	    label = "License Hunting",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = false,
	    close = true,
		buttons = {
			{ label = 'Enseñar',  action = function(slot) TriggerEvent("Nr-License:useLicense", 'hunting') end },
		}
	},

	["license_fishing"] = {
	    label = "License Fishing",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = false,
	    close = true,
		buttons = {
			{ label = 'Enseñar',  action = function(slot) TriggerEvent("Nr-License:useLicense", 'fishing') end },
		}
	},

	["license_pilot"] = {
	    label = "Pilot License",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = false,
	    close = true,
		buttons = {
			{ label = 'Enseñar',  action = function(slot) TriggerEvent("Nr-License:useLicense", 'pilot') end },
		}
	},

	["license_boat"] = {
	    label = "Boat License",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = false,
	    close = true,
		buttons = {
			{ label = 'Enseñar',  action = function(slot) TriggerEvent("Nr-License:useLicense", 'boat') end },
		}
	},

	["grouper"] = {
		label = "Grouper",
		weight = 3500,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["haddock"] = {
		label = "Haddock",
		weight = 500,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["piranha"] = {
		label = "Piranha",
		weight = 1500,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["anchovy"] = {
		label = "Anchovy",
		weight = 20,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["artificial_bait"] = {
		label = "Artificial bait",
		weight = 30,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["shark"] = {
		label = "Shark",
		weight = 7500,
		sizeX = 3,
		sizeY = 3,
		stack = true,
		close = true,
	},

	["basic_rod"] = {
		label = "Fishing rod",
		weight = 250,
		sizeX = 1,
		sizeY = 3,
		stack = true,
		close = true,
	},

	["mahi_mahi"] = {
		label = "Mahi Mahi",
		weight = 3500,
		sizeX = 2,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["worms"] = {
		label = "Worms",
		weight = 10,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
	},

	["tuna"] = {
		label = "Tuna",
		weight = 10000,
		sizeX = 3,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["salmon"] = {
		label = "Salmon",
		weight = 1000,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["titanium_rod"] = {
		label = "Titanium rod",
		weight = 450,
		sizeX = 1,
		sizeY = 3,
		stack = true,
		close = true,
	},

	["trout"] = {
		label = "Trout",
		weight = 750,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
	},

	["graphite_rod"] = {
		label = "Graphite rod",
		weight = 350,
		sizeX = 1,
		sizeY = 3,
		stack = true,
		close = true,
	},

	["red_snapper"] = {
		label = "Red Snapper",
		weight = 2500,
		sizeX = 1,
		sizeY = 2,
		stack = true,
		close = true,
	},

	['pumpkin'] = {
    label = 'Calabaza',
    weight = 1000,
	sizeX = 2,
	sizeY = 2,
    stack = true,
    close = true,
		buttons = {
			{
				label = 'Gestionar Escondite',
				action = function(slot)
					exports.sa_utils:manageContainer(slot)
				end
			}
		}
	},

	["feather"] = {
	    label = "Pluma",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true
	},

	["leather"] = {
	    label = "Cuero",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true
	},

	["meat"] = {
	    label = "Carne",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true
	},

	["antlers"] = {
	    label = "Cuernos",
	    weight = 1,
		sizeX = 1,
		sizeY = 2,
	    stack = true,
	    close = true
	},

	["panther_leather"] = {
	    label = "Piel de Pantera",
	    weight = 1,
		sizeX = 2,
		sizeY = 2,
	    stack = true,
	    close = true
	},

	["coyote_leather"] = {
	    label = "Piel de Coyote",
	    weight = 1,
		sizeX = 2,
		sizeY = 2,
	    stack = true,
	    close = true
	},

		-- [[ CHOPPA BARBACOA ITEMS ]] --

-- Herramienta,

	['bbq_grill'] = {
		label = 'Parrilla Portátil',
		weight = 5000, -- Peso en gramos (5kg)
		sizeX = 3,
		sizeY = 3,
		stack = false, -- No se pueden apilar (solo 1 por slot)
		close = true,  -- Cierra el inventario al usarlo
		client = {
			image = 'bbq_grill.png',        -- Nombre del archivo de imagen
			export = 'sa_utils.useBBQ' -- Llama a la función del script
		}
	},

	-- Carnes Crudas (Ingredientes),

	['meat_steak'] = {
		label = 'Chuletón Crudo',
		weight = 400,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		description = 'Un corte de ternera fresco listo para la brasa.',
		client = { image = 'meat_steak.png' }
	},

	['meat_chicken_wing'] = {
		label = 'Alita de Pollo Cruda',
		weight = 250,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		description = 'Alitas de pollo frescas de granja.',
		client = { image = 'meat_chicken_wing.png' }
	},

	["screwdriver"] = {
	    label = "Destornillador",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true
	},

	['meat_chicken_leg'] = {
		label = 'Muslo de Pollo Crudo',
		weight = 300,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		description = 'Muslos de pollo frescos de granja.',
		client = { image = 'meat_chicken_leg.png' }
	},

	-- Carnes Cocinadas (Consumibles),

	['cooked_steak'] = {
		label = 'Chuletón Asado',
		weight = 350,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true, -- Para que se cierre el inventario al comer
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'prop_cs_steak',
			usetime = 2500,
			notification = 'Te has comido un chuletón'
		},
	},

	['cooked_chicken_wing'] = {
		label = 'Alita de Pollo Asada',
		weight = 200,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'npds_chickenwing',
			usetime = 2500,
			notification = 'Te has comido una alita'
		},
	},

	['cooked_chicken_leg'] = {
		label = 'Muslo de Pollo Asado',
		weight = 250,
		sizeX = 1,
		sizeY = 1,
		stack = true,
		close = true,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'npds_friedchickenleg',
			usetime = 2500,
			notification = 'Te has comido un muslo de pollo'
		},
	},

	['radiocasete'] = {
    label = 'Radiocasete Portable',
    weight = 2500,
	sizeX = 2,
	sizeY = 2,
    stack = false,
    close = true,
		client = {
			-- Fíjate que aquí usamos el nombre que me has dado:
			export = 'sa_utils.usarRadiocasete'
		}
	},

	['weazelnews_paper'] = {
        label       = 'Periódico WeazelNews',
        weight      = 50,
		sizeX 		= 1,
		sizeY		= 1,
        stack       = false,
        close       = true,
        description = 'El periódico diario de Los Santos. ¿Qué habrá pasado hoy?',
        client = {
            image   = 'weazelnews_paper.png',
            export  = 'weazelnews_mailbox.useItemClient',
        },
    },





	--------------------- ROBO BANCO PACIFIC,

	["drill"] = {
	    label = "Drill",
	    weight = 1,
		sizeX = 2,
		sizeY = 2,
	    stack = true,
	    close = true
	},

	["vanDiamond"] = {
	    label = "Diamante Grande",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = false,
	    close = true
	},

	["bag"] = {
	    label = "Bag",
	    weight = 1,
		sizeX = 2,
		sizeY = 2,
	    stack = true,
	    close = true
	},

	["cutter"] = {
	    label = "Cutter",
	    weight = 1,
		sizeX = 1,
		sizeY = 2,
	    stack = true,
	    close = true
	},

	["c4_bomb"] = {
	    label = "C4 Bomb",
	    weight = 1,
		sizeX = 1,
		sizeY = 2,
	    stack = true,
	    close = true
	},

	["thermite_bomb"] = {
	    label = "Termita",
	    weight = 1,
		sizeX = 1,
		sizeY = 2,
	    stack = true,
	    close = true
	},

	["laptop"] = {
	    label = "Laptop",
	    weight = 1,
		sizeX = 2,
		sizeY = 2,
	    stack = true,
	    close = true
	},

	["trojan_usb"] = {
	    label = "Usb Black",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true
	},


----------------------------- drugs ---------------------------------,

	["watering_can"] = {
	  	label = "Watering can",
	  	weight = 500,
		sizeX = 2,
		sizeY = 2,
	  	stack = false,
	  	close = false,
	  	description = "Simple watering can",
	  	client = {
	  		image = "watering_can.png",
	  	}
	  },

	["fertilizer"] = {
	  	label = "Fertilizer",
	  	weight = 500,
		sizeX = 1,
		sizeY = 2,
	  	stack = false,
	  	close = false,
	  	description = "Fertilizer",
	  	client = {
	  		image = "fertilizer.png",
	  	}
	  },

	["advanced_fertilizer"] = {
	  	label = "Advanced fertilizer",
	  	weight = 500,
		sizeX = 1,
		sizeY = 2,
	  	stack = false,
	  	close = false,
	  	description = "Fertilizer with the litte extra",
	  	client = {
	  		image = "advanced_fertilizer.png",
	  	}
	  },

	["liquid_fertilizer"] = {
	  	label = "Liquid Fertilizer",
	  	weight = 200,
		sizeX = 1,
		sizeY = 2,
	  	stack = false,
	  	close = false,
	  	description = "Basicly Water with nutrations",
	  	client = {
	  		image = "liquid_fertilizer.png",
	  	}
	  },

	["weed_lemonhaze_seed"] = {
	  	label = "Weed Lemonhaze Seed",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = true,
	  consume = 0,
	  	description = "Weed Lemonhaze Seed",
	  	client = {
	  		image = "weed_lemonhaze_seed.png",
	  	},
	  	server = {
	  		export = "it-drugs.useSeed"
	  	}
	  },

	["weed_lemonhaze"] = {
	  	label = "Weed Lemonhaze",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = false,
	  	description = "Weed Lemonhaze",
	  	client = {
	  		image = "weed_lemonhaze.png",
	  	},
	  },

	["weed_og_seed"] = {
	  	label = "Weed Og Seed",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = true,
	  consume = 0,
	  	description = "Weed Og Seed",
	  	client = {
	  		image = "weed_og_seed.png",
	  	},
	  	server = {
	  		export = "it-drugs.useSeed"
	  	}
	  },

	["weed_og"] = {
	  	label = "weed Og",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = false,
	  	description = "weed Og",
	  	client = {
	  		image = "weed_og.png",
	  	},
	  },

	["weed_purple_haze_seed"] = {
	  	label = "Weed Purple Haze Seed",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = true,
	  consume = 0,
	  	description = "Weed Purple Haze Seed",
	  	client = {
	  		image = "weed_purple_haze_seed.png",
	  	},
	  	server = {
	  		export = "it-drugs.useSeed"
	  	}
	  },

	["weed_purple_haze"] = {
	  	label = "weed Purple Haze",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = false,
	  	description = "weed Purple Haze",
	  	client = {
	  		image = "weed_purple_haze.png",
	  	},
	  },

	["weed_white_widow_seed"] = {
	  	label = "Weed White Widow Seed",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = true,
	  consume = 0,
	  	description = "Weed White Widow Seed",
	  	client = {
	  		image = "weed_white_widow_seed.png",
	  	},
	  	server = {
	  		export = "it-drugs.useSeed"
	  	}
	  },

	["weed_white_widow"] = {
	  	label = "weed White Widow",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = false,
	  	description = "weed White Widow",
	  	client = {
	  		image = "weed_white_widow.png",
	  	}
	  },

	["weed_blueberry_seed"] = {
	  	label = "Weed Blueberry Seed",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = true,
	  consume = 0,
	  	description = "Weed Blueberry Seed",
	  	client = {
	  		image = "weed_blueberry_seed.png",
	  	},
	  	server = {
	  		export = "it-drugs.useSeed"
	  	}
	  },

	["weed_blueberry"] = {
	  	label = "weed Blueberry",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = false,
	  	description = "weed Blueberry",
	  	client = {
	  		image = "weed_blueberry.png",
	  	}
	  },

	["coca_seed"] = {
	  	label = "Coca Seed",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = true,
	  consume = 0,
	  	description = "Coca Seed",
	  	client = {
	  		image = "coca_seed.png",
	  	},
	  	server = {
	  		export = "it-drugs.useSeed"
	  	}
	  },

	["coca"] = {
	  	label = "Coca",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = false,
	  	description = "Coca",
	  	client = {
	  		image = "coca.png",
	  	}
	  },

	["paper"] = {
	  	label = "Paper",
	  	weight = 50,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = false,
	  	description = "Paper",
	  	client = {
	  		image = "paper.png",
	  	}
	  },

	["nitrous"] = {
	  	label = "Nitrous",
	  	weight = 500,
		sizeX = 1,
		sizeY = 2,
	  	stack = false,
	  	close = false,
	  	description = "Nitrous",
	  	client = {
	  		image = "nitrous.png",
	  	}
	  },

	["weed_processing_table"] = {
	  	label = "Weed Processing Table",
	  	weight = 1000,
		sizeX = 3,
		sizeY = 3,
	  	stack = false,
	  	close = true,
	  consume = 0,
	  	description = "Process some weed",
	  	client = {
	  		image = "weed_processing_table.png",
	  	},
	  	server = {
	  		export = "it-drugs.placeProcessingTable"
	  	}
	  },

	["cocaine_processing_table"] = {
	  	label = "Cocaine Processing Table",
	  	weight = 1000,
		sizeX = 3,
		sizeY = 3,
	  	stack = false,
	  	close = true,
	  	description = "Process some cocaine",
	  consume = 0,
	  	client = {
	  		image = "cocaine_processing_table.png",
	  	},
	  	server = {
	  		export = "it-drugs.placeProcessingTable"
	  	}
	  },

	["cocaine"] = {
	  	label = "Cocaine",
	  	weight = 20,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = true,
	  	description = "A little bag of cocaine",
	  	consume = 0,
	  	server = {
	  		export = "it-drugs.takeDrug"
	  	},
	  	client = {
	  		image = "cocaine.png",
	  	},
	  },

	["joint"] = {
	  	label = "Joint",
	  	weight = 10,
		sizeX = 1,
		sizeY = 1,
	  	stack = true,
	  	close = true,
	  	description = "Joint",
	  	consume = 0,
	  	server = {
	  		export = "it-drugs.takeDrug"
	  	},
	  	client = {
	  		image = "joint.png",
	  	}
	  },

	['fire_mdt'] = {
    label       = 'MDT de Bomberos',
    weight      = 500,
	sizeX 		= 2,
	sizeY		= 2,
    stack       = false,
    close       = true,
    description = 'Tablet del departamento de bomberos.',
    client      = {
        export = 'fire_system.useFireMDT',
    },
	},
	-------------------------------- police ---------------------------------,

	["fish_taco"] = {
	    label = "Taco de Pescado",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true,
		buttons = {
			{
				label = 'Consumir',
				action = function(slot)
					TriggerEvent("sa_utils:client:consumeItem", "eat", "prop_taco_01", slot, 5)
				end
			},
		},
	},

	["hotdog_taco"] = {
	    label = "Taco de Perro Caliente",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true,
		buttons = {
			{
				label = 'Consumir',
				action = function(slot)
					TriggerEvent("sa_utils:client:consumeItem", "eat", "prop_cs_hotdog_01", slot, 5)
				end
			},
		},
	},

	["taco_chicken"] = {
	    label = "Taco de pollo",
	    weight = 1,
		sizeX = 1,
		sizeY = 1,
	    stack = true,
	    close = true,
		buttons = {
			{
				label = 'Consumir',
				action = function(slot)
					TriggerEvent("sa_utils:client:consumeItem", "eat", "prop_taco_01", slot, 5)
				end
			},
		},
	},

	['p_margarita'] = {
		label = 'pizza margarita',
		weight = 1,
		sizeX = 3,
		sizeY = 3,
		stack = false,
		close = true,
		buttons = {
			{
				label = 'Dividir',
				action = function(slot)
					TriggerServerEvent('NR-items:server:splitItem', slot, 'pizza_ham_slice', 8)
				end
			},
		}

	},

	['p_cuatroquesos'] = {
		label = 'pizza cuatro quesos',
		weight = 1,
		sizeX = 3,
		sizeY = 3,
		stack = false,
		close = true,
		buttons = {
			{
				label = 'Dividir',
				action = function(slot)
					TriggerServerEvent('NR-items:server:splitItem', slot, 'pizza_ham_slice', 8)
				end
			},
		}

	},

	['p_peperoni'] = {
		label = 'pizza peperoni',
		weight = 1,
		sizeX = 3,
		sizeY = 3,
		stack = false,
		close = true,
		buttons = {
			{
				label = 'Dividir',
				action = function(slot)
					TriggerServerEvent('NR-items:server:splitItem', slot, 'pizza_ham_slice', 8)
				end
			},
		}

	},

	
	["wine_rose"] = {
	    label = "Vino Rosa",
	    weight = 1,
	    stack = true,
	    close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },			
			usetime = 2500,
			cancel = true,
		}
	},

	["wine_normal"] = {
	    label = "Vino de Reserva",
	    weight = 1,
	    stack = true,
	    close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },			
			usetime = 2500,
			cancel = true,
		}
	},

	['tiramisu'] = {
		label = 'Tiramisú',
		weight = 1,
		sizeX = 2,
		sizeY = 2,
		stack = false,
		close = true,
		client = {
			status = { hunger = 200000 },
			anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },			
			usetime = 2500,
			cancel = true,
		}
	},

	["ice_pis"] = {
	    label = "Helado de Pistacho",
	    weight = 1,
	    stack = true,
	    close = true,
		client = {
			status = { hunger = 200000 },
			anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },			
			usetime = 2500,
			cancel = true,
		}
	},

	
	["cafe_manchado"] = {
	    label = "Café Manchado",
	    weight = 1,
	    stack = true,
	    close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },			
			usetime = 2500,
			cancel = true,
		}
	},

	
	["cafe_negro"] = {
	    label = "Café Negro",
	    weight = 1,
	    stack = true,
	    close = true,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },			
			usetime = 2500,
			cancel = true,
		}
	},

	--['pokemon_pack'] = { label = 'Sobre Pokémon', weight = 50, stack = true, close = true, consume = 1, description = 'Contiene cartas sorpresa.', server = { export = 'cartas_pokemon.usePack' } },
--
	--['card_bulbasaur'] = { label = 'Carta: Bulbasaur', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Común) HP:40. Drenadoras.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_caterpie'] = { label = 'Carta: Caterpie', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho (Común) HP:40. Disparo Demora.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_weedle'] = { label = 'Carta: Weedle', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Veneno (Común) HP:40. Picotazo Venenoso.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_oddish'] = { label = 'Carta: Oddish', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Común) HP:50. Somnífero.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_paras'] = { label = 'Carta: Paras', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Planta (Común) HP:40. Arañazo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_venonat'] = { label = 'Carta: Venonat', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Veneno (Común) HP:40. Confusión.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_bellsprout'] = { label = 'Carta: Bellsprout', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Común) HP:50. Látigo Cepa.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_exeggcute'] = { label = 'Carta: Exeggcute', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Psíquico (Común) HP:50. Hipnosis.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_tangela'] = { label = 'Carta: Tangela', weight = 10, stack = true, close = true, consume = 0, description = 'Planta (Común) HP:50. Atadura.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_charmander'] = { label = 'Carta: Charmander', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Común) HP:50. Ascuas.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_vulpix'] = { label = 'Carta: Vulpix', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Común) HP:50. Fuego Fatuo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_growlithe'] = { label = 'Carta: Growlithe', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Común) HP:60. Mordisco.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_ponyta'] = { label = 'Carta: Ponyta', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Común) HP:40. Pisotón.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_squirtle'] = { label = 'Carta: Squirtle', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:40. Burbuja.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_psyduck'] = { label = 'Carta: Psyduck', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:50. Migraña.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_poliwag'] = { label = 'Carta: Poliwag', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:40. Pistola Agua.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_tentacool'] = { label = 'Carta: Tentacool', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Veneno (Común) HP:30. Ácido.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_slowpoke'] = { label = 'Carta: Slowpoke', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Psíquico (Común) HP:50. Amnesia.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_seel'] = { label = 'Carta: Seel', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:60. Rayo Aurora.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_shellder'] = { label = 'Carta: Shellder', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:30. Refugio.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_krabby'] = { label = 'Carta: Krabby', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:50. Agarre.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_horsea'] = { label = 'Carta: Horsea', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:30. Pantalla Humo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_goldeen'] = { label = 'Carta: Goldeen', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:40. Ataque Cuerno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_staryu'] = { label = 'Carta: Staryu', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:40. Bofetón Lodo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_magikarp'] = { label = 'Carta: Magikarp', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Común) HP:30. Salpicadura. Nunca hace nada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_pikachu'] = { label = 'Carta: Pikachu', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico (Común) HP:40. Impactrueno. El ratón eléctrico.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_magnemite'] = { label = 'Carta: Magnemite', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico/Acero (Común) HP:40. Chispa.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_voltorb'] = { label = 'Carta: Voltorb', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico (Común) HP:40. Placaje.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_electabuzz'] = { label = 'Carta: Electabuzz', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico (Común) HP:70. Puño Trueno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_pidgey'] = { label = 'Carta: Pidgey', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Volador (Común) HP:40. Tornado.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_rattata'] = { label = 'Carta: Rattata', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:30. Ataque Rápido.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_spearow'] = { label = 'Carta: Spearow', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Volador (Común) HP:50. Picotazo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_clefairy'] = { label = 'Carta: Clefairy', weight = 10, stack = true, close = true, consume = 0, description = 'Hada (Común) HP:40. Metrónomo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_jigglypuff'] = { label = 'Carta: Jigglypuff', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Hada (Común) HP:50. Canto.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_meowth'] = { label = 'Carta: Meowth', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:40. Día de Pago.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_farfetchd'] = { label = 'Carta: Farfetchd', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Volador (Común) HP:50. Ataque Furia.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_doduo'] = { label = 'Carta: Doduo', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Volador (Común) HP:50. Pico Taladro.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_lickitung'] = { label = 'Carta: Lickitung', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:90. Lengüetazo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_chansey'] = { label = 'Carta: Chansey', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:120. Amortiguador.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_kangaskhan'] = { label = 'Carta: Kangaskhan', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:90. Puño Cometa.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_tauros'] = { label = 'Carta: Tauros', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:70. Cornada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_ditto'] = { label = 'Carta: Ditto', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:50. Transformación.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_eevee'] = { label = 'Carta: Eevee', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:50. Mordisco.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_porygon'] = { label = 'Carta: Porygon', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Común) HP:30. Conversión.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_ekans'] = { label = 'Carta: Ekans', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Común) HP:40. Picotazo Venenoso.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_nidoranf'] = { label = 'Carta: Nidoran ♀', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Común) HP:50. Gruñido.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_nidoranm'] = { label = 'Carta: Nidoran ♂', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Común) HP:50. Corneada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_zubat'] = { label = 'Carta: Zubat', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno/Volador (Común) HP:40. Chupavidas.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_diglett'] = { label = 'Carta: Diglett', weight = 10, stack = true, close = true, consume = 0, description = 'Tierra (Común) HP:30. Excavar.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_mankey'] = { label = 'Carta: Mankey', weight = 10, stack = true, close = true, consume = 0, description = 'Lucha (Común) HP:30. Arañazo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_machop'] = { label = 'Carta: Machop', weight = 10, stack = true, close = true, consume = 0, description = 'Lucha (Común) HP:50. Golpe Karate.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_geodude'] = { label = 'Carta: Geodude', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Tierra (Común) HP:50. Lanzarrocas.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_grimer'] = { label = 'Carta: Grimer', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Común) HP:50. Residuo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_onix'] = { label = 'Carta: Onix', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Tierra (Común) HP:90. Lanzarrocas.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_cubone'] = { label = 'Carta: Cubone', weight = 10, stack = true, close = true, consume = 0, description = 'Tierra (Común) HP:40. Hueso Palo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_koffing'] = { label = 'Carta: Koffing', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Común) HP:50. Gas Veneno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_rhyhorn'] = { label = 'Carta: Rhyhorn', weight = 10, stack = true, close = true, consume = 0, description = 'Tierra/Roca (Común) HP:70. Derribo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_abra'] = { label = 'Carta: Abra', weight = 10, stack = true, close = true, consume = 0, description = 'Psíquico (Común) HP:30. Teletransporte.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_drowzee'] = { label = 'Carta: Drowzee', weight = 10, stack = true, close = true, consume = 0, description = 'Psíquico (Común) HP:50. Confusión.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_gastly'] = { label = 'Carta: Gastly', weight = 10, stack = true, close = true, consume = 0, description = 'Fantasma/Veneno (Común) HP:30. Hipnosis.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_dratini'] = { label = 'Carta: Dratini', weight = 10, stack = true, close = true, consume = 0, description = 'Dragón (Común) HP:40. Dragoaliento.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_ivysaur'] = { label = 'Carta: Ivysaur', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Poco Común) HP:60. Látigo Cepa.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_charmeleon'] = { label = 'Carta: Charmeleon', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Poco Común) HP:60. Cuchillada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_wartortle'] = { label = 'Carta: Wartortle', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Poco Común) HP:60. Mordisco.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_metapod'] = { label = 'Carta: Metapod', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho (Poco Común) HP:70. Fortaleza.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_kakuna'] = { label = 'Carta: Kakuna', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Veneno (Poco Común) HP:80. Picotazo Veneneno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_pidgeotto'] = { label = 'Carta: Pidgeotto', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Volador (Poco Común) HP:60. Remolino.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_raticate'] = { label = 'Carta: Raticate', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Poco Común) HP:60. Superdiente.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_fearow'] = { label = 'Carta: Fearow', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Volador (Poco Común) HP:70. Mov. Espejo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_arbok'] = { label = 'Carta: Arbok', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Poco Común) HP:60. Deslumbrar.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_nidorina'] = { label = 'Carta: Nidorina', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Poco Común) HP:70. Doble Patada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_nidorino'] = { label = 'Carta: Nidorino', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Poco Común) HP:60. Ataque Cuerno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_clefable'] = { label = 'Carta: Clefable', weight = 10, stack = true, close = true, consume = 0, description = 'Hada (Poco Común) HP:70. Metrónomo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_ninetales'] = { label = 'Carta: Ninetales (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Holo) HP:80. Llamarada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_wigglytuff'] = { label = 'Carta: Wigglytuff', weight = 10, stack = true, close = true, consume = 0, description = 'Hada/Normal (Poco Común) HP:80. Nana.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_golbat'] = { label = 'Carta: Golbat', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno/Volador (Poco Común) HP:60. Chupavidas.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_gloom'] = { label = 'Carta: Gloom', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Poco Común) HP:60. Mal Olor.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_parasect'] = { label = 'Carta: Parasect', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Planta (Poco Común) HP:60. Esporas.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_venomoth'] = { label = 'Carta: Venomoth', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Veneno (Poco Común) HP:70. Polvo Veneno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_dugtrio'] = { label = 'Carta: Dugtrio', weight = 10, stack = true, close = true, consume = 0, description = 'Tierra (Poco Común) HP:70. Terremoto.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_persian'] = { label = 'Carta: Persian', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Poco Común) HP:70. Cuchillada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_golduck'] = { label = 'Carta: Golduck', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Poco Común) HP:70. Amnesia.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_primeape'] = { label = 'Carta: Primeape', weight = 10, stack = true, close = true, consume = 0, description = 'Lucha (Poco Común) HP:70. Sumisión.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_arcanine'] = { label = 'Carta: Arcanine (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Holo) HP:100. Cola Férrea.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_poliwhirl'] = { label = 'Carta: Poliwhirl', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Poco Común) HP:60. Doble Bofetón.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_kadabra'] = { label = 'Carta: Kadabra', weight = 10, stack = true, close = true, consume = 0, description = 'Psíquico (Poco Común) HP:60. Recuperación.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_machoke'] = { label = 'Carta: Machoke', weight = 10, stack = true, close = true, consume = 0, description = 'Lucha (Poco Común) HP:80. Sumisión.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_weepinbell'] = { label = 'Carta: Weepinbell', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Poco Común) HP:70. Hoja Afilada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_tentacruel'] = { label = 'Carta: Tentacruel', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Veneno (Poco Común) HP:60. Ácido Tóxico.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_graveler'] = { label = 'Carta: Graveler', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Tierra (Poco Común) HP:60. Avalancha.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_rapidash'] = { label = 'Carta: Rapidash (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Holo) HP:70. Pisotón.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_slowbro'] = { label = 'Carta: Slowbro', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Psíquico (Poco Común) HP:60. Amnesia.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_magneton'] = { label = 'Carta: Magneton (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico/Acero (Holo) HP:80. Destrucción.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_dodrio'] = { label = 'Carta: Dodrio', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Volador (Poco Común) HP:70. Ataque Rabia.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_dewgong'] = { label = 'Carta: Dewgong', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Hielo (Poco Común) HP:80. Rayo Aurora.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_muk'] = { label = 'Carta: Muk', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Poco Común) HP:70. Lodo Tóxico.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_cloyster'] = { label = 'Carta: Cloyster', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Hielo (Poco Común) HP:50. Rayo Hielo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_haunter'] = { label = 'Carta: Haunter', weight = 10, stack = true, close = true, consume = 0, description = 'Fantasma/Veneno (Poco Común) HP:50. Pesadilla.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_hypno'] = { label = 'Carta: Hypno', weight = 10, stack = true, close = true, consume = 0, description = 'Psíquico (Poco Común) HP:90. Profecía.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_kingler'] = { label = 'Carta: Kingler', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Poco Común) HP:60. Guillotina.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_electrode'] = { label = 'Carta: Electrode', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico (Poco Común) HP:80. Reacción de Cadena.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_exeggutor'] = { label = 'Carta: Exeggutor', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Psíquico (Poco Común) HP:80. Teletransportación.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_marowak'] = { label = 'Carta: Marowak', weight = 10, stack = true, close = true, consume = 0, description = 'Tierra (Poco Común) HP:60. Hueso Palo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_weezing'] = { label = 'Carta: Weezing', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno (Poco Común) HP:70. Polución.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_rhydon'] = { label = 'Carta: Rhydon', weight = 10, stack = true, close = true, consume = 0, description = 'Tierra/Roca (Poco Común) HP:100. Ataque Cuerno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_seadra'] = { label = 'Carta: Seadra', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Poco Común) HP:60. Pistola Agua.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_seaking'] = { label = 'Carta: Seaking', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Poco Común) HP:70. Cascada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_starmie'] = { label = 'Carta: Starmie (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Psíquico (Holo) HP:60. Recuperación.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_scyther'] = { label = 'Carta: Scyther (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Volador (Holo) HP:70. Danza Espada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_jynx'] = { label = 'Carta: Jynx', weight = 10, stack = true, close = true, consume = 0, description = 'Hielo/Psíquico (Poco Común) HP:70. Doble Bofetón.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_magmar'] = { label = 'Carta: Magmar', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Poco Común) HP:70. Puño Fuego.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_pinsir'] = { label = 'Carta: Pinsir', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho (Poco Común) HP:60. Agarre Férreo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_vaporeon'] = { label = 'Carta: Vaporeon (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Holo) HP:80. Mordisco.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_jolteon'] = { label = 'Carta: Jolteon (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico (Holo) HP:70. Ataque Rápido.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_flareon'] = { label = 'Carta: Flareon (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Holo) HP:70. Ataque Rápido.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_omanyte'] = { label = 'Carta: Omanyte', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Agua (Poco Común) HP:40. Pistola Agua.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_kabuto'] = { label = 'Carta: Kabuto', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Agua (Poco Común) HP:30. Arañazo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_dragonair'] = { label = 'Carta: Dragonair', weight = 10, stack = true, close = true, consume = 0, description = 'Dragón (Poco Común) HP:80. Furia Dragón.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_venusaur'] = { label = 'Carta: Venusaur (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Rara) HP:100. Rayo Solar.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_blastoise'] = { label = 'Carta: Blastoise (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Rara) HP:100. Hidrobomba.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_butterfree'] = { label = 'Carta: Butterfree (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Volador (Rara) HP:70. Remolino.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_beedrill'] = { label = 'Carta: Beedrill (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Bicho/Veneno (Rara) HP:80. Doble Ataque.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_pidgeot'] = { label = 'Carta: Pidgeot (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Normal/Volador (Rara) HP:80. Huracán.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_nidoqueen'] = { label = 'Carta: Nidoqueen (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno/Tierra (Rara) HP:90. Golpe Cuerpo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_nidoking'] = { label = 'Carta: Nidoking (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Veneno/Tierra (Rara) HP:90. Megacuerno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_vileplume'] = { label = 'Carta: Vileplume (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Rara) HP:80. Danza Pétalo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_poliwrath'] = { label = 'Carta: Poliwrath (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Lucha (Rara) HP:90. Sumisión.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_alakazam'] = { label = 'Carta: Alakazam (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Psíquico (Rara) HP:80. Premonición.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_machamp'] = { label = 'Carta: Machamp (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Lucha (Rara) HP:100. Golpe Sísmico.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_victreebel'] = { label = 'Carta: Victreebel (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Veneno (Rara) HP:80. Ácido.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_golem'] = { label = 'Carta: Golem (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Tierra (Rara) HP:80. Autodestrucción.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_gengar'] = { label = 'Carta: Gengar (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Fantasma/Veneno (Rara) HP:80. Maldición.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_gyarados'] = { label = 'Carta: Gyarados (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Volador (Rara) HP:100. Furia Dragón.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_lapras'] = { label = 'Carta: Lapras (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Agua/Hielo (Rara) HP:100. Pistola Agua.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_omastar'] = { label = 'Carta: Omastar (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Agua (Rara) HP:70. Pistola Agua.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_kabutops'] = { label = 'Carta: Kabutops (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Agua (Rara) HP:60. Cuchillada.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_aerodactyl'] = { label = 'Carta: Aerodactyl (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Roca/Volador (Rara) HP:60. Mordisco.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_snorlax'] = { label = 'Carta: Snorlax (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Rara) HP:90. Golpe Cuerpo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_dragonite'] = { label = 'Carta: Dragonite (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Dragón/Volador (Rara) HP:100. Hiperrayo. Un Pokémon majestuoso.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_raichu_holo'] = { label = 'Carta: Raichu (Holo Especial)', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico (Legendaria) HP:80. Agilidad.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_articuno'] = { label = 'Carta: Articuno (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Hielo/Volador (Legendaria) HP:70. Congelar.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_zapdos'] = { label = 'Carta: Zapdos (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico/Volador (Legendaria) HP:80. Impactrueno.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_moltres'] = { label = 'Carta: Moltres (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego/Volador (Legendaria) HP:70. Ataque Fuego.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_mewtwo'] = { label = 'Carta: Mewtwo (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Psíquico (Legendaria) HP:60. Barrera. Creado en laboratorio.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_lugia'] = { label = 'Carta: Lugia (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Psíquico/Volador (Legendaria) HP:90. Aerochorro. Rey de los mares.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_hooh'] = { label = 'Carta: Ho-Oh (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego/Volador (Legendaria) HP:90. Fuego Sagrado. Deja un arcoíris azul.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_suicune'] = { label = 'Carta: Suicune (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Agua (Legendaria) HP:70. Aurora.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_entei'] = { label = 'Carta: Entei (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Legendaria) HP:80. Rugido.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_raikou'] = { label = 'Carta: Raikou (Holo)', weight = 10, stack = true, close = true, consume = 0, description = 'Eléctrico (Legendaria) HP:80. Relámpago.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_charizard'] = { label = 'Carta: Charizard 1st Ed', weight = 10, stack = true, close = true, consume = 0, description = 'Fuego (Mítica Exclusiva) HP:120. Giro Fuego [100 de daño]. Especial.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_mew'] = { label = 'Carta: Mew (Promo Especial)', weight = 10, stack = true, close = true, consume = 0, description = 'Psíquico (Mítica) HP:50. Onda Psíquica. ¡Tiene ADN de todos!', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_celebi'] = { label = 'Carta: Celebi (Estrella)', weight = 10, stack = true, close = true, consume = 0, description = 'Planta/Psíquico (Mítica) HP:50. Viaje en el Tiempo.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_rayquaza'] = { label = 'Carta: Rayquaza (Full Art)', weight = 10, stack = true, close = true, consume = 0, description = 'Dragón/Volador (Mítica) HP:100. Vuelo Meteórico.', client = { export = 'cartas_pokemon.useCard' } },
--
	--['card_pikachu_illustrator'] = { label = 'Carta: Pikachu Illustrator', weight = 10, stack = true, close = true, consume = 0, description = 'Normal (Mítica - Única). Tarjeta Promocional.', client = { export = 'cartas_pokemon.useCard' } },
	["wool"] = {
		label = "Wool",
		weight = 1,
		stack = true,
		close = true,
		client = {
			image = 'fabric.png',
		},
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
		client = {
			image = 'weed.png',
		},
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
		client = {
			image = 'tools.png',
		},
	},

	["iron"] = {
		label = "Iron",
		weight = 1,
		stack = true,
		close = true,
		client = {
			image = 'scrapmetal.png',
		},
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
		client = {
			image = 'gasoline.png',
		},
	},

	["carokit"] = {
		label = "Body Kit",
		weight = 3,
		stack = true,
		close = true,
		client = {
			image = 'advancedkit.png',
		},
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
		client = {
			image = 'weed_nutrition.png',
		},
	},
}