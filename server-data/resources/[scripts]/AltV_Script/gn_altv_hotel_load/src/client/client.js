/**
 * @author Trackoad
 * @link https://gitlab.com/Trackoad
 */

import AltClient from 'alt-client';
import Game from 'natives';

/** @type {import('../../config.json')} */
let globalConfig;

let currentLevel = 0;

/**
 * @param {'load' | 'unload'} type
 * @param {number} level
 */
const loadUnloadIpl = (type, level) => {
	const cb = type === 'load' ? AltClient.requestIpl : AltClient.removeIpl;
	[
		`int_hotel_corridor0${level}`,
		`int_hotel_doubleroom${level}01`,
		`int_hotel_doubleroom${level}02`,
		`int_hotel_doubleroom${level}03`,
		`int_hotel_doubleroom${level}04`,
		`int_hotel_doubleroom${level}05`,
		`int_hotel_doubleroom${level}06`,
		`int_hotel_room${level}01`,
		`int_hotel_room${level}02`,
		`int_hotel_room${level}03`,
		`int_hotel_room${level}04`,
		`int_hotel_room${level}05`,
		`int_hotel_room${level}06`,
		`int_hotel_room${level}07`,
		`int_hotel_room${level}08`,
		`int_hotel_room${level}09`,
		`int_hotel_room${level}10`,
		`int_hotel_room${level}11`,
		`int_hotel_room${level}12`,
		`int_hotel_room${level}13`,
		`int_hotel_room${level}14`,
		`int_hotel_room${level}15`,
		`int_hotel_room${level}16`,
		`int_hotel_room${level}17`,
		`int_hotel_room${level}18`,
		`int_hotel_room${level}19`,
		`int_hotel_room${level}20`,
		`int_hotel_room${level}21`,
		`int_hotel_room${level}22`,
		`int_hotel_room${level}23`,
		`int_hotel_room${level}24`,
	].forEach(action => cb(action));
};

AltClient.onServer('config::init', config => {
	globalConfig = config;
	for (let index = 1; index <= globalConfig.levels; index++) {
		loadUnloadIpl('unload', index);
	}
});

AltClient.onServer('load::level', level => {
	if (currentLevel === level) {
		return;
	}
	if (currentLevel) {
		loadUnloadIpl('unload', currentLevel);
	}
	currentLevel = level;
	loadUnloadIpl('load', currentLevel);
});