#![crate_type = "staticlib"]
extern crate libc;
extern crate rayon;

use rayon::prelude::*;

#[no_mangle]
pub extern "C" fn rust_sum(size: libc::size_t,
                           array_pointer: *const libc::int32_t)
                           -> libc::int32_t {
    return internal_rust_sum(unsafe {
        std::slice::from_raw_parts(array_pointer as *const i32, size as usize)
    }) as libc::int32_t;
}

fn internal_rust_sum(array: &[i32]) -> i32 {
    assert!(!array.is_empty());
    return array.into_par_iter().map(|&a| a).sum();
}
