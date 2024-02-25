// Largest Prime Factor
// https://projecteuler.net/problem=3

const std = @import("std");
const time = std.time;
const Instant = time.Instant;
const print = std.debug.print;

pub fn main() !void {
    
    const start = try Instant.now();
    
    const answer = largestPrimeFactor(600_851_475_143);
    
    const end = try Instant.now();
    const duration: f64 = @floatFromInt(end.since(start));
    
    print("\nProject Euler #3\nAnswer: {}\n", .{answer});
    print("Elapsed time: {d:.0} milliseconds.\n\n", .{duration / time.ns_per_ms});
}

fn largestPrimeFactor(factor: i64) i64 {
    var n: i64 = factor;
    var d: i64 = 3;
    
    while (d * d < n) {
        if (@rem(n, d) == 0) {
            n = @divTrunc(n, d);
        } else {
            d += 2;
        }
    }

    return n;
}

// Test
test "The prime factors of 13_195" {
    const result = largestPrimeFactor(13_195);
    try std.testing.expectEqual(result, 29);
}