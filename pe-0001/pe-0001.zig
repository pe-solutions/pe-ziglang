//! Multiples of 3 or 5
//! https://projecteuler.net/problem=1

const std = @import("std");
const time = std.time;
const Instant = time.Instant;
const print = std.debug.print;

pub fn main() !void {
    const start = try Instant.now();

    const answer = multiplesOf3or5(1_000);

    const end = try Instant.now();
    const duration: f64 = @floatFromInt(end.since(start));

    print("\nProject Euler #2\nAnswer: {}\n", .{answer});
    print("Elapsed time: {d:.0} milliseconds.\n\n", .{duration / time.ns_per_ms});
}

fn multiplesOf3or5(limit: usize) usize {
    var answer: usize = 0;

    var i: usize = 1;

    while (i < limit) : (i += 1) {
        if (gcd(i, 3 * 5) > 1) {
            answer += i;
        }
    }

    return answer;
}

fn gcd(u: usize, v: usize) usize {
    if (v != 0) {
        return gcd(v, u % v);
    } else {
        return u;
    }
}

// Test
test "Sum of multiples below 10" {
    const result = multiplesOf3or5(10);
    try std.testing.expectEqual(result, 23);
}
