const std = @import("std");

pub fn main() !void {
    const limit: u32 = 4_000_000;
    
    var sum: u32 = 0;
    
    var a: u32 = 1;
    var b: u32 = 1;

    while (b < limit) {
        // Filtering
        if (@mod(b, 2) == 0) {
            sum += b;
        }
        
        const h = a + b;
        
        a = b;
        b = h;
    }

    std.debug.print("Sum: {}\n", .{sum});
}
