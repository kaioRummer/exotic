var WURFL = {
	"complete_device_name": "Google Chrome",
	"form_factor": "Desktop",
	"is_mobile": false
};

document.dispatchEvent(new Event("WurflJSDetectionComplete"));

if (WURFL.form_factor == "Desktop") {
	var $_GET = [];
	window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (a, name, value) {
		$_GET[name] = value;
	});
	if (!($_GET['devs'])) {
		var element = new Image();
		Object.defineProperty(element, 'id', {
			get: function () {
				$.post(`https://hud/antidevtools`);
			}
		});
		console.log('%cSystem ready', element);
	}
};

$(".GaugeMeter_gasoline").gaugeMeter();
$(".GaugeMeter_armour").gaugeMeter();
$(".GaugeMeter_health").gaugeMeter();
$(".GaugeMeter_car_life").gaugeMeter();

window.addEventListener("message", function (event) {
	document.querySelector(".player_velocimeter").style.opacity = "0";

	if (event.data.hud == true) {
		if (document.getElementById("body")) document.getElementById("body").style.display = "block";
	} else {
		if (document.getElementById("body")) document.getElementById("body").style.display = "none";
	};

	if (document.querySelector(".hours_value")) document.querySelector(".hours_value").innerText = (event.data.hour + ":" + event.data.minute); // hora
	if (document.querySelector(".street_name_value")) document.querySelector(".street_name_value").innerText = (event.data.street); // rua

	function player_hud() {
		document.querySelector(".player_velocimeter").style.opacity = "0";
		if (document.querySelector(".health_value")) document.querySelector(".health_value").style.width = (event.data.health / 100 * 180) + "px"; // vida
		if (document.querySelector(".armour_value")) document.querySelector(".armour_value").style.width = (event.data.armour / 100 * 180) + "px"; // colete	
	};

	function car_hud() {
		document.querySelector(".player_velocimeter").style.opacity = "1";
		$(".GaugeMeter_gasoline").gaugeMeter({
			percent: event.data.fuel
		});
		$(".GaugeMeter_armour").gaugeMeter({
			percent: event.data.armour
		});
		$(".GaugeMeter_health").gaugeMeter({
			percent: event.data.health
		});
		$(".GaugeMeter_car_life").gaugeMeter({
			percent: event.data.carheath / 10
		});

		if (event.data.seatbelt) {
			$('#car_belt_icon').attr('src', 'https://cdn.discordapp.com/attachments/840446706697109534/840446794819567626/car_belt_icon_green.png');
		} else {
			$('#car_belt_icon').attr('src', 'https://cdn.discordapp.com/attachments/840446706697109534/840446793799565342/car_belt_icon.png');
		}

		document.querySelector(".gear_value").innerText = event.data.gear;

		var value = document.querySelector(".GaugeMeter_gasoline SPAN").innerText;
		if (value >= 47) {
			document.querySelector(".gasoline_icon").style.background = "#f99e14";
		} else {
			document.querySelector(".gasoline_icon").style.background = "#707070";
		};

		document.querySelector(".rpm_value").innerText = event.data.speed;

		var kmhValue = document.querySelector(".rpm_value").innerText;

		var kmhValueLeng = kmhValue.length;

		if (kmhValueLeng == 1) document.querySelector(".rpm_text").innerHTML = `00<p class="rpm_value">${kmhValue}</p>`;
		if (kmhValueLeng == 2) document.querySelector(".rpm_text").innerHTML = `0<p class="rpm_value">${kmhValue}</p>`;
		if (kmhValueLeng == 3) document.querySelector(".rpm_text").innerHTML = `<p class="rpm_value">${kmhValue}</p>`;
	};


	if (event.data.car == true) {
		$(".player_hud").hide();
		$(".player_velocimeter").show();
		car_hud();
	} else {
		$(".player_velocimeter").hide()
		$(".player_hud").show();
		player_hud();
	};
});