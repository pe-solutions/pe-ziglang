const std = @import("std");

pub fn main() !void {
    const limit: u32 = 4_000_000;
    
    var sum: u32 = 10;

    var a: u32 = 2;
    var b: u32 = 8;
    
    var c: u32 = a + 4*b;
    
    while (c < limit) {
        sum += c;
        
        a = b;
        b = c;
        
        c = a + 4*b;
    }

    std.debug.print("\nSum: {}\n", .{sum});
}
