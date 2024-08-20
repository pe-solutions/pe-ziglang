//! Lychrel Numbers
//! https://projecteuler.net/problem=55

const std = @import("std");
const time = std.time;
const Instant = time.Instant;
const print = std.debug.print;

fn reverse_digits(n: u128) u128 {
    var reversed: u128 = 0;
    var num = n;
    while (num > 0) {
        const digit = num % 10;
        const reversed_new = reversed * 10 + digit;
        reversed = reversed_new;
        num /= 10;
    }
    return reversed;
}

fn is_palindrome(n: u128) bool {
    return n == reverse_digits(n);
}

fn is_lychrel(n: u128) bool {
    var current = n;
    const max_iterations = 50;
    var i: usize = 0;
    while (i < max_iterations) {
        const reversed_current = reverse_digits(current);
        if (reversed_current == 0) {
            return true; // Treat as Lychrel if overflow occurs
        }
        const current_new = current + reversed_current;
        if (current_new < current) {
            // Overflow detected
            std.debug.print("Overflow detected in is_lychrel for n: {}\n", .{n});
            return true; // Treat as Lychrel if overflow occurs
        }
        current = current_new;
        if (is_palindrome(current)) {
            return false;
        }
        i += 1;
    }
    return true;
}

pub fn main() !void {
    const start = try Instant.now();
    
    var lychrel_count: usize = 0;

    var n: u128 = 1;
    while (n < 10000) {
        if (is_lychrel(n)) {
            lychrel_count += 1;
        }
        n += 1;
    }
    
    const end = try Instant.now();
    const duration: f64 = @floatFromInt(end.since(start));
    
    print("\nProject Euler #55\nAnswer: {}\n", .{lychrel_count});
    print("Elapsed time: {d:.0} milliseconds.\n\n", .{duration / time.ns_per_ms});    
}
