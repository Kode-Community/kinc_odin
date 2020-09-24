package kinc;

import _c "core:c"

when ODIN_OS == "windows" {
	foreign import kinc "../../kinc_windows/Kinc.lib"
} else {
	//for some reason linux paths are handles from compile directory, I guess
	foreign import kinc "kinc_linux/Kinc.so"
};


/*
	AUDIO1 : NONE;
		>>> AUDIO2 : DONE;
	COMPUTE : NONE;
	GRAPHICS1 : NONE;
		>>> GRAPHICS4: DONE;
	GRAPHICS5: NONE;
		>>> INPUT : SEMIDONE; { pen.h rotation.h surface.h acceleration.h are missing}
		>>> IO : DONE;
		>>> MATH : DONE;
		>>> NETOWRK : DONE;
	THREADS : NONE;
		>>> VR: DONE;
		>>> BASE : DONE;
*/

@(default_calling_convention = "c")
@(link_prefix = "kinc_")
foreign kinc {
	// -----------------------------------------------------------------------------
	//
	// system.h
	//
	// -----------------------------------------------------------------------------
	init :: proc (name: cstring, width: _c.int, height: _c.int, window_options: ^Window_Options, fo: rawptr) -> int ---;	
	application_name :: proc () -> cstring ---;
	set_application_name :: proc (str: cstring) ---;
	width :: proc () -> _c.int ---;
	height :: proc () -> _c.int ---;

	internal_handle_messages :: proc () -> _c.bool ---;
	load_url :: proc (url: cstring) ---;
	system_id :: proc () -> cstring ---;
	internal_save_path :: proc () -> cstring ---;
	video_formats :: proc () -> ^cstring ---;
	language :: proc () -> cstring ---;
	vibrate :: proc (ms: _c.int) ---;

	safe_zone :: proc () -> _c.float ---;
	automatic_safe_zone :: proc () -> _c.bool ---;
	set_safe_zone :: proc (value: _c.float) ---;

	frequency :: proc () -> _c.double ---;
	// kinc_ticks_t kinc_timestamp()
	time :: proc () -> _c.double ---;
	
	run :: proc (value: rawptr) ---;

	start :: proc () ---;
	stop :: proc () ---;

	login :: proc() ---;
	waiting_for_login :: proc() -> _c.bool ---;
	unlock_achievement :: proc(id: _c.int) ---;
	disallow_user_change :: proc() ---;
	allow_user_change :: proc() ---;

	set_keep_screen_on :: proc(on: _c.bool) ---;

	set_update_callback :: proc (value: rawptr) ---;
	set_foreground_callback :: proc (value: rawptr) ---;
	set_resume_callback :: proc (value: rawptr) ---;
	set_pause_callback :: proc (value: rawptr) ---;
	set_background_callback :: proc (value: rawptr) ---;
	set_shutdown_callback :: proc (value: rawptr) ---;
	set_drop_files_callback :: proc (value: rawptr) ---;
	set_cut_callback :: proc (value: rawptr) ---;
	set_copy_callback :: proc (value: rawptr) ---;
	set_paste_callback :: proc (value: rawptr) ---;
	set_login_callback :: proc (value: rawptr) ---;
	set_logout_callback :: proc (value: rawptr) ---;
	// -----------------------------------------------------------------------------
	//
	// window.h
	//
	// -----------------------------------------------------------------------------
	window_create :: proc(win: ^Window_Options, frame: ^Framebuffer_Options) -> _c.int ---;
	window_destroy :: proc(window_index: _c.int) ---;
	count_windows :: proc() -> _c.int ---;
	window_resize :: proc(window_index: _c.int, width: _c.int, height: _c.int) ---;
	window_move :: proc(window_index: _c.int, x: _c.int, y: _c.int) ---;
	window_change_mode :: proc (window_index: _c.int, mode: Window_Mode) ---;
	window_change_features :: proc (window_index: _c.int, features: _c.int) ---;
	window_change_framebuffer :: proc (window_index: _c.int, frame: ^Framebuffer_Options) ---;

	window_x :: proc(window_index: _c.int) -> _c.int ---;
	window_y :: proc(window_index: _c.int) -> _c.int ---;
	window_width :: proc(window_index: _c.int) -> _c.int ---;
	window_height :: proc(window_index: _c.int) -> _c.int ---;
	window_display :: proc(window_index: _c.int) -> _c.int ---;
	window_get_mode :: proc(window_index: _c.int) -> Window_Mode ---;
	window_show :: proc(window_index: _c.int) ---;
	window_hide :: proc(window_index: _c.int) ---;
	window_set_title :: proc (window_index: _c.int, title: cstring) ---;
	window_set_resize_callback :: proc(window_index: _c.int, callback : proc "c" (x: _c.int, y: _c.int, data: rawptr), data: rawptr) ---;
	window_set_ppi_changed_callback :: proc(window_index: _c.int, callback : proc "c" (ppi: _c.int, data: rawptr), data: rawptr) ---;
	window_vsynced :: proc(window_index: _c.int) -> _c.bool ---;
	// -----------------------------------------------------------------------------
	//
	// image.h
	//
	// -----------------------------------------------------------------------------
	image_init :: proc(image: ^Image, memory: rawptr, width: _c.int, height: _c.int, format: Image_Format) -> _c.size_t ---;
	image_init3d :: proc(image: ^Image, memory: rawptr, width: _c.int, height: _c.int, depth: _c.int, format: Image_Format) -> _c.size_t ---;
	image_size_from_file :: proc(filename: cstring) -> _c.size_t ---;
	image_size_from_callbacks :: proc(callbacks: Image_Read_Callbacks, user_data: rawptr, filename: cstring) -> _c.size_t ---;
	image_init_from_file :: proc(image: ^Image, memory: rawptr, filename: cstring) -> _c.size_t ---;
	image_init_from_callbacks :: proc(image: ^Image, memory: rawptr, callbacks: Image_Read_Callbacks, user_data: rawptr, filename: cstring) -> _c.size_t ---;

	image_init_from_bytes :: proc(image: ^Image, data: rawptr, width: _c.int, height: _c.int, format: Image_Format) ---;
	image_init_from_bytes3d :: proc(image: ^Image, data: rawptr, width: _c.int, height: _c.int, depth: _c.int, format: Image_Format) ---;
	image_destroy :: proc(image: ^Image) ---;
	image_at :: proc(image: ^Image, x: _c.int, y: _c.int) ---;
	image_get_pixels :: proc(image: ^Image) -> u8 ---; //uint8_t i hope is u8

	image_format_sizeof :: proc(format: Image_Format) -> _c.int ---;
	// -----------------------------------------------------------------------------
	//
	// display.h
	//
	// -----------------------------------------------------------------------------
	display_init :: proc() ---;
	primary_display :: proc() -> _c.int ---;
	count_displays :: proc() -> _c.int ---;
	display_available :: proc(display_index: _c.int) -> _c.bool ---;
	display_name :: proc(display_index: _c.int) -> cstring ---;
	display_current_mode :: proc(display_index: _c.int) -> Display_Mode ---;
	display_count_available_modes :: proc(display_index: _c.int) -> _c.int ---;
	display_available_mode :: proc(display_index: _c.int, mode_index: _c.int) -> Display_Mode ---;
	// -----------------------------------------------------------------------------
	//
	// color.h
	//
	// -----------------------------------------------------------------------------
	color_components :: proc(color: _c.uint, red: ^_c.float, green: ^_c.float, blue: ^_c.float, alpha: ^_c.float) ---;
	// -----------------------------------------------------------------------------
	//
	// socket.h
	//
	// -----------------------------------------------------------------------------
	socket_init :: proc(socket: ^Socket) ---;
	socket_destroy :: proc(socket: ^Socket) ---;
	socket_open :: proc(socket: ^Socket, port: _c.int) -> _c.bool ---;
	socket_set_broadcast_enabled :: proc(socket: ^Socket, enabled: _c.bool) ---;
	socket_send :: proc(socket: ^Socket, address: _c.uint, port: _c.int, data: rawptr, size: _c.int) ---;
	socket_send_url :: proc(socket: ^Socket, address: _c.uint, url: cstring, data: rawptr, size: _c.int) ---;
	socket_receive :: proc(socket: ^Socket, data: ^u8, max_size: _c.int, from_address: ^_c.uint, from_port: ^_c.uint) -> _c.int ---;
	url_to_int :: proc(url: cstring, port: _c.int) -> _c.uint ---;
	// -----------------------------------------------------------------------------
	//
	// http.h
	//
	// -----------------------------------------------------------------------------
	http_request :: proc(url: cstring, path: cstring, data: cstring, port: _c.int, secure: _c.bool, method: _c.int, header: cstring, callback: Http_Callback, callbackdata: rawptr) ---;
	// -----------------------------------------------------------------------------
	//
	// audio2.h
	//
	// -----------------------------------------------------------------------------
	audio2_init :: proc() ---;
	audio2_set_callback :: proc(callback: Audio2_Callback) ---;
	audio2_set_sample_rate_callback :: proc(callback: Audio2_Sample_Rate_Callback) ---;
	audio2_samples_per_second: _c.int;
	audio2_update :: proc() ---;
	audio2_shutdown :: proc() ---;
	// -----------------------------------------------------------------------------
	//
	// vrinterface.h
	//
	// -----------------------------------------------------------------------------
	vr_interface_init :: proc(hinst: rawptr, title: cstring, window_class_name: cstring) -> rawptr ---;
	vr_interface_begin :: proc() ---;
	vr_interface_begin_render :: proc(eye: _c.int) ---;
	vr_interface_end_render :: proc(eye: _c.int) ---;
	vr_interface_get_sensor_state :: proc(eye: _c.int) -> Vr_Sensor_State ---;
	vr_interface_get_controller :: proc(index: _c.int) -> Vr_Pos_State ---;
	vr_interface_warp_swap :: proc() ---;
	vr_interface_update_tracking_origin :: proc(origin: Tracking_Origin) ---;
	vr_interface_reset_hmd_pose :: proc() ---;
	vr_interface_ovr_shutdown :: proc() ---;
	// -----------------------------------------------------------------------------
	//
	// vector.h
	//
	// -----------------------------------------------------------------------------
		//nothing
	// -----------------------------------------------------------------------------
	//
	// matrix.h
	//
	// -----------------------------------------------------------------------------
	matrix3x3_get :: proc(matrix: ^Matrix3x3, x: _c.int, y: _c.int) -> _c.float ---;
	matrix3x3_set :: proc(matrix: ^Matrix3x3, x: _c.int, y: _c.int, value: _c.float) ---;
	matrix3x3_transpose :: proc(matrix: ^Matrix3x3) ---;
	matrix3x3_identity :: proc() -> Matrix3x3 ---;

	matrix3x_rotation_x :: proc(alpha: _c.float) -> Matrix3x3 ---;
	matrix3x_rotation_y :: proc(alpha: _c.float) -> Matrix3x3 ---;
	matrix3x_rotation_z :: proc(alpha: _c.float) -> Matrix3x3 ---;

	matrix4x4_get :: proc(matrix: ^Matrix4x4, x: _c.int, y: _c.int) -> _c.float ---;
	matrix4x4_set :: proc(matrix: ^Matrix4x4, x: _c.int, y: _c.int, value: _c.float) ---;
	matrix4x4_transpose :: proc(matrix: ^Matrix4x4) ---;
	matrix4x4_multiply :: proc(a: ^Matrix4x4, b: ^Matrix4x4) ---;
	// -----------------------------------------------------------------------------
	//
	// quaternion.h
	//
	// -----------------------------------------------------------------------------
		//nothing
	// -----------------------------------------------------------------------------
	//
	// random.h
	//
	// -----------------------------------------------------------------------------
	random_init :: proc(seed: _c.int) ---;
	random_get :: proc() -> _c.int ---;
	random_get_max :: proc(max: _c.int) -> _c.int ---;
	random_get_in :: proc(min: _c.int, max: _c.int) -> _c.int ---;
	// -----------------------------------------------------------------------------
	//
	// math/core.h
	//
	// -----------------------------------------------------------------------------
	sin :: proc(value: _c.float) -> _c.float ---;
	cos :: proc(value: _c.float) -> _c.float ---;
	tan :: proc(value: _c.float) -> _c.float ---;
	cot :: proc(value: _c.float) -> _c.float ---;
	round :: proc(value: _c.float) -> _c.float ---;
	ceil :: proc(value: _c.float) -> _c.float ---;
	pow :: proc(value: _c.float) -> _c.float ---;
	max_float :: proc() -> _c.float ---;
	sqrt :: proc(value: _c.float) -> _c.float ---;
	abs :: proc(value: _c.float) -> _c.float ---;
	asin :: proc(value: _c.float) -> _c.float ---;
	acos :: proc(value: _c.float) -> _c.float ---;
	atan :: proc(value: _c.float) -> _c.float ---;
	atan2 :: proc(y: _c.float, x: _c.float) -> _c.float ---;
	floor :: proc(value: _c.float) -> _c.float ---;
	mod :: proc(numer: _c.float, denom: _c.float) -> _c.float ---;
	exp :: proc(exponent: _c.float) -> _c.float ---;
	min :: proc(a: _c.float, b: _c.float) -> _c.float ---;
	max :: proc(a: _c.float, b: _c.float) -> _c.float ---;
	maxi :: proc(a: _c.int, b: _c.int) -> _c.int ---;
	mini :: proc(a: _c.int, b: _c.int) -> _c.int ---;
	clamp :: proc(value: _c.float, min_value: _c.float, max_value: _c.float) -> _c.int ---;
	// -----------------------------------------------------------------------------
	//
	// filewriter.h
	//
	// -----------------------------------------------------------------------------
	file_writer_open :: proc(writer: ^File_Writer, filepath: cstring) -> _c.bool ---;
	file_writer_write :: proc(writer: ^File_Writer, data: rawptr, size: _c.int) ---;
	file_writer_close :: proc(writer: ^File_Writer) ---;
	// -----------------------------------------------------------------------------
	//
	// filereader.h
	//
	// -----------------------------------------------------------------------------
	file_reader_open :: proc(reader: ^File_Reader, filename: cstring, type: _c.int) -> _c.bool ---;
	file_reader_close :: proc(reader: ^File_Reader) ---;
	file_reader_read :: proc(reader: ^File_Reader, data: rawptr, size: _c.size_t) -> _c.int ---;
	file_reader_size :: proc(reader: ^File_Reader) -> _c.size_t ---;
	file_reader_pos :: proc(reader: ^File_Reader) -> _c.int ---;
	file_reader_seek :: proc(reader: ^File_Reader, pos: _c.int) ---;

	//uint8_t = u8
	file_read_f32le :: proc(data: ^u8) -> _c.float ---;
	file_read_f32be :: proc(data: ^u8) -> _c.float ---;

	// u64 = uint64_t
	file_read_u64le :: proc(data: ^u8) -> u64 ---;
	file_read_u64be :: proc(data: ^u8) -> u64 ---;

	file_read_s64le :: proc(data: ^u8) -> i64 ---;
	file_read_s64be :: proc(data: ^u8) -> i64 ---;

	file_read_u32le :: proc(data: ^u8) -> u32 ---;
	file_read_u32be :: proc(data: ^u8) -> u32 ---;

	file_read_s32le :: proc(data: ^u8) -> i32 ---;
	file_read_s32be :: proc(data: ^u8) -> i32 ---;

	file_read_u16le :: proc(data: ^u8) -> u16 ---;
	file_read_u16be :: proc(data: ^u8) -> u16 ---;

	file_read_s16le :: proc(data: ^u8) -> i16 ---;
	file_read_s16be :: proc(data: ^u8) -> i16 ---;

	file_read_u8 :: proc(data: ^u8) -> u8 ---;
	file_read_i8 :: proc(data: ^u8) -> i8 ---;
	// -----------------------------------------------------------------------------
	//
	// keyboard.h
	//
	// -----------------------------------------------------------------------------
	keyboard_show :: proc() ---;
	keyboard_hide :: proc() ---;
	keyboard_active :: proc() -> _c.bool ---;

	keyboard_key_down_callback: Key_Down_Callback;
	keyboard_key_up_callback: Key_Up_Callback;
	keyboard_key_press_callback: Key_Press_Callback;

	internal_keyboard_trigger_key_down :: proc(key_code: _c.int) ---;
	internal_keyboard_trigger_key_up :: proc(key_code: _c.int) ---;
	internal_keyboard_trigger_key_press :: proc(key_code: _c.int) ---;

	// -----------------------------------------------------------------------------
	//
	// mouse.h
	//
	// -----------------------------------------------------------------------------
	mouse_can_lock :: proc(window: _c.int) -> _c.bool ---;
	mouse_is_locked :: proc(window: _c.int) -> _c.bool ---;
	mouse_lock :: proc(window: _c.int) ---;
	mouse_unlock :: proc(window: _c.int) ---;

	mouse_set_cursor :: proc(cursor: _c.int) ---;

	mouse_show :: proc() ---;
	mouse_hide :: proc() ---;
	mouse_set_position :: proc(window: _c.int, x: _c.int, y: _c.int) ---;
	mouse_get_positiion :: proc(window: _c.int, x: ^_c.int, y: ^_c.int) ---;

	mouse_press_callback: #type proc "c" (window: _c.int, button: _c.int, x: _c.int, y: _c.int);
	mouse_release_callback: #type proc "c" (window: _c.int, button: _c.int, x: _c.int, y: _c.int);
	mouse_move_callback: #type proc "c" (window: _c.int, x: _c.int, y: _c.int, movement_x: _c.int, movement_y: _c.int);
	mouse_scroll_callback: #type proc "c" (window: _c.int, delta: _c.int);
	mouse_enter_window_callback: #type proc "c" (window: _c.int);
	mouse_leave_window_callback: #type proc "c" (window: _c.int);

	// -----------------------------------------------------------------------------
	//
	// gamepad.h
	//
	// -----------------------------------------------------------------------------
	gamepad_vendor :: proc(gamepad: _c.int) -> cstring ---;
	gamepad_product_name :: proc(gamepad: _c.int) -> cstring ---;
	gamepad_connected :: proc(gamepad: _c.int) -> _c.bool ---;

	gamepad_axis_callback: #type proc "c" (gamepad: _c.int, axis: _c.int, value: _c.float);
	gamepad_button_callback: #type proc "c" (gamepad: _c.int, button: _c.int, value: _c.float);
	

	// -----------------------------------------------------------------------------
	//
	// graphics4.h
	//
	// -----------------------------------------------------------------------------
	g4_init :: proc(window: _c.int, depth_buffer_bits: _c.int, stencil_buffer_bits: _c.int, vsync: _c.bool) ---;
	g4_destroy :: proc(window: _c.int) ---;

	g4_flush :: proc() ---;

	g4_begin :: proc(window: _c.int) ---;
	g4_end :: proc(window: _c.int) ---;

	g4_swap_buffers :: proc() -> _c.bool ---;

	g4_clear :: proc(flags: _c.uint color: _c.uint, depth: _c.float, stencil: _c.int) ---;
	g4_viewport :: proc(x: _c.int, y: _c.int, width: _c.int, height: _c.int) ---;
	g4_scissor :: proc(x: _c.int, y: _c.int, width: _c.int, height: _c.int) ---;
	g4_disable_scissor :: proc() ---;
	g4_draw_indexed_vertices :: proc() ---;
	g4_draw_indexed_vertices_from_to :: proc(start: _c.int, count: _c.int) ---;
	g4_draw_indexed_vertices_from_to_from :: proc(start: _c.int, count: _c.int, vertex_offset: _c.int) ---;
	g4_draw_indexed_vertices_instanced :: proc(instance_count: _c.int) ---;
	g4_draw_indexed_vertices_instanced_from_to :: proc(instance_count: _c.int, start: _c.int, count: _c.int) ---;
	g4_set_texture_addressing :: proc(unit: Texture_Unit, dir: Texture_Direction, addressing: Texture_Addressing) ---;
	g4_set_texture3d_addressing :: proc(unit: Texture_Unit, dir: Texture_Direction, addressing: Texture_Addressing) ---;
	g4_set_pipeline :: proc(pipeline: ^Pipeline) ---;
	g4_set_stencil_reference_value :: proc(value: _c.int) ---;
	g4_set_texture_operation :: proc(operation: Texture_Operation, arg1: Texture_Argument, arg2: Texture_Argument) ---;

	g4_set_int :: proc(location: Constant_Location, value: _c.int) ---;
	g4_set_int2 :: proc(location: Constant_Location, value1: _c.int, value2: _c.int) ---;
	g4_set_int3 :: proc(location: Constant_Location, value1: _c.int, value2: _c.int, value3: _c.int) ---;
	g4_set_int4 :: proc(location: Constant_Location, value1: _c.int, value2: _c.int, value3: _c.int, value4: _c.int) ---;
	g4_set_ints :: proc(location: Constant_Location, values: ^_c.float, count: _c.int) ---;

	g4_set_bool :: proc(location: Constant_Location, value: _c.bool) ---;

	g4_set_matrix3 :: proc(location: Constant_Location, value: ^Matrix3x3) ---;
	g4_set_matrix4 :: proc(location: Constant_Location, value: ^Matrix4x4) ---;

	g4_set_texture_magnification_filter :: proc(unit: Texture_Unit, filter: Texture_Filter) ---;
	g4_set_texture3d_magnification_filter :: proc(unit: Texture_Unit, filter: Texture_Filter) ---;

	g4_set_texture_minification_filter :: proc(unit: Texture_Unit, filter: Texture_Filter) ---;
	g4_set_texture3d_minification_filter :: proc(unit: Texture_Unit, filter: Texture_Filter) ---;

	g4_set_texture_mipmap_filter :: proc(unit: Texture_Unit, filter: Mipmap_Filter) ---;
	g4_set_texture3d_mipmap_filter :: proc(unit: Texture_Unit, filter: Mipmap_Filter) ---;

	g4_set_texture_compare_mode :: proc(unit: Texture_Unit, enabled: _c.bool) ---;
	g4_set_cubemap_compare_mode :: proc(unit: Texture_Unit, enabled: _c.bool) ---;

	g4_max_bound_textures :: proc() -> _c.int ---;
	g4_render_targets_inverted_y :: proc() -> _c.bool ---;
	g4_non_pow2_textures_supported :: proc() -> _c.bool ---;

	g4_restore_render_target :: proc() ---;
	g4_set_render_targets :: proc(targets: ^^Render_Target, count: _c.int) ---;
	g4_set_render_target_face :: proc(texture: ^Render_Target, face: _c.int) ---;

	g4_set_texture :: proc(unit: Texture_Unit, texture: ^Texture) ---;
	g4_set_image_texture :: proc(unit: Texture_Unit, texture: ^Texture) ---;
	
	g4_init_occlusion_query :: proc(occlusion_query: ^_c.uint) -> _c.bool ---;
	g4_delete_occlusion_query :: proc(occlusion_query: ^_c.uint) ---;
	g4_start_occlusion_query :: proc(occlusion_query: ^_c.uint) ---;
	g4_end_occlusion_query :: proc(occlusion_query: ^_c.uint) ---;

	g4_are_query_results_available :: proc(occlusion_query: ^_c.uint) -> _c.bool ---;
	g4_get_query_results :: proc(occlusion_query: ^_c.uint, pixel_count: ^_c.uint) -> _c.bool ---;
	g4_set_texture_array :: proc(unit: Texture_Unit, array: ^Texture_Array) ---;
	g4_antialiasing_samples :: proc() -> _c.int ---;
	g4_set_antialiasing_samples :: proc(samples: _c.int) ---;
	// -----------------------------------------------------------------------------
	//
	// indexbuffer.h
	//
	// -----------------------------------------------------------------------------
	g4_index_buffer_init :: proc(buffer: ^Index_Buffer, count: _c.int, format: Index_Buffer_Format) ---;
	g4_index_buffer_destroy :: proc(buffer: ^Index_Buffer) ---;
	g4_index_buffer_lock :: proc(buffer: ^Index_Buffer) -> ^_c.int ---;
	g4_index_buffer_unlock :: proc(buffer: ^Index_Buffer) ---;
	g4_index_buffer_count :: proc(buffer: ^Index_Buffer) -> ^_c.int ---;
	
	g4_set_index_buffer :: proc(buffer: ^Index_Buffer) ---;
	// -----------------------------------------------------------------------------
	//
	// vertexbuffer.h
	//
	// -----------------------------------------------------------------------------
	g4_vertex_buffer_init :: proc(buffer: ^Vertex_Buffer, count: _c.int, structure: ^Vertex_Structure, usage: Usage, instance_data_step_rate: _c.int) ---;
	g4_vertex_buffer_destroy :: proc(buffer: ^Vertex_Buffer) ---;
	g4_vertex_buffer_lock_all :: proc(buffer: ^Vertex_Buffer) -> ^_c.float ---;
	g4_vertex_buffer_lock :: proc(buffer: ^Vertex_Buffer, start: _c.int, count: _c.int) -> ^_c.float ---;
	g4_vertex_buffer_unlock_all :: proc(buffer: ^Vertex_Buffer) ---;
	g4_vertex_buffer_unlock :: proc(buffer: ^Vertex_Buffer, count: _c.int) ---;
	g4_vertex_buffer_count :: proc(buffer: ^Vertex_Buffer) -> _c.int ---;
	g4_vertex_buffer_stride :: proc(buffer: ^Vertex_Buffer) -> _c.int ---;

	internal_g4_vertex_buffer_set :: proc(buffer: ^Vertex_Buffer, offset: _c.int) -> _c.int ---;

	g4_set_vertex_buffers :: proc(buffer: ^^Vertex_Buffer, count: _c.int) ---;
	g4_set_vertex_buffer :: proc(buffer: ^Vertex_Buffer) ---;
	// -----------------------------------------------------------------------------
	//
	// vertexstructure.h
	//
	// -----------------------------------------------------------------------------
	g4_vertex_element_init :: proc(element: ^Vertex_Element, name: cstring, data: Vertex_Data) ---;
	g4_vertex_structure_init :: proc(structure: ^Vertex_Structure) ---;
	g4_vertex_structure_add :: proc(structure: ^Vertex_Structure, name: cstring, data: Vertex_Data) ---;
	// -----------------------------------------------------------------------------
	//
	// pipeline.h
	//
	// -----------------------------------------------------------------------------
	g4_pipeline_init :: proc(state: ^Pipeline) ---;
	g4_pipeline_destroy :: proc(state: ^Pipeline) ---;
	g4_pipeline_compile :: proc(state: ^Pipeline) ---;
	g4_pipeline_get_constant_location :: proc(state: ^Pipeline, name: cstring) -> Constant_Location ---;
	g4_pipeline_get_texture_unit :: proc(state: ^Pipeline, name:cstring) -> Texture_Unit ---;
	// -----------------------------------------------------------------------------
	//
	// texture.h
	//
	// -----------------------------------------------------------------------------
	g4_texture_init :: proc(texture: ^Texture, width: _c.int, height: _c.int, format: Image_Format) ---;
	g4_texture_init3d :: proc(texture: ^Texture, width: _c.int, height: _c.int, depth: _c.int, format: Image_Format) ---;
	g4_texture_init_from_image :: proc(texture: ^Texture, image: ^Image) ---;
	g4_texture_init_from_image3d :: proc(texture: ^Texture, image: ^Image) ---;
	g4_texture_destroy :: proc(texture: ^Texture) ---;
	//ANDROID >>> g4_texture_init_from_id
	g4_texture_lock :: proc(texture: ^Texture) -> _c.uchar ---;
	g4_texture_clear :: proc(texture: ^Texture, x: _c.int, y: _c.int, z: _c.int, width: _c.int, height: _c.int, depth: _c.int, color: _c.uint) ---;
	//IOS||MACOS >>>> texture_upload
	g4_texture_generate_mipmaps :: proc(texture: ^Texture, levels: _c.int) ---;
	g4_texture_set_mipmap :: proc(texture: ^Texture, mipmap: ^Image, level: _c.int) ---;
	g4_texture_stride :: proc(texture: ^Texture) -> _c.int ---;
	// -----------------------------------------------------------------------------
	//
	// shader.h
	//
	// -----------------------------------------------------------------------------
	g4_shader_init :: proc(shader: ^Shader, data: rawptr, length: _c.size_t, type: Shader_Type) ---;
	g4_shader_init_from_source :: proc(shader: ^Shader, source: cstring, type: Shader_Type) ---;
	g4_shader_destroy :: proc(shader: ^Shader) ---;
	// -----------------------------------------------------------------------------
	//
	// rendertarget.h
	//
	// -----------------------------------------------------------------------------
	g4_render_target_init :: proc(render_target: ^Render_Target, width, height, depth_buffer_bits: _c.int, antialiasing: _c.bool, format: Render_Target_Format, stencill_buffer_bits, context_id: _c.int) ---;
	g4_render_target_init_cube :: proc(render_target: ^Render_Target, cube_map_size, depth_buffer_bits: _c.int, antialiasing: _c.bool, format: Render_Target_Format, stencill_buffer_bits, context_id: _c.int) ---;
	g4_render_target_destroy :: proc(render_target: ^Render_Target) ---;
	g4_render_target_use_color_as_texture :: proc(render_target: ^Render_Target, unit: Texture_Unit) ---;
	g4_render_target_use_depth_as_texture :: proc(render_target: ^Render_Target, unit: Texture_Unit) ---;
	g4_render_target_depth_stencil_from :: proc(render_target: ^Render_Target, source: ^Render_Target) ---;
	g4_render_target_get_pixels :: proc(render_target: ^Render_Target, data: ^u8) ---;
	g4_render_target_generate_mipmaps :: proc(render_target: ^Render_Target, levels: _c.int) ---;
	// -----------------------------------------------------------------------------
	//
	// texturearray.h
	//
	// -----------------------------------------------------------------------------
	g4_texture_array_init :: proc(array: ^Texture_Array, textures: ^Image, count: _c.int) ---;
	g4_texture_array_destroy :: proc(array: ^Texture_Array) ---;

	// -----------------------------------------------------------------------------
	//
	// sound.h
	//
	// -----------------------------------------------------------------------------
	audio1_sound_create :: proc(filename: cstring) -> ^Audio1_Sound ---;
	audio1_sound_destroy :: proc(sound: ^Audio1_Sound) ---;
	audio1_sound_volume :: proc(sound: ^Audio1_Sound) -> _c.float ---;
	audio1_sound_set_volume :: proc(sound: ^Audio1_Sound, value: _c.float) ---;
	// -----------------------------------------------------------------------------
	//
	// audio1/audio.h
	//
	// -----------------------------------------------------------------------------
	audio1_init :: proc() ---;
	audio1_play_sound :: proc(sound: ^Audio1_Sound, loop: _c.bool, pitch: _c.float, unique: _c.bool) -> Audio1_Channel ---;

	audio1_stop_sound :: proc(sound: ^Audio1_Sound) ---;
	audio1_play_sound_stream :: proc(stream: ^Audio1_Sound_Stream) ---;
	audio1_stop_sound_stream :: proc(stream: ^Audio1_Sound_Stream) ---;
	/* audio1_play_video_sound_stream :: proc(stream: ^Audio1_Video_Sound_Stream) ---; */
	/* audio1_stop_video_sound_stream :: proc(stream: ^Audio1_Video_Sound_Stream) ---; */
	// -----------------------------------------------------------------------------
	//
	// soundstream.h
	//
	// -----------------------------------------------------------------------------
	audio1_sound_stream_cretae :: proc(filename: cstring, looping: _c.bool) -> ^Audio1_Sound_Stream ---;
	audio1_sound_stream_next_sample :: proc(stream: ^Audio1_Sound_Stream) -> _c.float ---;
	audio1_sound_stream_channels :: proc(stream: ^Audio1_Sound_Stream) -> _c.float ---;
	audio1_sound_stream_sample_rate :: proc(stream: ^Audio1_Sound_Stream) -> _c.float ---;
	audio1_sound_stream_looping :: proc(stream: ^Audio1_Sound_Stream) -> _c.bool ---;
	audio1_sound_stream_set_looping :: proc(stream: ^Audio1_Sound_Stream, loop: _c.bool) ---;
	audio1_sound_stream_ended :: proc(stream: ^Audio1_Sound_Stream) -> _c.bool ---;
	audio1_sound_stream_length :: proc(stream: ^Audio1_Sound_Stream) -> _c.float ---;
	audio1_sound_stream_position :: proc(stream: ^Audio1_Sound_Stream) -> _c.float ---;
	audio1_sound_stream_reset :: proc(stream: ^Audio1_Sound_Stream) ---;
	audio1_sound_stream_volume :: proc(stream: ^Audio1_Sound_Stream) -> _c.float ---;
	audio1_sound_stream_set_volume :: proc(stream: ^Audio1_Sound_Stream, value: _c.float) ---;



}
