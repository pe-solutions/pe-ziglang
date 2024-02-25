const std = @import("std");

pub fn main() !void {
    const limit: u32 = 4_000_000;
    
    var sum: u32 = 0;
    
    var a: u32 = 1;
    var b: u32 = 1;
    
    var c: u32 = a + b;
    
    while (c < limit) {
        sum += c;
        
        a = b + c;
        b = c + a;
        
        c = a + b;
    }

    std.debug.print("\nSum: {}\n", .{sum});
}
