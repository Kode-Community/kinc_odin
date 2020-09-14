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
	GRAPHICS4: NONE;
	GRAPHICS5: NONE;
	INPUT : NONE;
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
	matrix3x3_rotation_x :: proc(alpha: _c.float) -> Matrix3x3 ---;
	matrix3x3_rotation_y :: proc(alpha: _c.float) -> Matrix3x3 ---;
	matrix3x3_rotation_z :: proc(alpha: _c.float) -> Matrix3x3 ---;

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
	//keyboard_show :: proc() ---;
	//keyboard_hide :: proc() ---;
	//keyboard_active :: proc() -> _c.bool;

}
