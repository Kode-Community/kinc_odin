package main;

import "core:fmt"
import "core:runtime"
import "core:math"
import "core:time"
import "core:strconv"
import "core:mem"

import "kinc"


Fps_Direct :: struct {
	counter: u32,
	fps: u32,
	last: f64,
}

fps_calc :: proc(fp: Fps_Direct, fr: Frame_Time) -> Fps_Direct {
	fps := fp;
	fuck := fr.current - fps.last;
	fps.counter += 1;
	if fuck >= 1.0 {
		fps.fps = fps.counter;
		fps.counter = 0;
		fps.last = fr.current;
	}
	return fps;
}


Frame_Time :: struct {
	current: f64,
	delta: f64,
	last: f64,
	update: f64,
	draw: f64,
}

ft_start :: proc(ft: ^Frame_Time) {
	ft.current = kinc.time();
	ft.update = ft.current - ft.last;
	ft.last = ft.current;
}

ft_stop :: proc(ft: ^Frame_Time) {
	ft.current = kinc.time();
	ft.draw = ft.current - ft.last;
	ft.last = ft.current;

	ft.delta = ft.update + ft.draw;
}

ft_sleep :: proc(ft: ^Frame_Time, fps: f64) {
	if ft.delta < fps {
		ms := (fps - ft.delta) * 1000;
		sleep_time := ms * 1000000;
		time.sleep(auto_cast (sleep_time));

		ft.current = kinc.time();
		ft.delta += ft.current - ft.last;
		ft.last = ft.current;
	}
}

last: f64 = 0;
accumulator: f64 = 0;
dt: f64 = 0.01;

frame_time: ^Frame_Time;
pfps: Fps_Direct;

internal_update :: proc "c" () {

	context = runtime.default_context();

	ft_start(frame_time);
	ftime: f64 = frame_time.current - last;
	if ftime > 0.25 {
		ftime = 0.25;
	}
	last = frame_time.current;
	accumulator += ftime;

	update(frame_time.delta);

	for accumulator >= dt {
		fixed_update(dt);
		accumulator -= dt;
	}
	//draw

	ft_stop(frame_time);
	ft_sleep(frame_time, 1.0/60.0);

	pfps = fps_calc(pfps, frame_time^);
}

init :: proc() {
	// window.h
	window: i32;
	window_mode := kinc.window_get_mode(window);

	// image.h
	size := kinc.image_size_from_file("assets/tileset.png");
	data := mem.alloc(auto_cast size);

	image: kinc.Image;
	if kinc.image_init_from_file(&image, data, "assets/tileset.png") != 0 {
		fmt.println(image);
	}

	// display.h
	display := kinc.primary_display();
	display_info := kinc.display_current_mode(display);

	// color.h
	r, g, b, a: f32;
	kinc.color_components(kinc.GREEN, &r, &g, &b, &a);
}

update :: proc(dt: f64) {
	/* fmt.println("not fixed update", dt); */
}

fixed_update :: proc(dt: f64) {
	/* fmt.println(pfps.fps); */
}








main :: proc() {
	kinc.init("Hello from Odin!", 1280, 800, nil, nil);

	kinc.window_change_features(0, kinc.WINDOW_FEATURE_MINIMIZABLE);


	frame_time = new(Frame_Time);
	kinc.set_update_callback(auto_cast internal_update);

	init();

	last = kinc.time();
	kinc.start();
}
