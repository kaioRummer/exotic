CREATE TABLE `pth_tablet_contratos` (
	`user_id` INT(11) NOT NULL,
	`nome` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`grupo` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`data_inicio` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`user_id`, `grupo`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
