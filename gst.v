// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module gst

#include <gst/gst.h>

#flag -l pthread 
#flag -I /usr/local/include 
#flag -I /usr/local/include/glib-2.0 
#flag -I /usr/local/lib/x86_64-linux-gnu/glib-2.0/include 
#flag -I /usr/include/gstreamer-1.0 
#flag -L /usr/local/lib/x86_64-linux-gnu 
#flag -l gstreamer-1.0 
#flag -l gobject-2.0 
#flag -l glib-2.0


fn C.gst_init(&int, &&&char)
pub fn initialize() {
	C.gst_init(voidptr(0), 0)
}

fn C.gst_is_initialized() C.gboolean
pub fn is_initialized() bool {
	rc := C.gst_is_initialized()
	return rc == C.gboolean(1)
}

fn C.gst_deinit()
pub fn deinitialize() {
	C.gst_deinit()
}

fn C.gst_version_string() &char
pub fn version() string {
	mut tmp_str := ''
	unsafe {
		rc := C.gst_version_string()
		if rc == voidptr(0) {
			tmp_str = '[null]'
		} else {
			tmp_str = cstring_to_vstring(rc)
		}
	}
	return tmp_str
}

fn C.gst_segtrap_is_enabled() C.gboolean
pub fn segtrap_is_enabled() bool {
	rc := C.gst_segtrap_is_enabled()
	return rc == C.gboolean(1)
}

fn C.gst_segtrap_set_enabled(C.gboolean)

pub fn segtrap_enable() {
	C.gst_segtrap_set_enabled(C.gboolean(1))
}

pub fn segtrap_disable() {
	C.gst_segtrap_set_enabled(C.gboolean(0))
}

fn C.gst_registry_fork_is_enabled() C.gboolean
pub fn registry_fork_is_enabled() bool {
	rc := C.gst_registry_fork_is_enabled()
	return rc == C.gboolean(1)
}

fn C.gst_registry_fork_set_enabled(C.gboolean)

pub fn registry_fork_set_enabled() {
	C.gst_registry_fork_set_enabled(C.gboolean(1))
}

pub fn registry_fork_set_disable() {
	C.gst_registry_fork_set_enabled(C.gboolean(0))
}

fn C.gst_update_registry() C.gboolean
pub fn update_registry() bool {
	rc := C.gst_update_registry()
	return rc == C.gboolean(1)
}

fn C.gst_get_main_executable_path() &char
pub fn get_main_executable_path() string {
	mut tmp_str := ''
	unsafe {
		rc := C.gst_get_main_executable_path()
		if rc == voidptr(0) {
			tmp_str = '[null]'
		} else {
			tmp_str = cstring_to_vstring(rc)
		}
	}
	return tmp_str
}
