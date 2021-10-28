module main

import gst

fn main() {
	println('GStreamer version: ${gst.version()}')

	exec_path := gst.get_main_executable_path()
	println('path: ${exec_path}')

	gst.initialize()

	if gst.is_initialized() {
		println('GStreamer is initialized.')
	} else {
		println('GStreamer is not initialized.')
	}

	gst.deinitialize()

	if gst.is_initialized() {
		println('GStreamer is still initialized.')
	} else {
		println('GStreamer is deinitialized.')
	}
}