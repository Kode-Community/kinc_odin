package kinc;

import _c "core:c"

Graphics_Api :: enum {
	DX9,
	DX11,
	GL,
}

GRAPHICS_API :: Graphics_Api.GL;

// -----------------------------------------------------------------------------
//
// window.h
//
// -----------------------------------------------------------------------------
Window_Mode :: enum _c.int {
	WINDOW,
	FULLSCREEN,
	EXCLUSIVE_FULLSCREEN,
}

WINDOW_FEATURE_RESIZABLE:   _c.int: 1;
WINDOW_FEATURE_MINIMIZABLE: _c.int: 2;
WINDOW_FEATURE_MAXIMIZABLE: _c.int: 4;
WINDOW_FEATURE_BORDERLESS:  _c.int: 8;
WINDOW_FEATURE_ON_TOP:      _c.int: 16;

Window_Options :: struct  {
	title: cstring,

	x: _c.int,
	y: _c.int,
	width: _c.int,
	height: _c.int,
	display_index: _c.int,

	visible: _c.bool,
	window_features: _c.int,
	mode: Window_Mode,
}

Framebuffer_Options :: struct  {
	frequency: _c.int,
	vertical_sync: _c.bool,
	color_bits: _c.int,
	depth_bits: _c.int,
	stencil_bits: _c.int,
	samples_per_pixel: _c.int,
}
// -----------------------------------------------------------------------------
//
// image.h
//
// -----------------------------------------------------------------------------
Image_Compression :: enum _c.uint {
	NONE,
	DXT5,
	ASTC,
	PVRTC
}
Image_Format :: enum _c.int {
	RGBA32,
	GREY8,
	RGB24,
	RGBA128,
	RGBA64,
	A32,
	BGRA32,
	A16
}

Image :: struct  {
	width: _c.int,
	height: _c.int,
	depth: _c.int,
	format: Image_Format,
	internal_format: _c.uint,
	compression: Image_Compression,
	data: rawptr,
	data_size: _c.int,
}

Image_Read_Callbacks :: struct  {
	read: proc "c" (user_data: rawptr, data: rawptr, size: _c.size_t) -> _c.int,
	seek: proc "c" (user_data: rawptr, pos: _c.int),
	pos: proc "c" (user_data: rawptr) -> _c.int,
	size: proc "c" (user_data: rawptr) -> _c.size_t,
}

// -----------------------------------------------------------------------------
//
// display.h
//
// -----------------------------------------------------------------------------

Display_Mode :: struct  {
	x: _c.int,
	y: _c.int,
	width: _c.int,
	height: _c.int,
	pixels_per_inch: _c.int,
	frequency: _c.int,
	bits_per_pixel: _c.int,
}
// -----------------------------------------------------------------------------
//
// color.h
//
// -----------------------------------------------------------------------------

BLACK :: 0xff000000;
WHITE :: 0xffffffff;
RED :: 0xffff0000;
BLUE :: 0xff0000ff;
GREEN :: 0xff00ff00;
YELLOW :: 0xffffff00;
CYAN :: 0xff00ffff;

// -----------------------------------------------------------------------------
//
// socket.h
//
// -----------------------------------------------------------------------------
Socket :: struct  {
	handle: _c.int,
}
// -----------------------------------------------------------------------------
//
// http.h
//
// -----------------------------------------------------------------------------
HTTP_GET :: 0;
HTTP_POST :: 1;
HTTP_PUT :: 2;
HTTP_DELETE :: 3;

Http_Callback :: proc "c" (error: _c.int, response: _c.int, body: string, callbackdata: rawptr);

// -----------------------------------------------------------------------------
//
// audio2.h
//
// -----------------------------------------------------------------------------
Audio2_Buffer_Format :: struct  {
	channels: _c.int,
	samples_per_second: _c.int,
	bits_per_sample: _c.int,
}

Audio2_Buffer :: struct  {
	format: Audio2_Buffer_Format,
	data: ^u8, // uint8_t
	data_size: _c.int,
	read_location: _c.int,
	write_location: _c.int,
}

Audio2_Callback :: proc "c" (buffer: ^Audio2_Buffer, samples: _c.int);
Audio2_Sample_Rate_Callback :: proc "c" ();
// -----------------------------------------------------------------------------
//
// vrinterface.h
//
// -----------------------------------------------------------------------------
Tracking_Origin :: enum _c.int {
	STAND,
	SIT,
}

Tracked_Device :: enum _c.int {
	HMD,
	CONTROLLER,
	VIVE_TRACKER,
}

Vr_Pose :: struct  {
	orientation: Quaternion,
	position: Vector3,

	eye: Matrix4x4,
	projection: Matrix4x4,

	left: _c.float,
	right: _c.float,
	bottom: _c.float,
	top: _c.float,
}

Vr_Pos_State :: struct  {
	vr_pos: Vr_Pose,
	angular_velocity: Vector3,
	linear_velocity: Vector3,
	angular_acceleration: Vector3,
	linearAcceleration: Vector3,

	tracked_device: Tracked_Device,

	is_visible: _c.bool,
	hmd_presenting: _c.bool,
	hmd_mounted: _c.bool,
	display_lost: _c.bool,
	should_quit: _c.bool,
	should_recenter: _c.bool,
}

Vr_Sensor_State :: struct  {
	pose: Vr_Pos_State,
}
// -----------------------------------------------------------------------------
//
// vector.h
//
// -----------------------------------------------------------------------------
Vector2 :: struct  {
	x: _c.float,
	y: _c.float,
}
Vector3 :: struct  {
	x: _c.float,
	y: _c.float,
	z: _c.float,
}
Vector4 :: struct  {
	x: _c.float,
	y: _c.float,
	z: _c.float,
	w: _c.float,
}
// -----------------------------------------------------------------------------
//
// matrix.h
//
// -----------------------------------------------------------------------------
Matrix3x3 :: struct  {
	m: [9] _c.float,
}

Matrix4x4 :: struct  {
	m: [16] _c.float,
}
// -----------------------------------------------------------------------------
//
// quaternion.h
//
// -----------------------------------------------------------------------------
Quaternion :: struct  {
	x: _c.float,
	y: _c.float,
	z: _c.float,
	w: _c.float,
}
// -----------------------------------------------------------------------------
//
// random.h
//
// -----------------------------------------------------------------------------
	//nothing
// -----------------------------------------------------------------------------
//
// math/core.h
//
// -----------------------------------------------------------------------------
KINC_PI :: 3.141592654;
KINC_TAU :: 6.283185307;
// -----------------------------------------------------------------------------
//
// filewriter.h
//
// -----------------------------------------------------------------------------
File_Writer :: struct  {
	file: rawptr,
	filename: cstring,
	mounted: _c.bool,
}
// -----------------------------------------------------------------------------
//
// filereader.h
//
// -----------------------------------------------------------------------------
// there is a lot of crossplatform code (switch, sony, android)
// i didn't port it :)
FILE_TYPE_ASSET :: 0;
FILE_TYPE_SAVE :: 1;
File_Reader :: struct  {
	file: rawptr,
	size: _c.int,
	type: _c.int,
	mode: _c.int,
	mounted: _c.bool,
}
// -----------------------------------------------------------------------------
//
// keyboard.h
//
// -----------------------------------------------------------------------------
KEY_UNKNOWN            :: 0;
KEY_BACK               :: 1;// Android
KEY_CANCEL             :: 3;
KEY_HELP               :: 6;
KEY_BACKSPACE          :: 8;
KEY_TAB                :: 9;
KEY_CLEAR              :: 12;
KEY_RETURN             :: 13;
KEY_SHIFT              :: 16;
KEY_CONTROL            :: 17;
KEY_ALT                :: 18;
KEY_PAUSE              :: 19;
KEY_CAPS_LOCK          :: 20;
KEY_KANA               :: 21;
KEY_HANGUL             :: 21;
KEY_EISU               :: 22;
KEY_JUNJA              :: 23;
KEY_FINAL              :: 24;
KEY_HANJA              :: 25;
KEY_KANJI              :: 25;
KEY_ESCAPE             :: 27;
KEY_CONVERT            :: 28;
KEY_NON_CONVERT        :: 29;
KEY_ACCEPT             :: 30;
KEY_MODE_CHANGE        :: 31;
KEY_SPACE              :: 32;
KEY_PAGE_UP            :: 33;
KEY_PAGE_DOWN          :: 34;
KEY_END                :: 35;
KEY_HOME               :: 36;
KEY_LEFT               :: 37;
KEY_UP                 :: 38;
KEY_RIGHT              :: 39;
KEY_DOWN               :: 40;
KEY_SELECT             :: 41;
KEY_PRINT              :: 42;
KEY_EXECUTE            :: 43;
KEY_PRINT_SCREEN       :: 44;
KEY_INSERT             :: 45;
KEY_DELETE             :: 46;
KEY_0                  :: 48;
KEY_1                  :: 49;
KEY_2                  :: 50;
KEY_3                  :: 51;
KEY_4                  :: 52;
KEY_5                  :: 53;
KEY_6                  :: 54;
KEY_7                  :: 55;
KEY_8                  :: 56;
KEY_9                  :: 57;
KEY_COLON              :: 58;
KEY_SEMICOLON          :: 59;
KEY_LESS_THAN          :: 60;
KEY_EQUALS             :: 61;
KEY_GREATER_THAN       :: 62;
KEY_QUESTIONMARK       :: 63;
KEY_AT                 :: 64;
KEY_A                  :: 65;
KEY_B                  :: 66;
KEY_C                  :: 67;
KEY_D                  :: 68;
KEY_E                  :: 69;
KEY_F                  :: 70;
KEY_G                  :: 71;
KEY_H                  :: 72;
KEY_I                  :: 73;
KEY_J                  :: 74;
KEY_K                  :: 75;
KEY_L                  :: 76;
KEY_M                  :: 77;
KEY_N                  :: 78;
KEY_O                  :: 79;
KEY_P                  :: 80;
KEY_Q                  :: 81;
KEY_R                  :: 82;
KEY_S                  :: 83;
KEY_T                  :: 84;
KEY_U                  :: 85;
KEY_V                  :: 86;
KEY_W                  :: 87;
KEY_X                  :: 88;
KEY_Y                  :: 89;
KEY_Z                  :: 90;
KEY_WIN                :: 91;
KEY_CONTEXT_MENU       :: 93;
KEY_SLEEP              :: 95;
KEY_NUMPAD_0           :: 96;
KEY_NUMPAD_1           :: 97;
KEY_NUMPAD_2           :: 98;
KEY_NUMPAD_3           :: 99;
KEY_NUMPAD_4           :: 100;
KEY_NUMPAD_5           :: 101;
KEY_NUMPAD_6           :: 102;
KEY_NUMPAD_7           :: 103;
KEY_NUMPAD_8           :: 104;
KEY_NUMPAD_9           :: 105;
KEY_MULTIPLY           :: 106;
KEY_ADD                :: 107;
KEY_SEPARATOR          :: 108;
KEY_SUBTRACT           :: 109;
KEY_DECIMAL            :: 110;
KEY_DIVIDE             :: 111;
KEY_F1                 :: 112;
KEY_F2                 :: 113;
KEY_F3                 :: 114;
KEY_F4                 :: 115;
KEY_F5                 :: 116;
KEY_F6                 :: 117;
KEY_F7                 :: 118;
KEY_F8                 :: 119;
KEY_F9                 :: 120;
KEY_F10                :: 121;
KEY_F11                :: 122;
KEY_F12                :: 123;
KEY_F13                :: 124;
KEY_F14                :: 125;
KEY_F15                :: 126;
KEY_F16                :: 127;
KEY_F17                :: 128;
KEY_F18                :: 129;
KEY_F19                :: 130;
KEY_F20                :: 131;
KEY_F21                :: 132;
KEY_F22                :: 133;
KEY_F23                :: 134;
KEY_F24                :: 135;
KEY_NUM_LOCK           :: 144;
KEY_SCROLL_LOCK        :: 145;
KEY_WIN_OEM_FJ_JISHO   :: 146;
KEY_WIN_OEM_FJ_MASSHOU :: 147;
KEY_WIN_OEM_FJ_TOUROKU :: 148;
KEY_WIN_OEM_FJ_LOYA    :: 149;
KEY_WIN_OEM_FJ_ROYA    :: 150;
KEY_CIRCUMFLEX         :: 160;
KEY_EXCLAMATION        :: 161;
KEY_DOUBLE_QUOTE       :: 162;
KEY_HASH               :: 163;
KEY_DOLLAR             :: 164;
KEY_PERCENT            :: 165;
KEY_AMPERSAND          :: 166;
KEY_UNDERSCORE         :: 167;
KEY_OPEN_PAREN         :: 168;
KEY_CLOSE_PAREN        :: 169;
KEY_ASTERISK           :: 170;
KEY_PLUS               :: 171;
KEY_PIPE               :: 172;
KEY_HYPHEN_MINUS       :: 173;
KEY_OPEN_CURLY_BRACKET :: 174;
KEY_CLOSE_CURLY_BRACKET:: 175;
KEY_TILDE              :: 176;
KEY_VOLUME_MUTE        :: 181;
KEY_VOLUME_DOWN        :: 182;
KEY_VOLUME_UP          :: 183;
KEY_COMMA              :: 188;
KEY_PERIOD             :: 190;
KEY_SLASH              :: 191;
KEY_BACK_QUOTE         :: 192;
KEY_OPEN_BRACKET       :: 219;
KEY_BACK_SLASH         :: 220;
KEY_CLOSE_BRACKET      :: 221;
KEY_QUOTE              :: 222;
KEY_META               :: 224;
KEY_ALT_GR             :: 225;
KEY_WIN_ICO_HELP       :: 227;
KEY_WIN_ICO_00         :: 228;
KEY_WIN_ICO_CLEAR      :: 230;
KEY_WIN_OEM_RESET      :: 233;
KEY_WIN_OEM_JUMP       :: 234;
KEY_WIN_OEM_PA1        :: 235;
KEY_WIN_OEM_PA2        :: 236;
KEY_WIN_OEM_PA3        :: 237;
KEY_WIN_OEM_WSCTRL     :: 238;
KEY_WIN_OEM_CUSEL      :: 239;
KEY_WIN_OEM_ATTN       :: 240;
KEY_WIN_OEM_FINISH     :: 241;
KEY_WIN_OEM_COPY       :: 242;
KEY_WIN_OEM_AUTO       :: 243;
KEY_WIN_OEM_ENLW       :: 244;
KEY_WIN_OEM_BACK_TAB   :: 245;
KEY_ATTN               :: 246;
KEY_CRSEL              :: 247;
KEY_EXSEL              :: 248;
KEY_EREOF              :: 249;
KEY_PLAY               :: 250;
KEY_ZOOM               :: 251;
KEY_PA1                :: 253;
KEY_WIN_OEM_CLEAR      :: 254;

Key_Down_Callback :: proc "c" (key: _c.int);
Key_Up_Callback :: proc "c" (key: _c.int);
Key_Press_Callback :: proc "c" (character: _c.uint);

// -----------------------------------------------------------------------------
//
// graphics4.h
//
// -----------------------------------------------------------------------------
CLEAR_COLOR :: 1;
CLEAR_DEPTH :: 2;
CLEAR_STENCIL :: 4;

Texture_Addressing :: enum _c.int {
	REPEAT,
	MIRROR,
	CLAMP,
	BORDER,
}

Texture_Direction :: enum _c.int {
	U, V, W
}

Texture_Operation :: enum _c.int {
	MODULATE,
	SELECT_FIRST,
	SELECT_SECOND,
}
Texture_Argument :: enum _c.int {
	CURRENT_COLOR,
	TEXTURE_COLOR,
}
Texture_Filter :: enum _c.int {
	POINT,
	LINEAR,
	ANISOTROPIC,
}

Mipmap_Filter :: enum _c.int {
	NONE,
	POINT,
	LINEAR,
}
// -----------------------------------------------------------------------------
//
// textureunit.h
//
// -----------------------------------------------------------------------------
Texture_Unit :: struct  {
	impl: Texture_Unit_Impl,
}
// -----------------------------------------------------------------------------
//
// constantlocatioin.h
//
// -----------------------------------------------------------------------------
Constant_Location :: struct  {
	impl: Constant_Location_Impl,
}
// -----------------------------------------------------------------------------
//
// indexbuffer.h
//
// -----------------------------------------------------------------------------
Index_Buffer_Format :: enum _c.int {
	FORMAT_32BIT,
	FORMAT_16BIT,

}
Index_Buffer :: struct  {
	impl: Index_Buffer_Impl,
}
// -----------------------------------------------------------------------------
//
// vertexbuffer.h
//
// -----------------------------------------------------------------------------
Vertex_Buffer :: struct  {
	impl: Vertex_Buffer_Impl,
}

Usage :: enum _c.int {
	STATIC,
	DYNAMIC,
	READABLE,
}
// -----------------------------------------------------------------------------
//
// vertexstructure.h
//
// -----------------------------------------------------------------------------
MAX_VERTEX_ELEMENTS :: 16;

Vertex_Data :: enum _c.int {
	NONE,
	FLOAT1,
	FLOAT2,
	FLOAT3,
	FLOAT4,
	FLOAT4X4,
	SHORT2_NORM,
	SHORT4_NORM,
	COLOR,
}

Vertex_Element :: struct  {
	name: cstring,
	data: Vertex_Data,
}

Vertex_Structure :: struct  {
	elements: [MAX_VERTEX_ELEMENTS] Vertex_Element,
	size: _c.int,
	instance: _c.bool,
}
// -----------------------------------------------------------------------------
//
// pipeline.h
//
// -----------------------------------------------------------------------------
Blending_Operation :: enum _c.int {
	ONE,
	ZERO,
	SOURCE_ALPHA,
	DEST_ALPHA,
	INV_SOURCE_ALPHA,
	INV_DEST_ALPHA,
	SOURCE_COLOR,
	DEST_COLOR,
	INV_SOURCE_COLOR,
	INV_DEST_COLOR,
}
Compare_Mode :: enum _c.int {
	ALWAYS,
	NEVER,
	EQUAL,
	NOT_EQUAL,
	LESS,
	LESS_EQUAL,
	GREATER,
	GREATER_EQUAL,
}
Cull_Mode :: enum _c.int {
	CLOCKWISE,
	COUNTER_CLOCKWISE,
	NOTHING,
}
Stencil_Action :: enum _c.int {
	KEEP,
	ZERO,
	REPLACE,
	INCREMENT,
	INCREMENT_WRAP,
	DECREMENT,
	DECREMENT_WRAP,
	INVERT,
}

Pipeline :: struct  {
	input_layout: [16]^Vertex_Structure,
	vertex_shader: ^Shader,
	fragment_shader: ^Shader,
	geometry_shader: ^Shader,
	tessellation_control_shader: ^Shader,
	tessellation_evaluation_shader: ^Shader,

	cull_mode: Cull_Mode,

	depth_write: _c.bool,
	depth_mode: Compare_Mode,

	stencil_mode: Compare_Mode,
	stencil_both_pass: Stencil_Action,
	stencil_depth_fail: Stencil_Action,
	stencil_fail: Stencil_Action,
	stencil_reference_value: _c.int,
	stencil_read_mask: _c.int,
	stencil_write_mask: _c.int,

	blend_source: Blending_Operation,
	blend_destination: Blending_Operation,

	alpha_blend_source: Blending_Operation,
	alpha_blend_destination: Blending_Operation,

	color_write_mask_red: [8]_c.bool,
	color_write_mask_green: [8]_c.bool,
	color_write_mask_blue: [8]_c.bool,
	color_write_mask_alpha: [8]_c.bool,

	color_attachment_count: _c.int,
	color_attachment: [8]Render_Target_Format,

	depth_attachment_bits: _c.int,
	stencil_attachment_bits: _c.int,

	conservative_resterization: _c.bool,

	impl: Pipeline_Impl,
}
// -----------------------------------------------------------------------------
//
// texture.h
//
// -----------------------------------------------------------------------------
Texture :: struct  {
	tex_width: _c.int,
	tex_height: _c.int,
	tex_depth: _c.int,
	format: Image_Format,
	impl: Texture_Impl,
}
// -----------------------------------------------------------------------------
//
// shader.h
//
// -----------------------------------------------------------------------------
Shader_Type :: enum _c.int {
	FRAGMENT,
	VERTEX,
	GEOMETRY,
	TESSELLATION_CONTROL,
	TESSELLATION_EVALUATION,
}
Shader :: struct {
	impl: Shader_Impl,
}
// -----------------------------------------------------------------------------
//
// rendertarget.h
//
// -----------------------------------------------------------------------------
Render_Target_Format :: enum _c.int {
	FORMAT_32BIT,
	FORMAT_64BIT_FLOAT,
	FORMAT_32BIT_RED_FLOAT,
	FORMAT_128BIT_FLOAT,
	FORMAT_16BIT_DEPTH,
	FORMAT_8BIT_RED,
	FORMAT_16BIT_RED_FLOAT,
}
Render_Target :: struct  {
	width: _c.int,
	height: _c.int,
	tex_width: _c.int,
	tex_height: _c.int,
	context_id: _c.int,
	is_cube_map: _c.bool,
	is_depth_attachment: _c.bool,

	impl: Render_Target_Impl,
}
// -----------------------------------------------------------------------------
//
// texturearray.h
//
// -----------------------------------------------------------------------------
Texture_Array :: struct  {
	impl: Texture_Array_Impl,
}

// -----------------------------------------------------------------------------
//
// sound.h
//
// -----------------------------------------------------------------------------
Audio1_Sound :: struct {
	format: Audio2_Buffer_Format,
	left: ^i16,
	right: ^i16,
	size: _c.int,
	sample_rate_pos: _c.float,
	my_volume: _c.float,
}
// -----------------------------------------------------------------------------
//
// audio1/audio.h
//
// -----------------------------------------------------------------------------
Audio1_Channel :: struct {
	sound: ^Audio1_Sound,
	position: _c.float,
	loop: _c.bool,
	volume: _c.float,
	pitch: _c.float,
}

Audio1_Stream_Channel :: struct {
	stream: ^Audio1_Sound_Stream,
	position: _c.int,
}

/* Audio1_Video_Channel :: struct { */
/* 	stream: ^Audio1_Video_Sound_Stream, */
/* 	position: _c.int, */
/* } */
// -----------------------------------------------------------------------------
//
// soundstream.h
//
// -----------------------------------------------------------------------------
Audio1_Sound_Stream :: struct {
	vorbis: rawptr, // eeeeeh
	chans: _c.int,
	rate: _c.int,
	my_looping: _c.bool,
	my_volume: _c.float,
	decoded: _c.bool,
	rate_decoded_hack: _c.bool,
	end: _c.bool,
	samples: [2]_c.float,
	buffer: ^u8,
}






































// -----------------------------------------------------------------------------
//
// IMPLEMENTATION SHENANIGANS
//
// -----------------------------------------------------------------------------
when GRAPHICS_API == .DX11 {
	IShader_Constant :: struct {
		hash: u32,
		offset: u32,
		size: u32,
		columns: u8,
		rows: u8,
	}
	IHash_Index :: struct {
		hash: u32,
		index: u32,
	}
	Shader_Impl :: struct {
		constants: [64] IShader_Constant,
		constants_size: _c.int,
		attributes: [64] IHash_Index,
		textures: [64] IHash_Index,
		shader: rawptr,
		data: ^u8,
		length: _c.int,
		type: _c.int,
	}
	Texture_Unit_Impl :: struct {
		unit: _c.int,
		vertex: _c.bool,
	}
	Constant_Location_Impl :: struct  {
		vertex_offset: u32,
		vertex_size: u32,
		fragment_offset: u32,
		fragment_size: u32,
		geometry_offset: u32,
		geometry_size: u32,
		tess_eval_offset: u32,
		tess_eval_size: u32,
		tess_control_offset: u32,
		tess_control_size: u32,

		vertex_columns: u8,
		vertex_rows: u8,
		fragment_columns: u8,
		fragment_rows: u8,
		geometry_columns: u8,
		geometry_rows: u8,
		tess_eval_columns: u8,
		tess_eval_rows: u8,
		tess_control_columns: u8,
		tess_control_rows: u8,
	}
	//i don't want to import all the id3d11 stuff, but everything here is a pointer so yeah, we don't need the impl actually
	Pipeline_Impl :: struct {
		input_layout: rawptr,
		fragment_constant_buffer: rawptr,
		vertex_constant_buffer: rawptr,
		geometry_constant_buffer: rawptr,
		tess_eval_constant_buffer: rawptr,
		tess_control_constant_buffer: rawptr,
		depth_stencil_state: rawptr,
		rasterizer_state: rawptr,
		resterizer_state_scissor: rawptr,
		blend_state: rawptr,
	}
	Index_Buffer_Impl :: struct {
		ib: rawptr, //ID3D11BUFER
		indices: ^_c.int,
		count: _c.int,
	}
	Vertex_Buffer_Impl :: struct {
		vb: rawptr,
		stride: _c.int,
		count: _c.int,
		lock_start: _c.int,
		lock_count: _c.int,
		vertices: ^_c.float,
		usage: _c.int,
	}
	Texture_Impl :: struct {
		has_mipmaps: _c.bool,
		stage: _c.int,
		texture: rawptr,
		texture3d: rawptr,
		view: rawptr,
		compute_view: rawptr,
		render_view: rawptr,
	}
	Render_Target_Impl :: struct {
		texture_render: rawptr,
		texture_sample: rawptr,
		texture_staging: rawptr,
		render_target_view_render: [6]rawptr, // [6]
		render_target_view_sample: [6]rawptr,
		depth_stencil: rawptr,
		depth_stencil_view: [6]rawptr,
		render_target_srv: rawptr,
		depth_stencil_srv: rawptr,
		format: _c.int,
	}
	Texture_Array_Impl :: struct  {
		texture: rawptr,
		view: rawptr,
	}
} else when GRAPHICS_API == .GL {
	Shader_Impl :: struct {
		_glid: _c.uint,
		source: cstring,
		length: _c.size_t,
		from_source: _c.bool,
	}
	Texture_Unit_Impl :: struct {
		unit: _c.int,
	}
	Constant_Location_Impl :: struct  {
		location: _c.int,
		type: _c.uint,
	}
	Pipeline_Impl :: struct  {
		program_id: _c.uint,
		textures: ^^_c.char, // char **textures ?????
		texture_values: ^_c.int,
		texture_count: _c.int,
	}
	Index_Buffer_Impl :: struct  {
		short_data: ^u16, //uint16_t
		data: ^_c.int,
		my_count: _c.int,
		buffer_id: _c.uint,
	}
	Vertex_Buffer_Impl :: struct  {
		data: ^_c.float,
		my_count: _c.int,
		my_stride: _c.int,
		buffer_id: _c.uint,
		usage: _c.uint,
		section_start: _c.int,
		section_size: _c.int,
		structure: Vertex_Structure,
		instance_data_step_rate: _c.int,
		initialized: _c.bool
		// NDEBUB >>. initialized
	}
	Texture_Impl :: struct  {
		texture: _c.uint,
		// ANDROID >>> bool external_oes,
		pixfmt: u8,
	}
	Render_Target_Impl :: struct  {
		_framebuffer: _c.uint,
		_texture: _c.uint,
		_depth_texture: _c.uint,
		_has_depth: _c.bool,

		context_id: _c.int,
		format: _c.int,
	}
	Texture_Array_Impl :: struct  {
		texture: _c.uint,
	}
}
