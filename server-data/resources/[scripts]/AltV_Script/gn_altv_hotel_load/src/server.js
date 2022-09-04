/**
 * @author Trackoad
 * @link https://gitlab.com/Trackoad
 */

const idColshape = `fezu354if165115611345561e35hufaezaMelonDeaufaffnfbhea4153ufqef`;

import AltServer from 'alt-server';
import Config from '../config.json';

for (let i = 0; i < Config.levels; i++) {
	const colshape = new AltServer.ColshapeCylinder(Config['start-pos'].x, Config['start-pos'].y, Config['start-pos'].z + i * 4, Config.radius, 3);
	colshape.playersOnly = true;
	colshape.level = i + 1;
	colshape.idColshape = idColshape;
}

AltServer.on('playerConnect', player => {
	AltServer.emitClient(player, 'config::init', Config);
});

AltServer.on('entityEnterColshape', (colshape, player) => {
	if (colshape.idColshape === idColshape) {
		AltServer.emitClient(player, 'load::level', colshape.level);
	}
});