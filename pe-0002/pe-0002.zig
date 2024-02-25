// Even Fibonacci Numbers
// https://projecteuler.net/problem=2

const std = @import("std");
const time = std.time;
const Instant = time.Instant;
const print = std.debug.print;

pub fn main() !void {
    const start = try Instant.now();

    const answer = evenFibonacciNumbers();

    const end = try Instant.now();
    const duration: f64 = @floatFromInt(end.since(start));

    print("\nProject Euler #2\nAnswer: {}\n", .{ answer });
    print("Elapsed time: {d:.0} milliseconds.\n\n", .{duration / time.ns_per_ms});
}

pub fn evenFibonacciNumbers() u32 {
    // Upper limit
    const limit: u32 = 4_000_000;
    
    var sum: u32 = 10;
    
    // First terms of the sequences
    var a: u32 = 2;
    var b: u32 = 8;
    
    // Next term. Apply Closed form to them
    var c: u32 = a + 4*b;
    
    while (c < limit) {
        sum += c;
        
        // Shift
        a = b;
        b = c;
        
        // Calculate next sequence
        c = a + 4*b;
    }

    return sum;
}
