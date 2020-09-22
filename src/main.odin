package main;

import "core:fmt"
import "core:runtime"
import "core:math"
import "core:time"
import "core:strconv"
import "core:strings"
import "core:mem"
import "core:os"

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
	render();

	ft_stop(frame_time);
	ft_sleep(frame_time, 1.0/60.0);

	pfps = fps_calc(pfps, frame_time^);
}













render :: proc() {
	kinc.g4_begin(0);
	kinc.g4_clear(kinc.CLEAR_COLOR, kinc.WHITE, 0.0, 0);

	kinc.g4_set_pipeline(&pipeline);
	kinc.g4_set_vertex_buffer(&vertices);
	kinc.g4_set_index_buffer(&indices);
	kinc.g4_draw_indexed_vertices();

	kinc.g4_end(0);
	kinc.g4_swap_buffers();
}


VS_SRC := #load("simple.vert.glsl");
FS_SRC := #load("simple.frag.glsl");

pipeline: kinc.Pipeline = ---;
vertices: kinc.Vertex_Buffer = ---;
indices: kinc.Index_Buffer = ---;
init :: proc() {

	// image.h
	size := kinc.image_size_from_file("assets/tileset.png");
	data := mem.alloc(auto_cast size);

	image: kinc.Image;
	if kinc.image_init_from_file(&image, data, "assets/tileset.png") != 0 {
		//fmt.println(image);
		//loaded image
	}


	vertex_shader: kinc.Shader;
	kinc.g4_shader_init(&vertex_shader, &VS_SRC[0], auto_cast len(VS_SRC), .VERTEX);
	fragment_shader: kinc.Shader;
	kinc.g4_shader_init(&fragment_shader, &FS_SRC[0], auto_cast len(FS_SRC), .FRAGMENT);

	structure: kinc.Vertex_Structure = ---;
	kinc.g4_vertex_structure_init(&structure);
	kinc.g4_vertex_structure_add(&structure, "pos", .FLOAT3);

	kinc.g4_pipeline_init(&pipeline);
	pipeline.vertex_shader = &vertex_shader;
	pipeline.fragment_shader = &fragment_shader;
	pipeline.input_layout[0] = &structure;
	pipeline.input_layout[1] = nil;
	kinc.g4_pipeline_compile(&pipeline);

	kinc.g4_vertex_buffer_init(&vertices, 3, &structure, .STATIC, 0);
	v := kinc.g4_vertex_buffer_lock_all(&vertices);
	{
		mem.ptr_offset(v, 0)^ = -1;
		mem.ptr_offset(v, 1)^ = -1;
		mem.ptr_offset(v, 2)^ = 0.5;
		mem.ptr_offset(v, 3)^ = 1;
		mem.ptr_offset(v, 4)^ = -1;
		mem.ptr_offset(v, 5)^ = 0.5;
		mem.ptr_offset(v, 6)^ = -1;
		mem.ptr_offset(v, 7)^ = 1;
		mem.ptr_offset(v, 8)^ = 0.5;
		kinc.g4_vertex_buffer_unlock_all(&vertices);
	}

	kinc.g4_index_buffer_init(&indices, 3, .FORMAT_32BIT);
	i := kinc.g4_index_buffer_lock(&indices);
	{
		mem.ptr_offset(i, 0)^ = 0;
		mem.ptr_offset(i, 1)^ = 1;
		mem.ptr_offset(i, 2)^ = 2;
		kinc.g4_index_buffer_unlock(&indices);
	}

	kinc.keyboard_key_down_callback = key_up;

}

key_up :: proc "c" (p: i32) {
	context = runtime.default_context();

	
}

update :: proc(dt: f64) {
	/* fmt.println("not fixed update", dt); */
}

fixed_update :: proc(dt: f64) {
	/* fmt.println(pfps.fps); */
}


















main :: proc() {
	kinc.init("Hello from Odin!", 1280, 800, nil, nil);

	kinc.window_show(0);
	//kinc.window_change_features(0, kinc.WINDOW_FEATURE_MINIMIZABLE);


	frame_time = new(Frame_Time);
	kinc.set_update_callback(auto_cast internal_update);

	init();

	last = kinc.time();
	kinc.start();
}
