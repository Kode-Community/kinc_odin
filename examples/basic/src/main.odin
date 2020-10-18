package main;

import "core:fmt"
import "core:runtime"
import "core:math"
import "core:time"
import "core:strconv"
import "core:strings"
import "core:mem"
import "core:os"
import "core:math/linalg"
import _c "core:c"

import "../../../kinc"

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
	if render_context == nil do return;

	if render_context.pipeline == nil do return;

		kinc.g4_begin(0);
		kinc.g4_clear(kinc.CLEAR_COLOR, kinc.RED, 0.0, 0);

		kinc.g4_set_pipeline(render_context.pipeline);


			push_triangle(
				0, 800, 0, 0, 1280, 0, //pos
				0, 1, 0, 0, 1, 0 //uv
			);
			push_triangle(
				0, 800, 1280, 0, 1280, 800, //pos
				0, 1, 1, 0, 1, 1 //uv
			);

		flush();
		/* kinc.g4_draw_indexed_vertices(); */

		kinc.g4_end(0);
		kinc.g4_swap_buffers();
}

mouse_pressed :: proc "c" (window: _c.int, button: _c.int, x: _c.int, y: _c.int) {
	context = runtime.default_context();

	fmt.println(x, y);
}

gamepad_axis :: proc "c" (gamepad: _c.int, axis: _c.int, value: _c.float) {
	context = runtime.default_context();
}
gamepad_button :: proc "c" (gamepad: _c.int, button: _c.int, value: _c.float) {
	context = runtime.default_context();
}


VS_SRC := #load("../../shared_assets/simple.vert.d3d11");
FS_SRC := #load("../../shared_assets/simple.frag.d3d11");

DPV :: 9;
DPT :: DPV * 3;

render_context: ^Render_Context;

Render_Context :: struct {
	pipeline: ^kinc.Pipeline,
	vertices: kinc.Vertex_Buffer,
	indices: kinc.Index_Buffer,

	textures: map[string]kinc.Texture,
	texture_unit: kinc.Texture_Unit,

	projection_location: kinc.Constant_Location,
	camera_location: kinc.Constant_Location,

	current_triangle: int,
	current_ptr: ^f32,
}

flush :: proc() {
	using render_context;
	if current_triangle != 0 {
		kinc.g4_vertex_buffer_unlock(&vertices, i32(current_triangle)*3);

		camera_matrix: kinc.Matrix4x4;
		camera_matrix.m[0] = 1;
		camera_matrix.m[5] = 1;
		camera_matrix.m[10] = 1;
		camera_matrix.m[15] = 1;

		kinc.g4_set_vertex_buffer(&render_context.vertices);
		kinc.g4_set_index_buffer(&render_context.indices);
		kinc.g4_set_texture(texture_unit, &textures["tileset"]);
		kinc.g4_set_matrix4(render_context.projection_location, &projection);
		kinc.g4_set_matrix4(render_context.camera_location, &camera_matrix);

		kinc.g4_draw_indexed_vertices_from_to(0, i32(current_triangle)*3);

		current_triangle = 0;

		current_ptr = kinc.g4_vertex_buffer_lock_all(&vertices);
	}
}

push_triangle :: proc(x1, y1, x2, y2, x3, y3, u1, v1, u2, v2, u3, v3: f32) {
	using render_context;

	push_vertex(0, x1, y1, u1, v1, 1, 1, 1, 1);
	push_vertex(9, x2, y2, u2, v2, 1, 1, 1, 1);
	push_vertex(18, x3, y3, u3, v3, 1, 1, 1, 1);

	current_triangle += 1;
}

push_vertex :: proc(offset: int, x, y, u, v, r, g, b, a: f32) {
	using render_context;
	t := DPT * current_triangle + offset;

	mem.ptr_offset(current_ptr, t + 0)^ = x;
	mem.ptr_offset(current_ptr, t + 1)^ = y;
	mem.ptr_offset(current_ptr, t + 2)^ = -5;
	mem.ptr_offset(current_ptr, t + 3)^ = u;
	mem.ptr_offset(current_ptr, t + 4)^ = v;
	mem.ptr_offset(current_ptr, t + 5)^ = r;
	mem.ptr_offset(current_ptr, t + 6)^ = g;
	mem.ptr_offset(current_ptr, t + 7)^ = b;
	mem.ptr_offset(current_ptr, t + 8)^ = a;
}

ortho :: proc(left, right, bottom, top, near, far: _c.float) -> (m:kinc.Matrix4x4) {
	m.m = transmute([16]_c.float) linalg.matrix_ortho3d(left, right, bottom, top, near, far);
	return;
}
projection := ortho(0.0, 1280.0, 800, 0, 0.1, 1000.0);

key_press :: proc "cdecl" (key: _c.int) {
	context = runtime.default_context();
	fmt.println(key);
}

key_down :: proc "c" (key: _c.int) {
	context = runtime.default_context();
	fmt.println("Key Down: ", key);
}

init :: proc() {

	render_context = new(Render_Context);
	render_context.pipeline = new(kinc.Pipeline);
	using render_context;

	size := kinc.image_size_from_file("../shared_assets/kinc.png");
	data := mem.alloc(auto_cast size);

	image: kinc.Image;
	if kinc.image_init_from_file(&image, data, "../shared_assets/kinc.png") != 0 {
		textures["tileset"] = {};
		kinc.g4_texture_init_from_image(&textures["tileset"], &image);
		fmt.println(image.width, image.height);
	}

	kinc.mouse_press_callback^ = mouse_pressed;
	kinc.keyboard_key_down_callback^ = key_down;

	vertex_shader := new(kinc.Shader); //= ---;
	{
		kinc.g4_shader_init(vertex_shader, &VS_SRC[0], auto_cast len(VS_SRC), .VERTEX);
	}

	fragment_shader:= new(kinc.Shader); //= ---;
	{
		kinc.g4_shader_init(fragment_shader, &FS_SRC[0], auto_cast len(FS_SRC), .FRAGMENT);
	}

	structure := new(kinc.Vertex_Structure);
	kinc.g4_vertex_structure_init(structure);
	kinc.g4_vertex_structure_add(structure, "pos", .FLOAT3);
	kinc.g4_vertex_structure_add(structure, "uv", .FLOAT2);
	kinc.g4_vertex_structure_add(structure, "color", .FLOAT4);

	kinc.g4_pipeline_init(pipeline);
	pipeline.vertex_shader = vertex_shader;
	pipeline.fragment_shader = fragment_shader;
	pipeline.input_layout[0] = structure;
	pipeline.input_layout[1] = nil;
	kinc.g4_pipeline_compile(pipeline);
	fmt.println(pipeline);
	
	texture_unit = kinc.g4_pipeline_get_texture_unit(pipeline, "tex");
	projection_location = kinc.g4_pipeline_get_constant_location(pipeline, "projection");
	camera_location = kinc.g4_pipeline_get_constant_location(pipeline, "camera");

	kinc.g4_vertex_buffer_init(&vertices, 1000 * 3, structure, .DYNAMIC, 0);
	current_ptr = kinc.g4_vertex_buffer_lock_all(&vertices);
	//vertices.impl.initialized = true;

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
	fmt.println(p);
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


	init();
	kinc.set_update_callback(auto_cast internal_update);

	last = kinc.time();
	kinc.start();
}
