package main;

import "core:fmt"
import "core:runtime"
import "core:math"
import "core:time"
import "core:strconv"
import "core:strings"
import "core:mem"
import "core:os"
import _c "core:c"

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

	kinc.g4_set_matrix4(matrix, &projection);

	kinc.g4_set_vertex_buffer(&vertices);
	kinc.g4_set_index_buffer(&indices);
	kinc.g4_set_texture(texture_unit, &textures["tileset"]);

		push_triangle(
			0, 0, 1280, 0, 0, 800,
			0, 0, 1, 0, 0, 1
		);
		push_triangle(
			0, 800, 1280, 0, 1280, 800,
			0, 1, 1, 0, 1, 1
		
		);

	flush();
	/* kinc.g4_draw_indexed_vertices(); */

	kinc.g4_end(0);
	kinc.g4_swap_buffers();
}

mouse_pressed :: proc "c" (window: _c.int, button: _c.int, x: _c.int, y: _c.int) {
	context = runtime.default_context();

}

gamepad_axis :: proc "c" (gamepad: _c.int, axis: _c.int, value: _c.float) {
	context = runtime.default_context();
}
gamepad_button :: proc "c" (gamepad: _c.int, button: _c.int, value: _c.float) {
	context = runtime.default_context();
}


VS_SRC := #load("simple.vert.glsl");
FS_SRC := #load("simple.frag.glsl");

pipeline: kinc.Pipeline = ---;
vertices: kinc.Vertex_Buffer = ---;
indices: kinc.Index_Buffer = ---;

textures: map[string]kinc.Texture;

texture_unit: kinc.Texture_Unit;
matrix: kinc.Constant_Location;

current_triangle := 0;
current_ptr: ^f32;
DPT :: 15;

flush :: proc() {
	kinc.g4_vertex_buffer_unlock(&vertices, i32(current_triangle)*3);

	kinc.g4_draw_indexed_vertices_from_to(0, i32(current_triangle)*3);

	current_triangle = 0;

	current_ptr = kinc.g4_vertex_buffer_lock_all(&vertices);
}

push_triangle :: proc(x1, y1, x2, y2, x3, y3, u1, v1, u2, v2, u3, v3: f32) {
	t := DPT * current_triangle;
	v := current_ptr;

	mem.ptr_offset(v, t + 0)^ = x1;
	mem.ptr_offset(v, t + 1)^ = y1;
			mem.ptr_offset(v, t + 2)^ = -5;
		mem.ptr_offset(v, t + 3)^ = u1;
		mem.ptr_offset(v, t + 4)^ = v1;
	mem.ptr_offset(v, t + 5)^ = x2;
	mem.ptr_offset(v, t + 6)^ = y2;
			mem.ptr_offset(v, t + 7)^ = -5;
		mem.ptr_offset(v, t + 8)^ = u2;
		mem.ptr_offset(v, t + 9)^ = v2;
	mem.ptr_offset(v, t + 10)^ = x3;
	mem.ptr_offset(v, t + 11)^ = y3;
			mem.ptr_offset(v, t + 12)^ = -5;
		mem.ptr_offset(v, t + 13)^ = u3;
		mem.ptr_offset(v, t + 14)^ = v3;

	current_triangle += 1;
}

ortho :: proc(left, right, bottom, top, near, far: _c.float) -> kinc.Matrix4x4 {
	tx := -(right + left) / (right - left);
	ty := -(top + bottom) / (top - bottom);
	tz := -(far + near) / (far - near);

	return {
		[16]_c.float{
			2 / (right - left), 0, 0, tx,
			0, 2.0 / (top - bottom), 0, ty,
			0, 0, -2 / (far - near), tz,
			0, 0, 0, 1
		}
	};
	
}
projection := ortho(0, 1280, 800, 0, 0.1, 1000);

init :: proc() {

	// image.h
	size := kinc.image_size_from_file("assets/tileset.png");
	data := mem.alloc(auto_cast size);

	image: kinc.Image;
	if kinc.image_init_from_file(&image, data, "assets/tileset.png") != 0 {
		textures["tileset"] = {};
		kinc.g4_texture_init_from_image(&textures["tileset"], &image);
	}

	/* kinc.mouse_press_callback = mouse_pressed; */
	/* kinc.gamepad_axis_callback = gamepad_axis; */
	/* kinc.gamepad_button_callback = gamepad_button; */
	/* kinc.keyboard_key_down_callback = key_up; */

	vertex_shader: kinc.Shader = ---;
	{
		kinc.g4_shader_init(&vertex_shader, &VS_SRC[0], auto_cast len(VS_SRC), .VERTEX);
	}

	fragment_shader: kinc.Shader = ---;
	{
		kinc.g4_shader_init(&fragment_shader, &FS_SRC[0], auto_cast len(FS_SRC), .FRAGMENT);
	}

	structure: kinc.Vertex_Structure;
	kinc.g4_vertex_structure_init(&structure);
	kinc.g4_vertex_structure_add(&structure, "pos", .FLOAT3);
	kinc.g4_vertex_structure_add(&structure, "uv", .FLOAT2);

	kinc.g4_pipeline_init(&pipeline);
	pipeline.vertex_shader = &vertex_shader;
	pipeline.fragment_shader = &fragment_shader;
	pipeline.input_layout[0] = &structure;
	pipeline.input_layout[1] = nil;
	kinc.g4_pipeline_compile(&pipeline);
	
	texture_unit = kinc.g4_pipeline_get_texture_unit(&pipeline, "texture");
	matrix = kinc.g4_pipeline_get_constant_location(&pipeline, "projection");

	kinc.g4_vertex_buffer_init(&vertices, 1000 * 3, &structure, .DYNAMIC, 0);
	current_ptr = kinc.g4_vertex_buffer_lock_all(&vertices);
	/* vertices.impl.initialized = true; */

	kinc.g4_index_buffer_init(&indices, 1000 * 3, .FORMAT_32BIT);
	i := kinc.g4_index_buffer_lock(&indices);
	{
		for j in 0..<1000 {
			mem.ptr_offset(i, j*3 + 0)^ = i32(j*3) + 0;
			mem.ptr_offset(i, j*3 + 1)^ = i32(j*3) + 1;
			mem.ptr_offset(i, j*3 + 2)^ = i32(j*3) + 2;
		}
		kinc.g4_index_buffer_unlock(&indices);
	}
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
